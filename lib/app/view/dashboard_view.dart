import 'package:animate_do/animate_do.dart';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import 'dart:async';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


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
              body: Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          FadeInLeft(
                            duration: const Duration(milliseconds: 500),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: SvgPicture.asset("assets/icon/heroku_icon.svg",
                                  height: 24.sp,
                                  width: 24.sp,
                                  color: const Color(0xFF232157),
                                  semanticsLabel: 'Heroku'),
                            ),
                          ),
                          const Spacer(),
                          FadeInRight(
                            duration: const Duration(milliseconds: 500),
                            child: Material(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                              child: InkWell(
                                onTap: () {

                                },
                                borderRadius: BorderRadius.circular(8),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SvgPicture.asset("assets/icon/menu.svg",
                                      height: 22.sp,
                                      width: 22.sp,
                                      color: const Color(0xFF232157),
                                      semanticsLabel: 'Menu'),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      FadeInDown(
                        duration: const Duration(milliseconds: 500),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Heroku Wake Up',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xFF232157),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.sp),
                        child: Row(
                          children: [
                            statCard(
                                cardColor: const Color(0xFF2CB77F).withOpacity(0.8),
                                icon: SvgPicture.asset("assets/icon/total_app.svg",
                                    height: 24.sp,
                                    width: 24.sp,
                                    color: Colors.white,
                                    semanticsLabel: 'Total app'),
                                title: 'Total App',
                                description: '3/20'
                            ),
                            SizedBox(width: 8.sp,),
                            statCard(
                                cardColor: const Color(0xFF613C96).withOpacity(0.8),
                                icon: SvgPicture.asset("assets/icon/statistic.svg",
                                    height: 24.sp,
                                    width: 24.sp,
                                    color: Colors.white,
                                    semanticsLabel: 'Total event'),
                                title: 'Total Event',
                                description: '320'
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          FadeInLeft(
                            duration: const Duration(milliseconds: 500),
                            child: Text(
                              'App list',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: const Color(0xFF232157),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Spacer(),
                          FadeInRight(
                            duration: const Duration(milliseconds: 500),
                            child: Material(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                              child: InkWell(
                                onTap: () {

                                },
                                borderRadius: BorderRadius.circular(8),
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Icon(
                                    FontAwesomeIcons.plus, color: Color(0xFFA6A8AA),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.sp,),

                      FadeInRight(
                          duration: const Duration(milliseconds: 500),
                          child: appCard(
                            cardColor: const Color(0xFFFF6384).withOpacity(0.2),
                            icon: SvgPicture.asset("assets/icon/menu.svg",
                              height: 14.sp,
                              width: 14.sp,
                              color: Colors.black,
                              semanticsLabel: 'icon'),
                            title: 'Bubt Smart Routine',
                            description: 'Give me a cup of coffee every 30 minutes',
                            statusColor: const Color(0xFF2CB77F).withOpacity(0.8),
                          )
                      ),
                      FadeInLeft(
                          duration: const Duration(milliseconds: 500),
                          child: appCard(
                            cardColor: const Color(0xFF9966FF).withOpacity(0.2),
                            icon: SvgPicture.asset("assets/icon/menu.svg",
                                height: 14.sp,
                                width: 14.sp,
                                color: Colors.black,
                                semanticsLabel: 'icon'),
                            title: 'Url Shortener',
                            description: 'Give me a cup of coffee every 720 minutes',
                            statusColor: const Color(0xFF2CB77F).withOpacity(0.8),
                          )
                      ),
                      FadeInRight(
                          duration: const Duration(milliseconds: 500),
                          child: appCard(
                            cardColor: const Color(0xFF4BC0C0).withOpacity(0.2),
                            icon: SvgPicture.asset("assets/icon/menu.svg",
                                height: 14.sp,
                                width: 14.sp,
                                color: Colors.black,
                                semanticsLabel: 'icon'),
                            title: 'Bubt Smart Notice',
                            description: 'Give me a cup of coffee every 360 minutes',
                            statusColor: const Color(0xFF2CB77F).withOpacity(0.8),
                          )
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.sp),
                        child: FadeInLeft(
                          duration: const Duration(milliseconds: 500),
                          child: Text(
                            'Events Life Line',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: const Color(0xFF232157),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const LineChartSample1(),


                    ],
                  ),
                ),
              )
          ),
        ),
      ),
    );
  }

  Widget statCard(
      {required Color cardColor, required Widget icon, required String title, required String description}) {
    return Expanded(
      child: FadeIn(
        duration: const Duration(milliseconds: 2000),
        child: Container(
          padding: EdgeInsets.all(15.sp),
          decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              icon,
              SizedBox(height: 10.sp,),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5.sp,),
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
      ),
    );
  }

  Widget appCard(
      {required Color cardColor, required Widget icon, required String title, required String description, required Color statusColor}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.sp),
      child: Container(
        padding: EdgeInsets.all(15.sp),
        decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
          children: [
            Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        icon,
                        SizedBox(width: 5.sp,),
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(19.sp, 5.sp, 5.sp, 0),
                      child: Text(
                        description,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 8.sp,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                )
            ),
            Container(
              width: 12.sp,
              height: 12.sp,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: statusColor, width: 3)
              ),
            )
          ],
        ),
      ),
    );
  }

}


