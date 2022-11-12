import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

Widget appCard(
        {required Color cardColor,
        required String title,
        required String description,
        required Color statusColor}) =>
    FadeInUp(
      duration: const Duration(milliseconds: 800),
      child: Padding(
        padding: EdgeInsets.only(left: 10.sp, right: 10.sp, bottom: 8.sp),
        child: Container(
          padding: EdgeInsets.all(15.sp),
          decoration: BoxDecoration(
              color: cardColor, borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              SvgPicture.asset("assets/icon/heroku_icon.svg",
                  height: 14.sp,
                  width: 14.sp,
                  color: Colors.black,
                  semanticsLabel: 'icon'),
              SizedBox(
                width: 10.sp,
              ),
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  Text(
                    description,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 8.sp,
                      color: Colors.black45,
                    ),
                  )
                ],
              )),
              Container(
                width: 8.sp,
                height: 8.sp,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: statusColor, width: 1.sp)),
              )
            ],
          ),
        ),
      ),
    );
