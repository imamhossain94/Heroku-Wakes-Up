import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controller/heroku_wake_up_controller.dart';

Widget intervalTimePicker({required HerokuWakeUpController controller}) {
  return FadeInUp(
      duration: const Duration(milliseconds: 700),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
        child: Container(
          padding: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
              color: const Color(0xFFFF79D8).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.sp),
              border:
                  Border.all(color: const Color(0xFFFF79D8).withOpacity(0.3))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _arrowButton(
                        iconPath: 'assets/icon/up_arrow.svg',
                        onTap: () {
                          if (controller.intervalHmIndex.value == 0) {
                            controller.intervalHIndex < 11
                                ? controller.intervalHIndex++
                                : controller.intervalHIndex.value = 0;
                          } else {
                            controller.intervalMIndex < 59
                                ? controller.intervalMIndex++
                                : controller.intervalMIndex.value = 0;
                          }
                        }),
                    Obx(() => controller.intervalHmIndex.value == 0
                        ? _selectedText(
                            value: controller
                                .hours[controller.intervalHIndex.value])
                        : _selectedText(
                            value: controller
                                .minutes[controller.intervalMIndex.value])),
                    _arrowButton(
                        iconPath: 'assets/icon/down_arrow.svg',
                        onTap: () {
                          if (controller.intervalHmIndex.value == 0) {
                            controller.intervalHIndex > 0
                                ? controller.intervalHIndex--
                                : controller.intervalHIndex.value = 11;
                          } else {
                            controller.intervalMIndex > 0
                                ? controller.intervalMIndex--
                                : controller.intervalMIndex.value = 59;
                          }
                        }),
                  ],
                ),
              ),
              SizedBox(
                width: 10.sp,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _arrowButton(
                        iconPath: 'assets/icon/up_arrow.svg',
                        onTap: () => controller.intervalHmIndex.value == 0
                            ? controller.intervalHmIndex++
                            : controller.intervalHmIndex.value = 0),
                    Obx(() => _selectedText(
                        value: controller
                            .hourOrMinute[controller.intervalHmIndex.value])),
                    _arrowButton(
                        iconPath: 'assets/icon/down_arrow.svg',
                        onTap: () => controller.intervalHmIndex.value == 1
                            ? controller.intervalHmIndex--
                            : controller.intervalHmIndex.value = 1),
                  ],
                ),
              ),
            ],
          ),
        ),
      ));
}

Widget _arrowButton({required String iconPath, VoidCallback? onTap}) {
  return Material(
      type: MaterialType.transparency,
      child: Ink(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black54, width: 2.0),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8.sp)),
        child: InkWell(
          borderRadius: BorderRadius.circular(7.sp),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
            child: SvgPicture.asset(iconPath,
                height: 12.sp,
                width: 12.sp,
                color: Colors.black54,
                semanticsLabel: 'arrow'),
          ),
        ),
      ));
}

Widget _selectedText({required String value}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10.sp),
    child: Text(
      value,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 12.sp, color: Colors.black, fontWeight: FontWeight.bold),
    ),
  );
}
