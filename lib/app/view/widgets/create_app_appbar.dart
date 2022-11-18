import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heroku_wake_up/app/controller/heroku_wake_up_app_controller.dart';
import 'package:sizer/sizer.dart';

Widget createAppAppBar({required HerokuWakeUpAppController controller}) =>
    FadeInUp(
      duration: const Duration(milliseconds: 500),
      child: Padding(
        padding: EdgeInsets.only(left: 15.sp, right: 5.sp),
        child: Row(
          children: [
            Text(
              'Create app',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black,
                letterSpacing: 0.5,
              ),
            ),
            const Spacer(),
            Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                onTap: () async {
                  controller.createApp();
                },
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset("assets/icon/tick.svg",
                      height: 22.sp,
                      width: 22.sp,
                      color: const Color(0xFF000000).withOpacity(0.7),
                      semanticsLabel: 'Menu'),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset("assets/icon/multiply.svg",
                      height: 22.sp,
                      width: 22.sp,
                      color: const Color(0xFF000000).withOpacity(0.7),
                      semanticsLabel: 'Menu'),
                ),
              ),
            )
          ],
        ),
      ),
    );
