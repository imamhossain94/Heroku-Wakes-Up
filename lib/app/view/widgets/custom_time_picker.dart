import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controller/heroku_wake_up_controller.dart';

Widget customTimePicker({required HerokuWakeUpController controller}) {
  return FadeInUp(
      duration: const Duration(milliseconds: 700),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
        child: Container(
          padding: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
              color: const Color(0xFFFFA451).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.sp),
              border:
                  Border.all(color: const Color(0xFFFFA451).withOpacity(0.3))),
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
                        onTap: () => controller.hourIndex < 11
                            ? controller.hourIndex++
                            : controller.hourIndex.value = 0),
                    Obx(() => _selectedText(
                        value: controller.hours[controller.hourIndex.value])),
                    _arrowButton(
                        iconPath: 'assets/icon/down_arrow.svg',
                        onTap: () => controller.hourIndex > 0
                            ? controller.hourIndex--
                            : controller.hourIndex.value = 11),
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
                        onTap: () => controller.minuteIndex < 59
                            ? controller.minuteIndex++
                            : controller.minuteIndex.value = 0),
                    Obx(() => _selectedText(
                        value:
                            controller.minutes[controller.minuteIndex.value])),
                    _arrowButton(
                        iconPath: 'assets/icon/down_arrow.svg',
                        onTap: () => controller.minuteIndex > 0
                            ? controller.minuteIndex--
                            : controller.minuteIndex.value = 59),
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
                        onTap: () => controller.meridiemIndex.value == 0
                            ? controller.meridiemIndex++
                            : controller.meridiemIndex.value = 0),
                    Obx(() => _selectedText(
                        value: controller
                            .meridiem[controller.meridiemIndex.value])),
                    _arrowButton(
                        iconPath: 'assets/icon/down_arrow.svg',
                        onTap: () => controller.meridiemIndex.value == 1
                            ? controller.meridiemIndex--
                            : controller.meridiemIndex.value = 1),
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
