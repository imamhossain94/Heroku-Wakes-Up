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
      child: Obx(() => ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: controller.coffeeServingTimes.length > 96
              ? 96
              : controller.coffeeServingTimes.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 8.sp),
              child: Dismissible(
                key: Key(controller.coffeeServingTimes[index]),
                background: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8.sp)),
                  child: Text(
                    "Delete",
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                confirmDismiss: (direction) async {
                  controller.coffeeServingTimes.removeAt(index);
                  return true;
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(8.sp),
                  decoration: BoxDecoration(
                      color: colorList[index],
                      borderRadius: BorderRadius.circular(8.sp),
                      border: Border.all(color: colorList[index])),
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
                ),
              ),
            );
          })),
    ),
  );
}
