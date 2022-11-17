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
  static const betweenSpace = 1;

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
          toY:  events != 0 ? events: getMaxXAxis() + (betweenSpace * 3),
          color: events != 0 ? eventColor : Colors.transparent,
          width: 5,
        ),
        BarChartRodData(
          fromY: events + betweenSpace,
          toY: events + betweenSpace + success,
          color: successColor,
          width: 5,
        ),
        BarChartRodData(
          fromY: events != 0? events + betweenSpace + success + betweenSpace:0,
          toY: error != 0 ? events + betweenSpace + success + betweenSpace + error
          :getMaxXAxis() + (betweenSpace * 3),
          color: error != 0 ? errorColor : Colors.black.withOpacity(0.03),
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

  int getMaxXAxis() {
    int te=0, se=0, ee=0;
    for (var data in chartData) {
      if(te <= data[0]) te = data[0];
      if(se <= data[1]) se = data[1];
      if(ee <= data[2]) ee = data[2];
    }
    return te+se+ee;
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.sp),
      child: Container(
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: const Color(0xFFFAFAFA).withOpacity(0.05),
          border: Border.all(color: const Color(0xFFF1F3F2))
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
                  maxY: getMaxXAxis() + (betweenSpace * 3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}