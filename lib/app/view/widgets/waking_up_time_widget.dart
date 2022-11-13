import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controller/heroku_wake_up_app_controller.dart';
import '../../utils/constants.dart';

Widget wakingUpTimesWidget({required HerokuWakeUpAppController controller}) {
  return FadeInUp(
    duration: const Duration(milliseconds: 800),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
      child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children:
                List.generate(controller.coffeeServingTimes.length, (index) {
              return Container(
                width: double.infinity,
                padding: EdgeInsets.all(8.sp),
                margin: EdgeInsets.only(bottom: 8.sp),
                decoration: BoxDecoration(
                    color: Color(colorList[index]).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.sp),
                    border: Border.all(
                        color: Color(colorList[index]).withOpacity(0.3))),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset("assets/icon/clock_square.svg",
                        height: 12.sp,
                        width: 12.sp,
                        color: Colors.black,
                        semanticsLabel: 'heroku-icon'),
                    SizedBox(
                      width: 8.sp,
                    ),
                    Text(
                      controller.coffeeServingTimes[index],
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              );
            }),
          )),
    ),
  );
}