class _LineChart extends StatelessWidget {
  const _LineChart();

  @override
  Widget build(BuildContext context) {
    return LineChart(
      sampleData1,
      swapAnimationDuration: const Duration(milliseconds: 250),
    );
  }

  LineChartData get sampleData1 => LineChartData(
    lineTouchData: lineTouchData1,
    gridData: gridData,
    titlesData: titlesData1,
    borderData: borderData,
    lineBarsData: lineBarsData1,
    minX: 0,
    maxX: 14,
    maxY: 4,
    minY: 0,
  );

  LineTouchData get lineTouchData1 => LineTouchData(
    handleBuiltInTouches: true,
    touchTooltipData: LineTouchTooltipData(
      tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
    ),
  );

  FlTitlesData get titlesData1 => FlTitlesData(
    bottomTitles: AxisTitles(
      sideTitles: bottomTitles,
    ),
    rightTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    topTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    leftTitles: AxisTitles(
      sideTitles: leftTitles(),
    ),
  );

  List<LineChartBarData> get lineBarsData1 => [
    lineChartBarData1_1,
    lineChartBarData1_2,
    lineChartBarData1_3,
  ];


  Widget leftTitleWidgets(double value, TitleMeta meta) {
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

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles() => SideTitles(
    getTitlesWidget: leftTitleWidgets,
    showTitles: false,
    interval: 1,
    reservedSize: 40,
  );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    var style = TextStyle(
      color: const Color(0xff72719b),
      fontSize: 10.sp,
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
  }

  SideTitles get bottomTitles => SideTitles(
    showTitles: true,
    reservedSize: 32,
    interval: 1,
    getTitlesWidget: bottomTitleWidgets,
  );

  FlGridData get gridData => FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
    show: true,
    border: const Border(
      bottom: BorderSide(color: Color(0xff959598), width: 0.5),
      left: BorderSide(color: Colors.transparent),
      right: BorderSide(color: Colors.transparent),
      top: BorderSide(color: Colors.transparent),
    ),
  );

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
    isCurved: true,
    color: const Color(0xff2CB77F),
    barWidth: 2.sp,
    isStrokeCapRound: true,
    dotData: FlDotData(show: false),
    belowBarData: BarAreaData(show: true, color: const Color(0xff2CB77F).withOpacity(0.1)),
    spots: const [
      FlSpot(0, 0),
      FlSpot(3, 1.5),
      FlSpot(5, 1.4),
      FlSpot(7, 3.4),
      FlSpot(10, 2),
      FlSpot(12, 2.2),
      FlSpot(15, 1.8),
    ],
  );

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
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
  );

  LineChartBarData get lineChartBarData1_3 => LineChartBarData(
    isCurved: true,
    color: const Color(0xff27b6fc),
    barWidth: 2.sp,
    isStrokeCapRound: true,
    dotData: FlDotData(show: false),
    belowBarData: BarAreaData(show: true, color: const Color(0xff27b6fc).withOpacity(0.1),),
    spots: const [
      FlSpot(0, 2.8),
      FlSpot(3, 1.9),
      FlSpot(6, 3),
      FlSpot(10, 1.3),
      FlSpot(15, 2.5),
    ],
  );

}

class LineChartSample1 extends StatefulWidget {
  const LineChartSample1({super.key});

  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}

class LineChartSample1State extends State<LineChartSample1> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          gradient: LinearGradient(
            colors: [
              Color(0xffECEDEA),
              Color(0xffECEDEA),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 15.sp,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.sp),
              child: Row(
                children: [
                  Text(
                    'Daily Events',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      letterSpacing: 2,
                    ),
                  ),

                ],
              ),
            ),
            const SizedBox(height: 37,),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 0, left: 0),
                child: _LineChart(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}