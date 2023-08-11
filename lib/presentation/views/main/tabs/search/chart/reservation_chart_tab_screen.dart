
import 'package:flutter/material.dart';

class ReservationChartTabScreen extends StatefulWidget {
  const ReservationChartTabScreen({Key? key}) : super(key: key);

  @override
  State<ReservationChartTabScreen> createState() => _ReservationChartTabScreenState();
}

class _ReservationChartTabScreenState extends State<ReservationChartTabScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("예약 차트"),
    );
  }
}
