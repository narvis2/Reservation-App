import 'package:flutter/material.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';

class SignOutWidget extends StatelessWidget {
  final Function() onSignOutClick;

  const SignOutWidget({
    Key? key,
    required this.onSignOutClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSignOutClick,
      child: Container(
        height: 48,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "로그아웃",
              style: TextStyle(
                fontSize: 14,
                color: ColorsConstants.boldColor,
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
        ),
      ),
    );
  }
}
