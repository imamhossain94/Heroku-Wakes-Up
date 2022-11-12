import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MenuView extends StatelessWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            extendBody: true,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ZoomIn(
                    duration: const Duration(milliseconds: 500),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.sp),
                      child: Row(
                        children: [
                          SizedBox(
                            //width: double.infinity,
                            child: Text(
                              'Menu',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Material(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            child: InkWell(
                              onTap: () {
                                Get.back();
                              },
                              borderRadius: BorderRadius.circular(8),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
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
                    ),
                  ),
                  SizedBox(height: 15.sp,),
                  menuItem(
                      title: 'Write us', description: 'imamagun94@gmail.com'),
                  menuItem(
                      title: 'Check our website',
                      icon: SvgPicture.asset("assets/icon/link.svg",
                          height: 14.sp,
                          width: 14.sp,
                          color: Colors.black,
                          semanticsLabel: 'link')),

                  menuItem(
                      title: 'Privacy Policy',
                      icon: SvgPicture.asset("assets/icon/link.svg",
                          height: 14.sp,
                          width: 14.sp,
                          color: Colors.black,
                          semanticsLabel: 'link')),
                  menuItem(
                      title: 'Feedback', description: 'imamagun94@gmail.com'),
                  menuItem(
                      title: 'Rate us',
                      icon: SvgPicture.asset("assets/icon/star.svg",
                          height: 12.sp,
                          width: 12.sp,
                          color: Colors.black,
                          semanticsLabel: 'star')),
                  menuItem(
                      title: 'Other apps',
                      icon: SvgPicture.asset("assets/icon/play_store.svg",
                          height: 12.sp,
                          width: 12.sp,
                          color: Colors.black,
                          semanticsLabel: 'play_store')),
                  menuItem(
                      title: 'Source code',
                      icon: SvgPicture.asset("assets/icon/git.svg",
                          height: 14.sp,
                          width: 14.sp,
                          color: Colors.black,
                          semanticsLabel: 'play_store')),
                  menuItem(
                      title: 'Icons by', description: 'svgrepo.com'),
                  menuItem(
                      title: 'Version', description: '1.0.0'),
                ],
              ),
            )),
      ),
    );
  }

  Widget menuItem({required String title, String? description, Widget? icon}) {
    return ZoomIn(
      duration:  const Duration(milliseconds: 500),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
        child: Container(
          padding: EdgeInsets.all(15.sp),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.sp),
              border: Border.all(color: const Color(0xFFF1F3F2))),
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
    );
  }
}
