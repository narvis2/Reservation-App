
import 'package:flutter/material.dart';

class ReservationCheckTabScreen extends StatefulWidget {
  const ReservationCheckTabScreen({Key? key}) : super(key: key);

  @override
  State<ReservationCheckTabScreen> createState() => _ReservationCheckTabScreenState();
}

class _ReservationCheckTabScreenState extends State<ReservationCheckTabScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("예약 체크"),
    );
  }
}
