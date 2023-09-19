import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';

class LineChartLeftTitleWidget extends StatelessWidget {
  final double value;
  final TitleMeta meta;

  const LineChartLeftTitleWidget({
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
      case 1:
        textWidget = const Text('1', style: textStyles);
        break;
      case 5:
        textWidget = const Text('5', style: textStyles);
        break;
      case 10:
        textWidget = const Text('10', style: textStyles);
        break;
      case 15:
        textWidget = const Text('15', style: textStyles);
        break;
      case 20:
        textWidget = const Text('20', style: textStyles);
        break;
      default:
        textWidget = Container();
    }

    return textWidget;
  }
}
