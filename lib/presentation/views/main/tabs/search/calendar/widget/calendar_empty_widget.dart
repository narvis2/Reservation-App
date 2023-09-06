import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';

class CalendarEmptyWidget extends StatelessWidget {
  final String message;
  const CalendarEmptyWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Lottie.asset(
            'assets/lottie/empty_animation.json',
            animate: true,
            width: 100,
            height: 100,
            repeat: false,
          ),
          Text(
            message,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: ColorsConstants.guideText,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
