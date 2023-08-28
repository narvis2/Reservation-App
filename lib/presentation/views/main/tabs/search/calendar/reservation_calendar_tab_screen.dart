
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ReservationCalendarTabScreen extends StatefulWidget {
  const ReservationCalendarTabScreen({Key? key}) : super(key: key);

  @override
  State<ReservationCalendarTabScreen> createState() => _ReservationCalendarTabScreenState();
}

class _ReservationCalendarTabScreenState extends State<ReservationCalendarTabScreen> {
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ko_KR',
      firstDay: DateTime(DateTime.now().year),
      lastDay: DateTime(DateTime.now().year + 1),
      focusedDay: DateTime.now(),
    );
  }
}
