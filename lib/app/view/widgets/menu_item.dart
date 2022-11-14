
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget menuItem(
    {required String title,
      String? description,
      Widget? icon,
      VoidCallback? onTap, required Color bgColor,
      required int duration}) {
  return FadeInUp(
    duration: Duration(milliseconds: duration),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8.sp),
          child: Container(
            padding: EdgeInsets.all(15.sp),
            decoration: BoxDecoration(
                color: bgColor.withOpacity(0.03),
                borderRadius: BorderRadius.circular(8.sp),
                border: Border.all(color: bgColor.withOpacity(0.3))),
            // border: Border.all(color: const Color(0xFFF1F3F2))),
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black87,
                      fontWeight: FontWeight.normal),
                ),
                const Spacer(),
                if (description != null)
                  Text(
                    description,
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w200),
                  ),
                if (icon != null) icon
              ],
            ),
          ),
        ),
      ),
    ),
  );
}