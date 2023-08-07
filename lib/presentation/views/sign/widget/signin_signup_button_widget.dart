import 'package:flutter/material.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';

class SignInSignUpButtonWidget extends StatelessWidget {
  final String title;
  final void Function() onClickSignIn;

  const SignInSignUpButtonWidget({
    Key? key,
    required this.title,
    required this.onClickSignIn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 30),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                50.0,
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            ColorsConstants.strokeColor,
          ),
        ),
        child: Text(
          "로그인",
          style: TextStyle(
            color: ColorsConstants.background,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
