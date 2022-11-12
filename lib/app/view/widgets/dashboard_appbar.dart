import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../menu_view.dart';

Widget dashboardAppBar() => FadeInUp(
  duration: const Duration(milliseconds: 500),
  child: Padding(
    padding: EdgeInsets.only(left: 15.sp, right: 5.sp),
    child: Row(
      children: [
        SvgPicture.asset("assets/icon/heroku_icon.svg",
            height: 22.sp,
            width: 22.sp,
            color: const Color(0xFF613C96).withOpacity(0.8),
            semanticsLabel: 'Heroku'),
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
        Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            onTap: () {
              Get.to(const MenuView());
            },
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset("assets/icon/menu.svg",
                  height: 24.sp,
                  width: 24.sp,
                  color: const Color(0xFF613C96).withOpacity(0.8),
                  semanticsLabel: 'Menu'),
            ),
          ),
        )
      ],
    ),
  ),
);
