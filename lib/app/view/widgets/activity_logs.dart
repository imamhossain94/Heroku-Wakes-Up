import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'legend_widget.dart';

class ActivityLogs extends StatelessWidget {
  final List<String> bottomTitles;
  final List<List<int>> chartData;

  const ActivityLogs(
      {super.key, required this.bottomTitles, required this.chartData});

  static const pilateColor = Color(0xff578eff);
  static const cyclingColor = Color(0xffffb3ba);
  static const quickWorkoutColor = Color(0xa600732d);
  static const betweenSpace = 0.2;

  BarChartGroupData generateGroupData(
    int x,
    double events,
    double success,
    double error,
  ) {
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: events,
          color: pilateColor,
          width: 5,
        ),
        BarChartRodData(
          fromY: events + betweenSpace,
          toY: events + betweenSpace + success,
          color: quickWorkoutColor,
          width: 5,
        ),
        BarChartRodData(
          fromY: events + betweenSpace + success + betweenSpace,
          toY: events + betweenSpace + success + betweenSpace + error,
          color: cyclingColor,
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.sp),
      child: Container(
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: Colors.blue.withOpacity(0.1),
            //border: Border.all(color: const Color(0xFFF1F3F2)
          ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LegendsListWidget(
              legends: [
                Legend('Events', pilateColor),
                Legend('Success', quickWorkoutColor),
                Legend('Error', cyclingColor),
              ],
            ),
            const SizedBox(height: 14),
            AspectRatio(
              aspectRatio: 2,
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
                    for (var i = 0; i <= chartData.length-1; i++)
                      generateGroupData(
                          i,
                          chartData[i][0].toDouble(),
                          chartData[i][1].toDouble(),
                          chartData[i][2].toDouble())
                  ],
                  maxY: 10 + (betweenSpace * 3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
