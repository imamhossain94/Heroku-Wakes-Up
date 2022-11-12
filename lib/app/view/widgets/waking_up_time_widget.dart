

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

Widget wakingUpTimesWidget() {
  return FadeInUp(
    duration: const Duration(milliseconds: 800),
    child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 10.sp, vertical: 5.sp),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: List.generate(5, (index) {
          return Container(
            padding: EdgeInsets.all(8.sp),
            decoration: BoxDecoration(
                color: const Color(0xFF575880)
                    .withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.sp),
                border: Border.all(
                    color: const Color(0xFF575880)
                        .withOpacity(0.3))),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                    "assets/icon/clock_square.svg",
                    height: 12.sp,
                    width: 12.sp,
                    color: Colors.black,
                    semanticsLabel: 'heroku-icon'),
                SizedBox(
                  width: 8.sp,
                ),
                Text(
                  '10:30 PM',
                  style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.black87,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          );
        }),
      ),
    ),
  );
}