import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../services/get_storage_service.dart';
import '../utils/system_overlay.dart';
import 'dashboard_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemOverlay.common,
        child: SafeArea(
          child: Scaffold(
              backgroundColor: Colors.white,
              extendBody: true,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Spacer(),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1000),
                    child: SvgPicture.asset("assets/icon/heroku_logo.svg",
                        height: 200.sp,
                        width: 200.sp,
                        semanticsLabel: 'Open Pill'),
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1100),
                    child: Text(
                      '"Heroku Wake Up"',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1200),
                    child: Text(
                      "Prevent your free heroku app from ever falling asleep again.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.black54,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h, bottom: 3.h),
                    child: FadeInUp(
                      duration: const Duration(milliseconds: 1300),
                      child: Center(
                        child: CupertinoButton(
                            color: const Color(0xFFFF6384).withOpacity(0.7),
                            borderRadius: BorderRadius.circular(30),
                            onPressed: () {
                              setFirstLaunch();
                              Get.to(const DashboardView());
                            },
                            child: Text(
                              "Let's Go!",
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Colors.white,
                              ),
                            )),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
