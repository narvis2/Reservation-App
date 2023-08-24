import 'package:flutter/material.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';

class ReservationCheckDetailContentWidget extends StatelessWidget {
  final String title;
  final String content;

  const ReservationCheckDetailContentWidget({
    Key? key,
    required this.title,
    this.content = '',
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
            color: ColorsConstants.divider,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
