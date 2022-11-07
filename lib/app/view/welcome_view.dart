import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          systemNavigationBarColor: const Color(0xFF9F1382),
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarColor: const Color(0xFF9F1382),
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
        child: SafeArea(
          child: Scaffold(
              backgroundColor: const Color(0xFF9F1382),
              extendBody: true,
              body: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1000),
                      child: SvgPicture.asset("assets/icon/heroku_logo.svg",
                          height: 300,
                          width: 300,
                          color: const Color(0xFFFFFFFF),
                          semanticsLabel: 'Open Pill'),
                    ),
                    FadeIn(
                      duration: const Duration(milliseconds: 2000),
                      child: Text(
                        '"Heroku Wake Up"',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    FadeIn(
                      duration: const Duration(milliseconds: 2000),
                      child: Text(
                        "Prevent your free heroku app from ever falling asleep again.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white54,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    FadeInDown(
                      duration: const Duration(milliseconds: 1000),
                      child: CupertinoButton(
                          color: Colors.white30,
                          borderRadius: BorderRadius.circular(30),
                          onPressed: () {},
                          child: Text(
                            "Let's Go!",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
