
import 'package:animate_do/animate_do.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

Widget eventsLifeLine() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.sp),
    child: FadeInUp(
      duration: const Duration(milliseconds: 1200),
      child: Container(
        height: (Get.size.width - 16) / 2,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: Colors.white,
            border: Border.all(color: const Color(0xFFF1F3F2))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 15.sp,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.sp),
              child: Row(
                children: [
                  Text(
                    'Daily Events',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 10.sp,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: LineChart(
                LineChartData(
                  lineTouchData: LineTouchData(
                    handleBuiltInTouches: true,
                    touchTooltipData: LineTouchTooltipData(
                      tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
                    ),
                  ),
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 32,
                        interval: 1,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          var style = TextStyle(
                            color: Colors.grey,
                            fontSize: 8.sp,
                          );
                          Widget text;
                          switch (value.toInt()) {
                            case 2:
                              text = Text('6:00 AM', style: style);
                              break;
                            case 7:
                              text = Text('12:00 AM', style: style);
                              break;
                            case 12:
                              text = Text('6:00 PM', style: style);
                              break;
                            default:
                              text = const Text('');
                              break;
                          }

                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            space: 10,
                            child: text,
                          );
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        getTitlesWidget: (double value, TitleMeta meta) {
                          var style = TextStyle(
                            color: const Color(0xff000000),
                            fontSize: 8.sp,
                          );
                          String text;
                          switch (value.toInt()) {
                            case 1:
                              text = '1m';
                              break;
                            case 2:
                              text = '2m';
                              break;
                            case 3:
                              text = '3m';
                              break;
                            case 4:
                              text = '5m';
                              break;
                            case 5:
                              text = '6m';
                              break;
                            default:
                              return Container();
                          }

                          return Text(text,
                              style: style, textAlign: TextAlign.center);
                        },
                        showTitles: false,
                        interval: 1,
                        reservedSize: 40,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: const Border(
                      bottom:
                      BorderSide(color: Color(0xff959598), width: 0.5),
                      left: BorderSide(color: Colors.transparent),
                      right: BorderSide(color: Colors.transparent),
                      top: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      color: const Color(0xff2CB77F),
                      barWidth: 2.sp,
                      isStrokeCapRound: true,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(
                          show: true,
                          color: const Color(0xff2CB77F).withOpacity(0.1)),
                      spots: const [
                        FlSpot(0, 0),
                        FlSpot(3, 1.5),
                        FlSpot(5, 1.4),
                        FlSpot(7, 3.4),
                        FlSpot(10, 2),
                        FlSpot(12, 2.2),
                        FlSpot(15, 1.8),
                      ],
                    ),
                    LineChartBarData(
                      isCurved: true,
                      color: const Color(0xffaa4cfc),
                      barWidth: 2.sp,
                      isStrokeCapRound: true,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        color: const Color(0x00aa4cfc).withOpacity(0.1),
                      ),
                      spots: const [
                        FlSpot(0, 0),
                        FlSpot(3, 2.8),
                        FlSpot(7, 1.2),
                        FlSpot(10, 2.8),
                        FlSpot(12, 2.6),
                        FlSpot(15, 3.9),
                      ],
                    ),
                    LineChartBarData(
                      isCurved: true,
                      color: const Color(0xff27b6fc),
                      barWidth: 2.sp,
                      isStrokeCapRound: true,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        color: const Color(0xff27b6fc).withOpacity(0.1),
                      ),
                      spots: const [
                        FlSpot(0, 2.8),
                        FlSpot(3, 1.9),
                        FlSpot(6, 3),
                        FlSpot(10, 1.3),
                        FlSpot(15, 2.5),
                      ],
                    ),
                  ],
                  minX: 0,
                  maxX: 15,
                  maxY: 4,
                  minY: 0,
                ),
                swapAnimationDuration: const Duration(milliseconds: 250),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}