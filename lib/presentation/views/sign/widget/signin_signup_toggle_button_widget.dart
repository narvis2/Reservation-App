import 'package:flutter/material.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/views/common/check_box_widget.dart';

class SignInSignUpToggleButtonWidget extends StatelessWidget {
  final bool isChecked;
  final String title;
  final void Function() onClickEvent;

  const SignInSignUpToggleButtonWidget({
    Key? key,
    required this.isChecked,
    required this.title,
    required this.onClickEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CheckBoxWidget(
          isChecked: isChecked,
          onClickEvent: onClickEvent,
        ),
        SizedBox(width: 9),
        DefaultTextStyle(
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: ColorsConstants.strokeColor,
            letterSpacing: -0.03,
          ),
          child: Text(title),
        )
      ],
    );
  }
}
