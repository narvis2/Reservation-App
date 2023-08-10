import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/utils/dialog_utils.dart';
import 'package:reservation_app/presentation/utils/obj_extensions.dart';
import 'package:reservation_app/presentation/utils/snack_bar_utils.dart';
import 'package:reservation_app/presentation/utils/text_utils.dart';
import 'package:reservation_app/presentation/views/sign/bloc/sign_bloc.dart';
import 'package:reservation_app/presentation/views/sign/enum/InputType.dart';
import 'package:reservation_app/presentation/views/sign/widget/signin_signup_button_widget.dart';
import 'package:reservation_app/presentation/views/sign/widget/signin_signup_input_widget.dart';
import 'package:reservation_app/presentation/views/sign/widget/signin_signup_title_area_widget.dart';
import 'package:reservation_app/presentation/views/sign/widget/signin_signup_toggle_button_widget.dart';
import 'package:reservation_app/presentation/views/user/bloc/user_info_bloc.dart';

class SignInSignUpScreen extends StatefulWidget {
  final BuildContext buildContext;

  const SignInSignUpScreen({
    Key? key,
    required this.buildContext,
  }) : super(key: key);

  @override
  State<SignInSignUpScreen> createState() => _SignInSignUpScreenState();
}

class _SignInSignUpScreenState extends State<SignInSignUpScreen> {
  late final SignBloc _signBloc;
  late final UserInfoBloc _userInfoBloc;

  final _formKey = GlobalKey<FormState>();
  final _idKey = GlobalKey<FormFieldState>();
  final _pwKey = GlobalKey<FormFieldState>();

  final TextEditingController idController = TextEditingController();
  final TextEditingController pwController = TextEditingController();

  final List<FocusNode> _focusNodes = List.generate(2, (index) => FocusNode());

  bool _isIdValidate = false;
  bool _isPwValidate = false;

  @override
  void initState() {
    super.initState();
    _signBloc = BlocProvider.of<SignBloc>(context)..add(SignInitEvent());
    _userInfoBloc = BlocProvider.of<UserInfoBloc>(context);

    _signBloc.state.savedEmail?.let((email) {
      idController.text = email;
      _isIdValidate = true;
    });
  }

  @override
  void dispose() {
    idController.dispose();
    pwController.dispose();
    for (var element in _focusNodes) {
      element.dispose();
    }
    super.dispose();
  }

  bool _isFocusInput(int index) {
    return _focusNodes[index].hasFocus;
  }

  void _onFocusOutInput(int index) {
    if (_isFocusInput(index)) {
      _focusNodes[index].unfocus();
    }
  }

