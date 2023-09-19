import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';

class LineChartTopTitleWidget extends StatelessWidget {
  final double value;
  final TitleMeta meta;

  const LineChartTopTitleWidget({
    Key? key,
    required this.value,
    required this.meta,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      value.toInt().toString(),
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: ColorsConstants.calendarRangeColor,
      ),
    );
  }
}
