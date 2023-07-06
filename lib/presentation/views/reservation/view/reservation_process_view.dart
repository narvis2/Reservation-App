
import 'package:flutter/material.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';

import 'reservation_first_process_view.dart';
import 'reservation_process_top_view.dart';

class ReservationProcessView extends StatefulWidget {
  const ReservationProcessView({Key? key}) : super(key: key);

  @override
  State<ReservationProcessView> createState() => _ReservationProcessViewState();
}

class _ReservationProcessViewState extends State<ReservationProcessView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReservationProcessTopView(),
        Container(
          constraints: const BoxConstraints.expand(height: 10.0),
        ),
        Divider(
          height: 1,
          thickness: 3,
          indent: 15,
          endIndent: 15,
          color: ColorsConstants.inProgressColor,
        ),
        ReservationFirstProcessView(),
      ],
    );
  }
}
