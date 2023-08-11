
import 'package:flutter/material.dart';

class ReservationCalendarTabScreen extends StatefulWidget {
  const ReservationCalendarTabScreen({Key? key}) : super(key: key);

  @override
  State<ReservationCalendarTabScreen> createState() => _ReservationCalendarTabScreenState();
}

class _ReservationCalendarTabScreenState extends State<ReservationCalendarTabScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("달력"),
    );
  }
}
