

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget empty(String message) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.sp),
    child: Material(
      color: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.all(Radius.circular(8.sp)),
      child: InkWell(
        onTap: null,
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(8.sp),
          dashPattern: [5.sp, 3.sp],
          color: Colors.grey.withOpacity(0.5),
          strokeWidth: 1,
          child: Container(
              width: double.infinity,
              height: 60.sp,
              alignment: Alignment.center,
              child: Text(
                message,
                style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.black54),
              )),
        ),
      ),
    ),
  );
}