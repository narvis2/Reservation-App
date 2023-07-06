import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';

class ReservationAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const ReservationAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        "예약하기",
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: ColorsConstants.divider,
        ),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new,
          color: ColorsConstants.divider,
        ),
        onPressed: () {
          AutoRouter.of(context).back();
        },
      ),
      elevation: 3,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
