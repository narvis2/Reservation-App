import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/domain/model/member/member_model.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/utils/dialog_utils.dart';
import 'package:reservation_app/presentation/utils/snack_bar_utils.dart';
import 'package:reservation_app/presentation/views/main/tabs/setting/widget/app_setting_content_widget.dart';
import 'package:reservation_app/presentation/views/main/tabs/setting/widget/app_version_widget.dart';
import 'package:reservation_app/presentation/views/main/tabs/setting/widget/profile_widget.dart';
import 'package:reservation_app/presentation/views/main/tabs/setting/widget/setting_category_title_widget.dart';
import 'package:reservation_app/presentation/views/main/tabs/setting/widget/sign_out_widget.dart';
import 'package:reservation_app/presentation/views/sign/bloc/sign_bloc.dart';
import 'package:reservation_app/presentation/views/user/bloc/user_info_bloc.dart';

class SettingTabScreen extends StatefulWidget {
  const SettingTabScreen({Key? key}) : super(key: key);

  @override
  State<SettingTabScreen> createState() => _SettingTabScreenState();
}

class _SettingTabScreenState extends State<SettingTabScreen> {
  late final UserInfoBloc _userInfoBloc;
  late final SignBloc _signBloc;
  late final NavigatorState _navigator;

  @override
  void initState() {
    super.initState();
    _userInfoBloc = BlocProvider.of<UserInfoBloc>(context);
    _signBloc = BlocProvider.of<SignBloc>(context)..add(SignInitEvent());
    _navigator = Navigator.of(context);
  }

  void popBackStack() {
    if (_navigator.canPop()) {
      _navigator.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignBloc, SignState>(
      listenWhen: (previous, current) {
        return previous != current &&
            previous.signOutStatus != current.signOutStatus;
      },
      listener: (context, state) {
        if (state.signOutStatus == SignOutState.loading) {
          DialogUtils.showLoadingDialog(context);
        } else if (state.signOutStatus == SignOutState.success) {
          popBackStack();
          SnackBarUtils.showCustomSnackBar(context, "로그아웃 되셨습니다.");
          _userInfoBloc.add(UserInfoInitEvent());
          _signBloc.add(SignInitEvent());
        } else if (state.signOutStatus == SignOutState.error) {
          popBackStack();
          final errorMsg = state.signOutErrorMsg;
          SnackBarUtils.showCustomSnackBar(
            context,
            errorMsg ?? '로그아웃에 실패하였습니다.',
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsConstants.background,
          centerTitle: true,
          title: Text(
            "설정",
            style: TextStyle(
              color: ColorsConstants.boldColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 3,
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: [
                BlocSelector<UserInfoBloc, UserInfoState, MemberModel?>(
                  selector: (state) {
                    return state.memberModel;
                  },
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        if (state != null) return;
                        DialogUtils.showSignInSignUpDialog(
                          context: context,
                        );
                      },
                      child: Container(
                        height: 64,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        alignment: AlignmentDirectional.center,
                        child: ProfileWidget(
                          memberInfo: state,
                        ),
                      ),
                    );
                  },
                ),
                Divider(
                  color: ColorsConstants.thinDivider,
                  height: 1,
                ),
                SettingCategoryTitleWidget(title: "앱 설정"),
                BlocSelector<SignBloc, SignState, bool>(
                  bloc: _signBloc,
                  selector: (state) {
                    return state.isAutoLogin;
                  },
                  builder: (context, state) {
                    return AppSettingContentWidget(
                      isEnable: state,
                      title: "자동로그인",
                      onChange: (enable) {
                        _signBloc.add(SignIsAutoLoginEvent());
                      },
                    );
                  },
                ),
                Divider(
                  color: ColorsConstants.settingDivider,
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                ),
                BlocSelector<UserInfoBloc, UserInfoState, MemberModel?>(
                  selector: (state) {
                    return state.memberModel;
                  },
                  builder: (context, state) {
                    return Visibility(
                      visible: state != null,
                      child: BlocSelector<SignBloc, SignState, bool>(
                        bloc: _signBloc,
                        selector: (state) {
                          return state.isEnablePush;
                        },
                        builder: (context, state) {
                          return AppSettingContentWidget(
                            isEnable: state,
                            title: "Push 알림 (예약 안내﹒각종 이벤트)",
                            onChange: (enable) {
                              _signBloc.add(SignIsEnablePushEvent());
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
                SettingCategoryTitleWidget(title: "앱 정보"),
                AppVersionWidget(),
                Divider(
                  color: ColorsConstants.settingDivider,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),
                BlocSelector<UserInfoBloc, UserInfoState, MemberModel?>(
                  selector: (state) {
                    return state.memberModel;
                  },
                  builder: (context, state) {
                    return Visibility(
                      visible: state != null,
                      child: SignOutWidget(
                        onSignOutClick: () {
                          DialogUtils.showBasicDialog(
                            context: context,
                            title: "로그아웃",
                            message: "정말 로그아웃 하시겠습니까?",
                            enableCancelBtn: true,
                            onConfirmClick: () {
                              final memberId =
                                  _userInfoBloc.state.memberModel?.id;

                              if (memberId != null) {
                                _signBloc.add(
                                  SignOnSignOutClickEvent(
                                    memberId: memberId,
                                  ),
                                );
                              }
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
                BlocSelector<UserInfoBloc, UserInfoState, MemberModel?>(
                  selector: (state) {
                    return state.memberModel;
                  },
                  builder: (context, state) {
                    return Visibility(
                      visible: state != null,
                      child: SettingCategoryTitleWidget(title: ""),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
