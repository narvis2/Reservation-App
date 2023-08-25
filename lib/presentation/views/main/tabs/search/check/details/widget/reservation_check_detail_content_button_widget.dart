import 'package:flutter/material.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';

class ReservationCheckDetailContentButtonWidget extends StatelessWidget {
  final String title;
  final String content;
  final IconData contentIcon;
  final void Function() onClickEvent;
  final Color? contentColor;

  const ReservationCheckDetailContentButtonWidget({
    Key? key,
    required this.title,
    required this.content,
    required this.contentIcon,
    required this.onClickEvent,
    this.contentColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: ColorsConstants.guideText,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        InkWell(
          onTap: onClickEvent,
          child: Row(
            children: [
              Icon(
                contentIcon,
                color: ColorsConstants.inProgressColor,
              ),
              SizedBox(width: 5,),
              Text(
                content,
                style: TextStyle(
                  color: contentColor ?? ColorsConstants.divider,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
