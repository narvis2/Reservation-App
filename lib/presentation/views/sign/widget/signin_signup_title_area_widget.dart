
import 'package:flutter/material.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';

class SignInSignUpTitleAreaWidget extends StatelessWidget {
  const SignInSignUpTitleAreaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Center(
        child: DefaultTextStyle(
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: ColorsConstants.boldColor,
            letterSpacing: -0.03,
          ),
          child: Text('로그인'),
        ),
      ),
    );
  }
}
