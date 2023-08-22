import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';

class EmptyWidget extends StatelessWidget {
  final String message;

  const EmptyWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/lottie/empty_animation.json',
            animate: true,
            width: 150,
            height: 150,
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
