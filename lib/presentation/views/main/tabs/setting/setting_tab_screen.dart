import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/utils/dialog_utils.dart';
import 'package:reservation_app/presentation/views/main/tabs/setting/widget/app_setting_content_widget.dart';
import 'package:reservation_app/presentation/views/main/tabs/setting/widget/app_version_widget.dart';
import 'package:reservation_app/presentation/views/main/tabs/setting/widget/profile_widget.dart';
import 'package:reservation_app/presentation/views/main/tabs/setting/widget/setting_category_title_widget.dart';
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

  @override
  void initState() {
    super.initState();
    _userInfoBloc = BlocProvider.of<UserInfoBloc>(context);
    _signBloc = BlocProvider.of<SignBloc>(context)..add(SignInitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              GestureDetector(
                onTap: () {
                  DialogUtils.showSignInSignUpDialog(
                    context: context,
                  );
                },
                child: Container(
                  height: 64,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: AlignmentDirectional.center,
                  child: ProfileWidget(),
                ),
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
              BlocSelector<SignBloc, SignState, bool>(
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
              SettingCategoryTitleWidget(title: "앱 정보"),
              AppVersionWidget(),
              Divider(
                color: ColorsConstants.settingDivider,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
