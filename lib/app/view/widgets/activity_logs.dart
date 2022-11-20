import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'legend_widget.dart';

class ActivityLogs extends StatelessWidget {
  final List<String> bottomTitles;
  final List<List<int>> chartData;

  const ActivityLogs(
      {super.key, required this.bottomTitles, required this.chartData});

  static const eventColor = Color(0xFFFFBD44);
  static const errorColor = Color(0xFFFE605C);
  static const successColor = Color(0xFF00CA4E);
  static const emptyColor = Color(0x599ca3af);
  static const betweenSpace = 0.2;
  static double barMaxHeight = 0.0;

  double getMaxXAxis() {
    int te = 0, se = 0, ee = 0;
    for (var data in chartData) {
      if (te <= data[0]) te = data[0];
      if (se <= data[1]) se = data[1];
      if (ee <= data[2]) ee = data[2];
    }
    return te + se + ee + (betweenSpace * 2);
  }

  BarChartGroupData generateGroupData(
    int x,
    double events,
    double success,
    double error,
  ) {
    double eventFromY = 0;
    double eventToY = events != 0 ? events : 0;
    Color eventBarColor = eventColor;

    double successFromY = events != 0 ? eventToY + betweenSpace : 0;
    double successToY = events != 0 ? eventToY + betweenSpace + success : 0;
    Color successBarColor = successColor;

    double errorFromY = events != 0 ? successToY + betweenSpace : 0;
    double errorToY = events != 0 ? successToY + betweenSpace + error : 0;
    Color errorBarColor = errorColor;

    double inactiveFromY = 0;

    if (eventToY != 0) inactiveFromY = errorToY + betweenSpace;
    if (successToY != 0) inactiveFromY = successToY + betweenSpace;
    if (errorToY != 0) inactiveFromY = errorToY + betweenSpace;

    double inactiveToY = barMaxHeight;
    Color inactiveBarColor = emptyColor;

    return BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: [
        BarChartRodData(
          fromY: eventFromY,
          toY: eventToY,
          color: eventBarColor,
          width: 5,
        ),
        BarChartRodData(
          fromY: successFromY,
          toY: successToY,
          color: successBarColor,
          width: 5,
        ),
        BarChartRodData(
          fromY: errorFromY,
          toY: errorToY,
          color: errorBarColor,
          width: 5,
        ),
        BarChartRodData(
          fromY: inactiveFromY,
          toY: inactiveToY,
          color: inactiveBarColor,
          width: 5,
        ),
      ],
    );
  }

  Widget bottomTitlesWidget(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff787694),
      fontSize: 10,
    );
    String text = bottomTitles[value.toInt()];
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  @override
  Widget build(BuildContext context) {
    barMaxHeight = getMaxXAxis();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.sp),
      child: Container(
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: const Color(0xFFf8fafc),
          border: Border.all(color: const Color(0xFFF1F3F2)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LegendsListWidget(
              legends: [
                Legend('Events', eventColor),
                Legend('Success', successColor),
                Legend('Error', errorColor),
              ],
            ),
            const SizedBox(height: 14),
            AspectRatio(
              aspectRatio: 2.2,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceBetween,
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(),
                    rightTitles: AxisTitles(),
                    topTitles: AxisTitles(),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: bottomTitlesWidget,
                        reservedSize: 16,
                      ),
                    ),
                  ),
                  barTouchData: BarTouchData(enabled: false),
                  borderData: FlBorderData(show: false),
                  gridData: FlGridData(show: false),
                  barGroups: [
                    for (var i = 0; i <= chartData.length - 1; i++)
                      generateGroupData(
                          i,
                          chartData[i][0].toDouble(),
                          chartData[i][1].toDouble(),
                          chartData[i][2].toDouble())
                  ],
                  maxY: barMaxHeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
