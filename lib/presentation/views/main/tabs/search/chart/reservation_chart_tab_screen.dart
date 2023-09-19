import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/chart/test/line_chart_sample_test_widget.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/chart/widget/line_chart_bottom_title_widget.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/chart/widget/line_chart_left_title_widget.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/chart/widget/line_chart_top_title_widget.dart';

class ReservationChartTabScreen extends StatefulWidget {
  const ReservationChartTabScreen({Key? key}) : super(key: key);

  @override
  State<ReservationChartTabScreen> createState() =>
      _ReservationChartTabScreenState();
}

class _ReservationChartTabScreenState extends State<ReservationChartTabScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            AspectRatio(
              aspectRatio: 1.3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: ColorsConstants.chartBackground,
                ),
                child: Column(
                  children: [
                    Container(
                      color: Colors.transparent,
                      height: 50,
                      child: Center(
                        child: Text(
                          '${DateTime.now().year}년 월별 예약 인원수 추이',
                          style: TextStyle(
                            color: ColorsConstants.calendarCurrentColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(child: LineChart(mainChart())),
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }

  LineChartData mainChart() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: ColorsConstants.chartBorder,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: ColorsConstants.chartBorder,
            strokeWidth: 1,
          );
        },
      ),
      // 꼭지점에 나오는 View
      lineTouchData: LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map((LineBarSpot touchedSpot) {
                final textStyle = TextStyle(
                  color: touchedSpot.bar.gradient?.colors[0] ??
                      touchedSpot.bar.color,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                );

                final title = touchedSpot.barIndex == 0
                    ? 'Part A'
                    : touchedSpot.barIndex == 1
                        ? 'Part B'
                        : 'Part C';

                return LineTooltipItem(
                  '$title : ${touchedSpot.y.toInt()}명',
                  textStyle,
                  textAlign: TextAlign.center,
                );
              }).toList();
            }),
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              interval: 1,
              getTitlesWidget: (value, meta) {
                return LineChartBottomTitleWidget(value: value, meta: meta);
              }),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: (value, meta) {
              return Center(
                  child: LineChartTopTitleWidget(
                value: value,
                meta: meta,
              ));
            },
            reservedSize: 35,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              return Center(
                child: LineChartLeftTitleWidget(
                  value: value,
                  meta: meta,
                ),
              );
            },
            reservedSize: 40,
            interval: 1,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              return Container();
            },
            reservedSize: 30,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(
            color: ColorsConstants.chartBorder,
            width: 4,
          ),
          right: BorderSide(
            color: ColorsConstants.chartBorder,
            width: 1,
          ),
          left: BorderSide(
            color: ColorsConstants.chartBorder,
            width: 1,
          ),
          top: BorderSide(
            color: ColorsConstants.chartBorder,
            width: 1,
          ),
        ),
      ),
      minX: 1,
      maxX: 12,
      minY: 0,
      maxY: 20,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(1, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
          ],
          isCurved: true,
          barWidth: 3,
          color: ColorsConstants.partTimeA,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            color: ColorsConstants.partTimeA.withOpacity(
              0.2,
            ),
          ),
        ),
        LineChartBarData(
          spots: [
            FlSpot(1, 1),
            FlSpot(2.6, 4),
            FlSpot(4.9, 1),
            FlSpot(6.8, 6),
            FlSpot(8, 3),
            FlSpot(9.5, 2),
          ],
          isCurved: true,
          color: ColorsConstants.partTimeB,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            color: ColorsConstants.partTimeB.withOpacity(
              0.2,
            ),
          ),
        ),
        LineChartBarData(
          spots: [
            FlSpot(1, 0),
            FlSpot(2, 2),
            FlSpot(2.6, 6),
            FlSpot(4, 0),
            FlSpot(5, 0),
            FlSpot(6.8, 4),
            FlSpot(8, 1),
            FlSpot(9.5, 5),
          ],
          isCurved: true,
          color: ColorsConstants.partTimeC,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            color: ColorsConstants.partTimeC.withOpacity(
              0.2,
            ),
          ),
        ),
      ],
    );
  }
}
