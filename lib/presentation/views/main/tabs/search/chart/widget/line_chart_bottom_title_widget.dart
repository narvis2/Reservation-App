
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';

class LineChartBottomTitleWidget extends StatelessWidget {
  final double value;
  final TitleMeta meta;

  const LineChartBottomTitleWidget({
    Key? key,
    required this.value,
    required this.meta,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyles = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
      color: ColorsConstants.chartTitle
    );

    Widget textWidget;

    switch (value.toInt()) {
      case 2:
        textWidget = const Text('Feb.', style: textStyles);
        break;
      case 4:
        textWidget = const Text('Apr.', style: textStyles);
        break;
      case 6:
        textWidget = const Text('Jun.', style: textStyles);
        break;
      case 8:
        textWidget = const Text('Aug.', style: textStyles);
        break;
      case 10:
        textWidget = const Text('Oct.', style: textStyles);
        break;
      case 12:
        textWidget = const Text('Dec.', style: textStyles);
        break;
      default:
        textWidget = Container();
    }

    return SideTitleWidget(axisSide: meta.axisSide, child: textWidget);
  }
}