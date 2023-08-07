
import 'package:flutter/material.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "로그인을 해주세요!",
          style: TextStyle(
            color: ColorsConstants.boldColor,
            fontSize: 14,
            letterSpacing: -0.02,
          ),
        ),
        AspectRatio(
          aspectRatio: 7 / 12,
          child: Icon(
            Icons.arrow_forward_ios_outlined,
            color: ColorsConstants.rightActionButton,
          ),
        ),
      ],
    );
  }
}
