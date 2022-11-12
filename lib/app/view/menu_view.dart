import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'package:sizer/sizer.dart';

import 'dashboard_view.dart';

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
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    FadeInLeft(
                      duration: const Duration(milliseconds: 500),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: SvgPicture.asset(
                            "assets/icon/heroku_icon.svg",
                            height: 24.sp,
                            width: 24.sp,
                            color: const Color(0xFF2CB77F).withOpacity(0.8),
                            semanticsLabel: 'Heroku'),
                      ),
                    ),
                    const Spacer(),
                    FadeInDown(
                      duration: const Duration(milliseconds: 500),
                      child: SizedBox(
                        //width: double.infinity,
                        child: Text(
                          'Heroku Wake Up',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    FadeInRight(
                      duration: const Duration(milliseconds: 500),
                      child: Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(8),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                                "assets/icon/menu.svg",
                                height: 22.sp,
                                width: 22.sp,
                                color: const Color(0xFF613C96).withOpacity(0.8),
                                semanticsLabel: 'Menu'),
                          ),
                        ),
                      ),
                    )
                  ],
                ),



              ],
            )),
      ),
    );
  }
}


