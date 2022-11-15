
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'table_widgets.dart';

Widget eventLogs() {

  return FadeInUp(
    duration: const Duration(milliseconds: 1300),
    child: Container(
      color: Colors.white,
      padding: EdgeInsets.only(
          left: 10.sp, right: 10.sp, bottom: 15.sp),
      child: Column(
        children: [
          THeader(
            bgColor: Colors.white,
            padding: EdgeInsets.all(10.sp),
            textColor: Colors.black,
            fontSize: 10.sp,
          ),
          TRow(
              textColor: Colors.black54,
              fontSize: 8.sp,
              data: const [
                '11 Nov, 10:20:10',
                'Success',
                'Server running'
              ]),
          TRow(
              textColor: Colors.black54,
              fontSize: 8.sp,
              data: const [
                '11 Nov, 10:35:49',
                'Error',
                'Invalid data'
              ]),
          TRow(
              padding: EdgeInsets.all(10.sp),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.sp),
                  bottomRight: Radius.circular(8.sp)),
              textColor: Colors.black54,
              fontSize: 8.sp,
              data: const [
                '11 Nov, 10:56:20',
                'Success',
                'Project running'
              ]),
        ],
      ),
    ),
  );

}