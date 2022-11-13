import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

Widget dashboardStatisticCard(
        {required int totalApps, required int totalEvents}) =>
    FadeInUp(
      duration: const Duration(milliseconds: 600),
      child: Padding(
        padding: EdgeInsets.only(
            left: 10.sp, right: 10.sp, top: 15.sp, bottom: 0.sp),
        child: Row(
          children: [
            statisticCard(
                cardColor: const Color(0xFF2CB77F).withOpacity(0.8),
                icon: SvgPicture.asset("assets/icon/total_app.svg",
                    height: 24.sp,
                    width: 24.sp,
                    color: Colors.white,
                    semanticsLabel: 'Total app'),
                title: 'Total App',
                description: totalApps.toString()),
            SizedBox(
              width: 8.sp,
            ),
            statisticCard(
                cardColor: const Color(0xFF613C96).withOpacity(0.8),
                icon: SvgPicture.asset("assets/icon/statistic.svg",
                    height: 24.sp,
                    width: 24.sp,
                    color: Colors.white,
                    semanticsLabel: 'Total event'),
                title: 'Total Event',
                description: totalEvents.toString())
          ],
        ),
      ),
    );

Widget statisticCard(
        {required Color cardColor,
        required Widget icon,
        required String title,
        required String description}) =>
    Expanded(
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