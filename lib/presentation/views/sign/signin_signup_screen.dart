import 'package:flutter/material.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/views/sign/widget/signin_signup_button_widget.dart';
import 'package:reservation_app/presentation/views/sign/widget/signin_signup_input_widget.dart';
import 'package:reservation_app/presentation/views/sign/widget/signin_signup_title_area_widget.dart';
import 'package:reservation_app/presentation/views/sign/widget/signin_signup_toggle_button_widget.dart';

class SignInSignUpScreen extends StatelessWidget {
  final BuildContext buildContext;

  final bool isSavedId;
  final bool isAutoLogin;

  final GlobalKey<FormFieldState<dynamic>> idKey;
  final GlobalKey<FormFieldState<dynamic>> pwKey;

  final TextEditingController idController;
  final TextEditingController pwController;

  final void Function() onToggleSavedId;
  final void Function() onToggleAutoLogin;

  final void Function(String value) onIdSubmitted;
  final void Function(String value) onPwSubmitted;

  final void Function(String value) onChangeId;
  final void Function(String value) onChangePw;

  final String? Function(String? value) onValidChangeId;
  final String? Function(String? value) onValidChangePw;

  final void Function() onClickSignIn;
  final void Function()? onClickSignUp;

  const SignInSignUpScreen({
    Key? key,
    required this.buildContext,
    required this.isSavedId,
    required this.isAutoLogin,
    required this.idKey,
    required this.pwKey,
    required this.idController,
    required this.pwController,
    required this.onToggleSavedId,
    required this.onToggleAutoLogin,
    required this.onIdSubmitted,
    required this.onPwSubmitted,
    required this.onChangeId,
    required this.onChangePw,
    required this.onValidChangeId,
    required this.onValidChangePw,
    required this.onClickSignIn,
    this.onClickSignUp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.dialogBackground,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: ColorsConstants.background,
                  borderRadius: BorderRadius.circular(20), // 여기에 반지름 값을 설정합니다
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SignInSignUpTitleAreaWidget(),
                      Divider(
                        color: ColorsConstants.boldColor,
                      ),
                      Container(
                        constraints: const BoxConstraints.expand(height: 30.0),
                      ),
                      SignInSignUpInputWidget(
                        inputKey: idKey,
                        textController: idController,
                        helperText: "이메일 형식으로 입력해주세요.",
                        hintText: '이메일을 입력해주세요.',
                        labelText: "이메일",
                        iconData: Icons.email_outlined,
                        onSubmitted: onIdSubmitted,
                        onChange: onChangeId,
                        onValidChange: onValidChangeId,
                      ),
                      Container(
                        constraints: const BoxConstraints.expand(height: 30.0),
                      ),
                      SignInSignUpInputWidget(
                        inputKey: pwKey,
                        textController: pwController,
                        helperText: "비밀번호 입력",
                        hintText: '비밀번호를 입력해주세요.',
                        labelText: "비밀번호",
                        iconData: Icons.lock,
                        onSubmitted: onPwSubmitted,
                        onChange: onChangePw,
                        onValidChange: onValidChangePw,
                      ),
                      Container(
                        constraints: const BoxConstraints.expand(height: 30.0),
                      ),
                      Row(
                        children: [
                          SignInSignUpToggleButtonWidget(
                            isChecked: isSavedId,
                            title: '아이디 저장',
                            onClickEvent: () {

                            },
                          ),
                          SignInSignUpToggleButtonWidget(
                            isChecked: isAutoLogin,
                            title: '자동 로그인',
                            onClickEvent: () {

                            },
                          ),
                        ],
                      ),
                      Container(
                        constraints: const BoxConstraints.expand(height: 10.0),
                      ),
                      SignInSignUpButtonWidget(
                        title: "로그인",
                        onClickSignIn: onClickSignIn,
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
                    Navigator.of(buildContext).pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
