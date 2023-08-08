import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/views/sign/bloc/sign_bloc.dart';
import 'package:reservation_app/presentation/views/sign/widget/signin_signup_button_widget.dart';
import 'package:reservation_app/presentation/views/sign/widget/signin_signup_input_widget.dart';
import 'package:reservation_app/presentation/views/sign/widget/signin_signup_title_area_widget.dart';
import 'package:reservation_app/presentation/views/sign/widget/signin_signup_toggle_button_widget.dart';

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

  final TextEditingController idController = TextEditingController();
  final TextEditingController pwController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _signBloc = BlocProvider.of<SignBloc>(context)..add(SignInitEvent());
  }

  @override
  void dispose() {
    idController.dispose();
    pwController.dispose();
    super.dispose();
  }

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
                        textController: idController,
                        helperText: "이메일 형식으로 입력해주세요.",
                        hintText: '이메일을 입력해주세요.',
                        labelText: "이메일",
                        iconData: Icons.email_outlined,
                        onSubmitted: (value) {},
                        onChange: (value) {},
                        onValidChange: (value) {
                          return null;
                        },
                      ),
                      Container(
                        constraints: const BoxConstraints.expand(height: 30.0),
                      ),
                      SignInSignUpInputWidget(
                        textController: pwController,
                        helperText: "비밀번호 입력",
                        hintText: '비밀번호를 입력해주세요.',
                        labelText: "비밀번호",
                        iconData: Icons.lock,
                        onSubmitted: (value) {},
                        onChange: (value) {},
                        onValidChange: (value) {
                          return null;
                        },
                      ),
                      Container(
                        constraints: const BoxConstraints.expand(height: 30.0),
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
                        constraints: const BoxConstraints.expand(height: 10.0),
                      ),
                      SignInSignUpButtonWidget(
                        title: "로그인",
                        onClickSignIn: () {
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
    );
  }
}
