import 'package:flutter/material.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';

class CheckBoxWidget extends StatelessWidget {
  final bool isChecked;
  final void Function() onClickEvent;

  const CheckBoxWidget({
    Key? key,
    required this.isChecked,
    required this.onClickEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClickEvent,
      child: Container(
        width: 20,
        height: 20,
        margin: EdgeInsets.only(left: 20),
        decoration:  BoxDecoration(
          shape: BoxShape.circle,
          color: isChecked ? ColorsConstants.strokeColor : Colors.transparent,
          border: isChecked
              ? Border.all(
            color: ColorsConstants.primaryButtonBackgroundDisabled,
            width: 0,
          )
              : Border.all(
            color: ColorsConstants.primaryButtonBackgroundDisabled,
            width: 1.0,
          ),
        ),
        child: Icon(
          Icons.check,
          size: 12,
          color: isChecked ? ColorsConstants.background : ColorsConstants.primaryButtonBackgroundDisabled,
        ),
      ),
    );
  }
}
