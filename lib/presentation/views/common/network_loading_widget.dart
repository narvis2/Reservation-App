import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NetworkLoadingWidget extends StatelessWidget {
  const NetworkLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/lottie/loading_animation.json',
        animate: true,
        width: 73,
        height: 73,
        repeat: true,
      ),
    );
  }
}
