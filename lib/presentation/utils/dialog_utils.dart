import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DialogUtils {
  static showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: Lottie.asset(
          'assets/lottie/loading_animation.json',
          animate: true,
          width: 73,
          height: 73,
          repeat: true,
        ),
      ),
    );
  }
}
