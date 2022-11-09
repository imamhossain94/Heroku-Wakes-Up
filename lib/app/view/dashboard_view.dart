import 'package:animate_do/animate_do.dart';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          systemNavigationBarColor: const Color(0xFFE8E9E6),
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarColor: const Color(0xFFE8E9E6),
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: SafeArea(
          child: Scaffold(
              backgroundColor: const Color(0xFFE8E9E6),
              extendBody: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                titleSpacing: 0,
                centerTitle: true,
                leading: FadeInLeft(
                  duration: const Duration(milliseconds: 1000),
                  child: ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (Rect bounds) {
                      return ui.Gradient.linear(
                        const Offset(1.0, 34.0),
                        const Offset(34.0, 4.0),
                        [
                          Colors.purple.shade300,
                          Colors.purpleAccent.shade200,
                        ],
                      );
                    },
                    child: SvgPicture.asset("assets/icon/heroku_logo.svg",
                        color: const Color(0xFFFFFFFF),
                        semanticsLabel: 'Open Pill'),
                  ),
                ),
                title: FadeInDown(
                  duration: const Duration(milliseconds: 2000),
                  child: Text(
                    'Wake Up',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                actions: [
                  FadeInRight(
                    duration: const Duration(milliseconds: 1000),
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      child: InkWell(
                        onTap: () {


                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset("assets/icon/menu.svg",
                              height: 24.sp,
                              width: 24.sp,
                              color: Colors.black,
                              semanticsLabel: 'Open Pill'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 3.w,)
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(8.sp),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: Text("Hello World!"),
                          ),
                        ),
                        SizedBox(width: 8.sp,),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(8.sp),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: Text("Hello World!"),
                          ),
                        )
                      ],
                    ),


                  ],
                ),
              )),
        ),
      ),
    );
  }
}
