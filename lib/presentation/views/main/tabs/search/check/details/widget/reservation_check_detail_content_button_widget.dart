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
        TextButton.icon(
          onPressed: onClickEvent,
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(0.0),
            overlayColor: MaterialStateProperty.all<Color>(
              ColorsConstants.calendarCurrentColor,
            ),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.zero,
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              ColorsConstants.background,
            ),
          ),
          icon: Icon(contentIcon, size: 18),
          label: Text(
            content,
            style: TextStyle(
              color: contentColor ?? ColorsConstants.divider,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
