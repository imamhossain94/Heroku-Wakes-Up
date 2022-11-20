

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget customTextEditingField(
    {required String hintText,
      required Color bgColor,
      TextEditingController? controller,
      required int animDuration}) {
  return FadeInUp(
    duration: Duration(milliseconds: animDuration),
    child: Padding(
      padding: EdgeInsets.fromLTRB(10.sp, 0.sp, 10.sp, 5.sp),
      child: TextFormField(
        maxLines: 1,
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            counterText: '',
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 10.sp,
                color: Colors.black38,
                letterSpacing: 0.2),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.sp),
              borderSide: BorderSide(
                color: bgColor,
                style: BorderStyle.solid,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.sp),
              borderSide: BorderSide(
                color: bgColor,
                style: BorderStyle.solid,
              ),
            ),
            enabled: true,
            fillColor: bgColor,
            filled: true),
      ),
    ),
  );
}