  void _onFocusInput(BuildContext context, int index) {
    if (!_isFocusInput(index)) {
      FocusScope.of(context).requestFocus(_focusNodes[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignBloc, SignState>(
      listenWhen: (previous, current) {
        return previous != current &&
            previous.signInStatus != current.signInStatus;
      },
      listener: (context, state) {
        if (state.signInStatus == SignInStatus.loading) {
          DialogUtils.showLoadingDialog(context);
        } else if (state.signInStatus == SignInStatus.success) {
          Navigator.of(context).pop();
          SnackBarUtils.showCustomSnackBar(widget.buildContext, "로그인 되셨습니다.");
          _userInfoBloc.add(UserInfoUpdateFcmTokenEvent());
          Navigator.of(widget.buildContext).pop();
        } else if (state.signInStatus == SignInStatus.error) {
          Navigator.of(context).pop();
          idController.clear();
          pwController.clear();
          setState(() {
            _isIdValidate = false;
            _isPwValidate = false;
          });
        }
      },
      child: Scaffold(
        backgroundColor: ColorsConstants.dialogBackground,
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Center(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: ColorsConstants.background,
                      borderRadius: BorderRadius.circular(
                        20,
                      ), // 여기에 반지름 값을 설정합니다
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SignInSignUpTitleAreaWidget(),
                          Divider(
                            color: ColorsConstants.boldColor,
                          ),
                          Container(
                            constraints:
                                const BoxConstraints.expand(height: 10.0),
                          ),
                          SizedBox(
                            height: 30,
                            child: BlocBuilder<SignBloc, SignState>(
                              bloc: _signBloc,
                              builder: (context, state) {
                                final errorMsg = state.errorMessage;

                                return Text(
                                  state.signInStatus == SignInStatus.error &&
                                          errorMsg != null
                                      ? errorMsg
                                      : "관리자만 로그인이 가능해요..!",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: state.signInStatus ==
                                                SignInStatus.error &&
                                            errorMsg != null
                                        ? ColorsConstants.primary
                                        : ColorsConstants.boldColor,
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            constraints: const BoxConstraints.expand(
                              height: 10.0,
                            ),
                          ),
                          SignInSignUpInputWidget(
                            inputKey: _idKey,
                            textController: idController,
                            helperText: "이메일 형식으로 입력해주세요.",
                            hintText: '이메일을 입력해주세요.',
                            labelText: "이메일",
                            focusNode: _focusNodes[0],
                            isLock: false,
                            inputType: InputType.email,
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(
                                  RegExp(r'[^\w@.]'))
                            ],
                            onSubmitted: (value) {
                              _onFocusOutInput(0);
                              _onFocusInput(context, 1);
                            },
                            onChange: (value) {
                              setState(() {
                                _isIdValidate = value.isNotEmpty &&
                                    value.length > 4 &&
                                    TextUtils.isEmailValid(value);
                              });
                            },
                            onValidChange: (value) {
                              final text = value;
                              if (text == null ||
                                  text.isEmpty ||
                                  text.length < 4) {
                                return '5~20자 이내의 문자';
                              }

                              if (text.isNotEmpty &&
                                  !TextUtils.isEmailValid(text)) {
                                return '이메일 형식에 맞게 입력해주세요.';
                              }

                              return null;
                            },
                          ),
                          Container(
                            constraints: const BoxConstraints.expand(
                              height: 30.0,
                            ),
                          ),
                          SignInSignUpInputWidget(
                            inputKey: _pwKey,
                            textController: pwController,
                            helperText: "비밀번호 입력",
                            hintText: '비밀번호를 입력해주세요.',
                            labelText: "비밀번호",
                            focusNode: _focusNodes[1],
                            isLock: true,
                            inputType: InputType.password,
                            onSubmitted: (value) {
                              _onFocusOutInput(1);
                            },
                            onChange: (value) {
                              setState(() {
                                _isPwValidate = value.isNotEmpty &&
                                    value.length >= 8 &&
                                    TextUtils.isPasswordValid(value);
                              });
                            },
                            onValidChange: (value) {
                              final text = value;
                              if (text == null ||
                                  text.isEmpty ||
                                  text.length < 8) {
                                return '비밀번호는 최소 8자리 이상이여야 합니다.';
                              }

                              if (text.isNotEmpty &&
                                  !TextUtils.isPasswordValid(text)) {
                                return '1개 이상의 알파벳, 숫자, 특수문자를 포함해야합니다.';
                              }

                              return null;
                            },
                          ),
                          Container(
                            constraints: const BoxConstraints.expand(
                              height: 30.0,
                            ),
                          ),
                          Row(
                            children: [
                              BlocSelector<SignBloc, SignState, bool>(
                                bloc: _signBloc,
                                selector: (state) {
                                  return state.isSavedId;
                                },
                                builder: (context, state) {
                                  return SignInSignUpToggleButtonWidget(
                                    isChecked: state,
                                    title: '아이디 저장',
                                    onClickEvent: () {
                                      _signBloc.add(SignIsSavedIdEvent());
                                    },
                                  );
                                },
                              ),
                              BlocSelector<SignBloc, SignState, bool>(
                                bloc: _signBloc,
                                selector: (state) {
                                  return state.isAutoLogin;
                                },
                                builder: (context, state) {
                                  return SignInSignUpToggleButtonWidget(
                                    isChecked: state,
                                    title: '자동 로그인',
                                    onClickEvent: () {
                                      _signBloc.add(SignIsAutoLoginEvent());
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                          Container(
                            constraints: const BoxConstraints.expand(
                              height: 10.0,
                            ),
                          ),
                          SignInSignUpButtonWidget(
                            title: "로그인",
                            isValid: _isIdValidate && _isPwValidate,
                            onClickSignIn: () {
                              if (!_isIdValidate) {
                                _onFocusInput(context, 0);
                                return;
                              }

                              if (!_isPwValidate) {
                                _onFocusInput(context, 1);
                                return;
                              }

                              _signBloc.add(
                                SignOnSignInClickEvent(
                                  id: idController.text,
                                  password: pwController.text,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: -5,
                    right: 0,
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        size: 35,
                      ),
                      color: ColorsConstants.background,
                      onPressed: () {
                        Navigator.of(widget.buildContext).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
