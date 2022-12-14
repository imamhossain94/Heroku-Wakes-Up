import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controller/heroku_wake_up_app_controller.dart';
import '../../utils/constants.dart';

Widget customTimePicker({required HerokuWakeUpAppController controller}) {
  return FadeInUp(
      duration: const Duration(milliseconds: 850),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
        child: Container(
          padding: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.sp),
              border:
                  Border.all(color: const Color(0xFF85B1C5).withOpacity(0.3))),
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
                        color:  const Color(0x33cbd5e1),
                        onTap: controller.customTimeHourIncrement),
                    Obx(() => _selectedText(
                        value: hours[controller.hourIndex.value])),
                    _arrowButton(
                        iconPath: 'assets/icon/down_arrow.svg',
                        color: const Color(0x33cbd5e1),
                        onTap: controller.customTimeHourDecrement),
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
                        color:  const Color(0x33cbd5e1),
                        onTap: controller.customTimeMinuteIncrement),
                    Obx(() => _selectedText(
                        value: minutes[controller.minuteIndex.value])),
                    _arrowButton(
                        iconPath: 'assets/icon/down_arrow.svg',
                        color:  const Color(0x33cbd5e1),
                        onTap: controller.customTimeMinuteDecrement),
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
                        color:  const Color(0x33cbd5e1),
                        onTap: controller.customTimeMeridiemIncrement),
                    Obx(() => _selectedText(
                        value: meridiem[controller.meridiemIndex.value])),
                    _arrowButton(
                        iconPath: 'assets/icon/down_arrow.svg',
                        color:  const Color(0x33cbd5e1),
                        onTap: controller.customTimeMeridiemDecrement),
                  ],
                ),
              ),
            ],
          ),
        ),
      ));
}

Widget _arrowButton(
    {required String iconPath, VoidCallback? onTap, required Color color}) {
  return Material(
      color: color,
      borderRadius: BorderRadius.circular(8.sp),
      child: Ink(
        decoration: BoxDecoration(
            border: Border.all(color: color),
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
                color: Colors.black26,
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
