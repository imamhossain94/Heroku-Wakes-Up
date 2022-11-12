

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget sectionTitle({required String title, Widget? icon, VoidCallback? onTap}) => FadeInUp(
  duration: const Duration(milliseconds: 700),
  child: Padding(
    padding: EdgeInsets.only(
        left: 15.sp, right: 10.sp, top: 15.sp, bottom: 5.sp),
    child: Row(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12.sp,
            color: const Color(0xFF613C96).withOpacity(0.8),
          ),
        ),
        const Spacer(),
        if(icon != null)
        Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: EdgeInsets.all(8.sp),
              child: icon,
            ),
          ),
        ),
      ],
    ),
  ),
);