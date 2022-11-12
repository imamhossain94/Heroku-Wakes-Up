import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';



void timeDialogue() async {
  return showModalBottomSheet(
    barrierColor: Colors.black12,
    backgroundColor: Colors.transparent,
    context: Get.context!,
    elevation: 0.0,
    builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(8.sp),
            child: Container(
              clipBehavior: Clip.none,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.sp),
                  border: Border.all(color: const Color(0xFFFF79D8).withOpacity(0.5))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.sp, top: 10.sp, bottom: 10.sp),
                        child: Text(
                          "Select Time",
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black87,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      const Spacer(),
                      Material(
                        color: Colors.green.withOpacity(0.1),
                        child: InkWell(
                          onTap: () {
                          },
                          child: Padding(
                            padding: EdgeInsets.all(5.sp),
                            child: SvgPicture.asset(
                                "assets/icon/tick.svg",
                                height: 22.sp,
                                width: 22.sp,
                                color: Colors.black,
                                semanticsLabel: 'Menu'),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.redAccent.withOpacity(0.1),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8.sp)
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8.sp)
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(5.sp),
                            child: SvgPicture.asset(
                                "assets/icon/multiply.svg",
                                height: 22.sp,
                                width: 22.sp,
                                color: Colors.black,
                                semanticsLabel: 'Menu'),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(10.sp),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF79D8).withOpacity(0.1),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8.sp),
                          bottomRight: Radius.circular(8.sp)),
                    ),
                    child: Row(
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
                                        border: Border.all(color: Colors.black54, width: 2.0),
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(8.sp)
                                    ),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(7.sp),
                                      onTap: (){},
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
                                        child: SvgPicture.asset(
                                            "assets/icon/up_arrow.svg",
                                            height: 12.sp,
                                            width: 12.sp,
                                            color: Colors.black54,
                                            semanticsLabel: 'Menu'),
                                      ),
                                    ),
                                  )
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.sp),
                                child: Text(
                                  "6",
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
                                        border: Border.all(color: Colors.black54, width: 2.0),
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(8.sp)
                                    ),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(7.sp),
                                      onTap: (){},
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
                                        child: SvgPicture.asset(
                                            "assets/icon/down_arrow.svg",
                                            height: 12.sp,
                                            width: 12.sp,
                                            color: Colors.black54,
                                            semanticsLabel: 'Menu'),
                                      ),
                                    ),
                                  )
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 10.sp,),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Material(
                                  type: MaterialType.transparency,
                                  child: Ink(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black54, width: 2.0),
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(8.sp)
                                    ),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(7.sp),
                                      onTap: (){},
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
                                        child: SvgPicture.asset(
                                            "assets/icon/up_arrow.svg",
                                            height: 12.sp,
                                            width: 12.sp,
                                            color: Colors.black54,
                                            semanticsLabel: 'Menu'),
                                      ),
                                    ),
                                  )
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.sp),
                                child: Text(
                                  "h",
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
                                        border: Border.all(color: Colors.black54, width: 2.0),
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(8.sp)
                                    ),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(7.sp),
                                      onTap: (){},
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
                                        child: SvgPicture.asset(
                                            "assets/icon/down_arrow.svg",
                                            height: 12.sp,
                                            width: 12.sp,
                                            color: Colors.black54,
                                            semanticsLabel: 'Menu'),
                                      ),
                                    ),
                                  )
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
    },
  );
}