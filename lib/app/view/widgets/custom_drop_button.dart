

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../dialogues/dialogues.dart';

Widget customDropDownButton() {
  return FadeInUp(
    duration: const Duration(milliseconds: 700),
    child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 10.sp, vertical: 5.sp),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            timeDialogue();
          },
          borderRadius: BorderRadius.circular(8.sp),
          child: Container(
            padding: EdgeInsets.all(15.sp),
            decoration: BoxDecoration(
                color: const Color(0xFFFF79D8)
                    .withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.sp),
                border: Border.all(
                    color: const Color(0xFFFF79D8)
                        .withOpacity(0.3))),
            child: Row(
              children: [
                SvgPicture.asset(
                    "assets/icon/heroku_icon.svg",
                    height: 14.sp,
                    width: 14.sp,
                    color: Colors.black,
                    semanticsLabel: 'heroku-icon'),
                SizedBox(
                  width: 10.sp,
                ),
                Text(
                  '1 hours',
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black87,
                      fontWeight: FontWeight.normal),
                ),
                const Spacer(),
                SvgPicture.asset(
                    "assets/icon/down_arrow_square.svg",
                    height: 14.sp,
                    width: 14.sp,
                    color: Colors.black,
                    semanticsLabel: 'heroku-icon'),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}