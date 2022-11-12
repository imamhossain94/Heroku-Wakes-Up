import 'package:animate_do/animate_do.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'create_app_view.dart';
import 'menu_view.dart';
import 'widgets/table_widgets.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: SafeArea(
          child: Scaffold(
              backgroundColor: Colors.white, // const Color(0xFFE8E9E6),
              extendBody: true,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInUp(
                      duration: const Duration(milliseconds: 500),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(15.sp, 0.sp, 0, 0),
                            child: SvgPicture.asset(
                                "assets/icon/heroku_icon.svg",
                                height: 22.sp,
                                width: 22.sp,
                                color: const Color(0xFF613C96).withOpacity(0.8),
                                semanticsLabel: 'Heroku'),
                          ),
                          const Spacer(),
                          SizedBox(
                            //width: double.infinity,
                            child: Text(
                              'Heroku Wake Up',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.black,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: 5.sp),
                            child: Material(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                              child: InkWell(
                                onTap: () {
                                  Get.to(const MenuView());
                                },
                                borderRadius: BorderRadius.circular(8),
                                child: Padding(
                                  padding: EdgeInsets.all(10.sp),
                                  child: SvgPicture.asset(
                                      "assets/icon/menu.svg",
                                      height: 22.sp,
                                      width: 22.sp,
                                      color: const Color(0xFF613C96)
                                          .withOpacity(0.8),
                                      semanticsLabel: 'Menu'),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    FadeInUp(
                      duration: const Duration(milliseconds: 600),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.sp, horizontal: 10.sp),
                        child: Row(
                          children: [
                            statCard(
                                cardColor:
                                    const Color(0xFF2CB77F).withOpacity(0.8),
                                icon: SvgPicture.asset(
                                    "assets/icon/total_app.svg",
                                    height: 24.sp,
                                    width: 24.sp,
                                    color: Colors.white,
                                    semanticsLabel: 'Total app'),
                                title: 'Total App',
                                description: '3/20'),
                            SizedBox(
                              width: 8.sp,
                            ),
                            statCard(
                                cardColor:
                                    const Color(0xFF613C96).withOpacity(0.8),
                                icon: SvgPicture.asset(
                                    "assets/icon/statistic.svg",
                                    height: 24.sp,
                                    width: 24.sp,
                                    color: Colors.white,
                                    semanticsLabel: 'Total event'),
                                title: 'Total Event',
                                description: '320')
                          ],
                        ),
                      ),
                    ),
                    FadeInUp(
                      duration: const Duration(milliseconds: 700),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10.sp, right: 10.sp, bottom: 10.sp),
                        child: Row(
                          children: [
                            Text(
                              'App list',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xFF613C96).withOpacity(0.8),
                              ),
                            ),
                            const Spacer(),
                            Material(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                              child: InkWell(
                                onTap: () {
                                  Get.to(const WelcomeView());
                                },
                                borderRadius: BorderRadius.circular(8),
                                child: Padding(
                                  padding: EdgeInsets.all(8.sp),
                                  child: SvgPicture.asset(
                                      "assets/icon/plus_square.svg",
                                      height: 14.sp,
                                      width: 14.sp,
                                      color: const Color(0xFF613C96)
                                          .withOpacity(0.8),
                                      semanticsLabel: 'heroku-icon'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    FadeInUp(
                        duration: const Duration(milliseconds: 800),
                        child: appCard(
                          cardColor: const Color(0xFFFF6384).withOpacity(0.2),
                          icon: SvgPicture.asset("assets/icon/heroku_icon.svg",
                              height: 14.sp,
                              width: 14.sp,
                              color: Colors.black,
                              semanticsLabel: 'icon'),
                          title: 'Bubt Smart Routine',
                          description:
                              'Give me a cup of coffee every 30 minutes',
                          statusColor: const Color(0xFF2CB77F).withOpacity(0.8),
                        )),
                    FadeInUp(
                        duration: const Duration(milliseconds: 900),
                        child: appCard(
                          cardColor: const Color(0xFF9966FF).withOpacity(0.2),
                          icon: SvgPicture.asset("assets/icon/heroku_icon.svg",
                              height: 14.sp,
                              width: 14.sp,
                              color: Colors.black,
                              semanticsLabel: 'icon'),
                          title: 'Url Shortener',
                          description:
                              'Give me a cup of coffee every 720 minutes',
                          statusColor: const Color(0xFF2CB77F).withOpacity(0.8),
                        )),
                    FadeInUp(
                        duration: const Duration(milliseconds: 1000),
                        child: appCard(
                          cardColor: const Color(0xFF4BC0C0).withOpacity(0.2),
                          icon: SvgPicture.asset("assets/icon/heroku_icon.svg",
                              height: 14.sp,
                              width: 14.sp,
                              color: Colors.black,
                              semanticsLabel: 'icon'),
                          title: 'Bubt Smart Notice',
                          description:
                              'Give me a cup of coffee every 360 minutes',
                          statusColor: const Color(0xFF2CB77F).withOpacity(0.8),
                        )),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1100),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.sp, horizontal: 10.sp),
                        child: Text(
                          'Events Life Line',
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xFF613C96).withOpacity(0.8)),
                        ),
                      ),
                    ),
                    eventsLifeLine(),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1200),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.sp, horizontal: 10.sp),
                        child: Text(
                          'Events Logs',
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xFF613C96).withOpacity(0.8)),
                        ),
                      ),
                    ),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1300),
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(
                            left: 10.sp, right: 10.sp, bottom: 15.sp),
                        child: Column(
                          children: [
                            THeader(
                              bgColor: Colors.white,
                              padding: EdgeInsets.all(10.sp),
                              textColor: Colors.black,
                              fontSize: 10.sp,
                            ),
                            TRow(
                                bgColor: Colors.green.withOpacity(0.2),
                                padding: EdgeInsets.all(10.sp),
                                borderRadius: BorderRadius.zero,
                                textColor: Colors.black,
                                fontSize: 8.sp,
                                data: const [
                                  '11 Nov, 10:20:10',
                                  'Success',
                                  'Server running'
                                ]),
                            TRow(
                                bgColor: Colors.redAccent.withOpacity(0.06),
                                padding: EdgeInsets.all(10.sp),
                                borderRadius: BorderRadius.zero,
                                textColor: Colors.black,
                                fontSize: 8.sp,
                                data: const [
                                  '11 Nov, 10:35:49',
                                  'Error',
                                  'Invalid data'
                                ]),
                            TRow(
                                bgColor: Colors.green.withOpacity(0.2),
                                padding: EdgeInsets.all(10.sp),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8.sp),
                                    bottomRight: Radius.circular(8.sp)),
                                textColor: Colors.black,
                                fontSize: 8.sp,
                                data: const [
                                  '11 Nov, 10:56:20',
                                  'Success',
                                  'Project running'
                                ]),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Widget statCard(
      {required Color cardColor,
      required Widget icon,
      required String title,
      required String description}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(15.sp),
        decoration: BoxDecoration(
            color: cardColor, borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            icon,
            SizedBox(
              height: 10.sp,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10.sp,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 5.sp,
            ),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10.sp,
                color: Colors.white70,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget appCard(
      {required Color cardColor,
      required Widget icon,
      required String title,
      required String description,
      required Color statusColor}) {
    return Padding(
      padding: EdgeInsets.only(left: 10.sp, right: 10.sp, bottom: 8.sp),
      child: Container(
        padding: EdgeInsets.all(15.sp),
        decoration: BoxDecoration(
            color: cardColor, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            icon,
            SizedBox(
              width: 10.sp,
            ),
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 5.sp,
                ),
                Text(
                  description,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 8.sp,
                    color: Colors.black45,
                  ),
                )
              ],
            )),
            Container(
              width: 8.sp,
              height: 8.sp,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: statusColor, width: 1.sp)),
            )
          ],
        ),
      ),
    );
  }

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
}
