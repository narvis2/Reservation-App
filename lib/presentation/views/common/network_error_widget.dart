import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';

class NetworkErrorWidget extends StatelessWidget {
  final String errorMessage;
  const NetworkErrorWidget({
    Key? key,
    required this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lottie/warning_status_animation.json',
              animate: true,
              width: 150,
              height: 150,
              repeat: false,
            ),
            Text(
              errorMessage,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: ColorsConstants.primary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
