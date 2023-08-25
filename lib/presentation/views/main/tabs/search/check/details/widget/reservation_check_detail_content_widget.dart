import 'package:flutter/material.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';

class ReservationCheckDetailContentWidget extends StatelessWidget {
  final String title;
  final String content;
  final Color? contentColor;

  const ReservationCheckDetailContentWidget({
    Key? key,
    required this.title,
    this.content = '',
    this.contentColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: ColorsConstants.guideText,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          content,
          style: TextStyle(
            color: contentColor ?? ColorsConstants.divider,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
