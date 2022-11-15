import 'package:animate_do/animate_do.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'legend_widget.dart';

class ActivityLogs extends StatelessWidget {
  const ActivityLogs({super.key});

  static const pilateColor = Color(0xff578eff);
  static const cyclingColor = Color(0xffffb3ba);
  static const quickWorkoutColor = Color(0xa600732d);
  static const betweenSpace = 0.2;

  BarChartGroupData generateGroupData(
    int x,
    double pilates,
    double quickWorkout,
    double cycling,
  ) {
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: pilates,
          color: pilateColor,
          width: 5,
        ),
        BarChartRodData(
          fromY: pilates + betweenSpace,
          toY: pilates + betweenSpace + quickWorkout,
          color: quickWorkoutColor,
          width: 5,
        ),
        BarChartRodData(
          fromY: pilates + betweenSpace + quickWorkout + betweenSpace,
          toY: pilates + betweenSpace + quickWorkout + betweenSpace + cycling,
          color: cyclingColor,
          width: 5,
        ),
      ],
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff787694),
      fontSize: 10,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'SAT';
        break;
      case 1:
        text = 'SUN';
        break;
      case 2:
        text = 'MON';
        break;
      case 3:
        text = 'TUE';
        break;
      case 4:
        text = 'WED';
        break;
      case 5:
        text = 'THU';
        break;
      case 6:
        text = 'FRI';
        break;
      // case 7:
      //   text = 'AUG';
      //   break;
      // case 8:
      //   text = 'SEP';
      //   break;
      // case 9:
      //   text = 'OCT';
      //   break;
      // case 10:
      //   text = 'NOV';
      //   break;
      // case 11:
      //   text = 'DEC';
      //   break;
      default:
        text = '';
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.sp),
      child: FadeInUp(
        duration: const Duration(milliseconds: 1200),
        child: Container(
          padding: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: Colors.greenAccent.withOpacity(0.05),
              border: Border.all(color: const Color(0xFFF1F3F2))),
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
                          getTitlesWidget: bottomTitles,
                          reservedSize: 16,
                        ),
                      ),
                    ),
                    barTouchData: BarTouchData(enabled: false),
                    borderData: FlBorderData(show: false),
                    gridData: FlGridData(show: false),
                    barGroups: [
                      generateGroupData(0, 2, 3, 2),
                      generateGroupData(1, 2, 5, 1.7),
                      generateGroupData(2, 1.3, 3.1, 2.8),
                      generateGroupData(3, 3.1, 4, 3.1),
                      generateGroupData(4, 0.8, 3.3, 3.4),
                      generateGroupData(5, 2, 5.6, 1.8),
                      generateGroupData(6, 1.3, 3.2, 2),
                      // generateGroupData(7, 2.3, 3.2, 3),
                      // generateGroupData(8, 2, 4.8, 2.5),
                      // generateGroupData(9, 1.2, 3.2, 2.5),
                      // generateGroupData(10, 1, 4.8, 3),
                      // generateGroupData(11, 2, 4.4, 2.8),
                    ],
                    maxY: 10 + (betweenSpace * 3),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
