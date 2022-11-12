

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

Widget customTimePicker() {

  return FadeInUp(
      duration: const Duration(milliseconds: 700),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
        child: Container(
          padding: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
              color: const Color(0xFFFFA451).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.sp),
              border:
              Border.all(color: const Color(0xFFFFA451).withOpacity(0.3))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Material(
                        type: MaterialType.transparency,
                        child: Ink(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black54, width: 2.0),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8.sp)),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(7.sp),
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.sp, vertical: 5.sp),
                              child: SvgPicture.asset(
                                  "assets/icon/up_arrow.svg",
                                  height: 12.sp,
                                  width: 12.sp,
                                  color: Colors.black54,
                                  semanticsLabel: 'Menu'),
                            ),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.sp),
                      child: Text(
                        "10",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Material(
                        type: MaterialType.transparency,
                        child: Ink(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black54, width: 2.0),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8.sp)),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(7.sp),
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.sp, vertical: 5.sp),
                              child: SvgPicture.asset(
                                  "assets/icon/down_arrow.svg",
                                  height: 12.sp,
                                  width: 12.sp,
                                  color: Colors.black54,
                                  semanticsLabel: 'Menu'),
                            ),
                          ),
                        ))
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
                    Material(
                        type: MaterialType.transparency,
                        child: Ink(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black54, width: 2.0),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8.sp)),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(7.sp),
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.sp, vertical: 5.sp),
                              child: SvgPicture.asset(
                                  "assets/icon/up_arrow.svg",
                                  height: 12.sp,
                                  width: 12.sp,
                                  color: Colors.black54,
                                  semanticsLabel: 'Menu'),
                            ),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.sp),
                      child: Text(
                        "56",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Material(
                        type: MaterialType.transparency,
                        child: Ink(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black54, width: 2.0),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8.sp)),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(7.sp),
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.sp, vertical: 5.sp),
                              child: SvgPicture.asset(
                                  "assets/icon/down_arrow.svg",
                                  height: 12.sp,
                                  width: 12.sp,
                                  color: Colors.black54,
                                  semanticsLabel: 'Menu'),
                            ),
                          ),
                        ))
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
                    Material(
                        type: MaterialType.transparency,
                        child: Ink(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black54, width: 2.0),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8.sp)),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(7.sp),
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.sp, vertical: 5.sp),
                              child: SvgPicture.asset(
                                  "assets/icon/up_arrow.svg",
                                  height: 12.sp,
                                  width: 12.sp,
                                  color: Colors.black54,
                                  semanticsLabel: 'Menu'),
                            ),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.sp),
                      child: Text(
                        "AM",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Material(
                        type: MaterialType.transparency,
                        child: Ink(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black54, width: 2.0),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8.sp)),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(7.sp),
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.sp, vertical: 5.sp),
                              child: SvgPicture.asset(
                                  "assets/icon/down_arrow.svg",
                                  height: 12.sp,
                                  width: 12.sp,
                                  color: Colors.black54,
                                  semanticsLabel: 'Menu'),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ));

}