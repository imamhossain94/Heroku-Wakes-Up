import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_animations/simple_animations.dart';
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
        value: SystemOverlay.welcome,
        child: Scaffold(
          primary: false,
          extendBody: true,
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Stack(fit: StackFit.expand, children: <Widget>[
            Positioned.fill(
                child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  tileMode: TileMode.mirror,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0x97b80e9a),
                    Color(0xa02161f3),
                  ],
                  stops: [
                    0,
                    1,
                  ],
                ),
                backgroundBlendMode: BlendMode.srcOver,
              ),
              child: PlasmaRenderer(
                type: PlasmaType.infinity,
                particles: 10,
                color: const Color(0x435123e4),
                blur: 0.4,
                size: 1,
                speed: 3.75,
                offset: 0,
                blendMode: BlendMode.plus,
                particleType: ParticleType.atlas,
                variation1: 0,
                variation2: 0,
                variation3: 0,
                rotation: 0,
              ),
            )),
            Column(
              children: [
                Expanded(
                  flex: 9,
                  child: FadeInUp(
                    duration: const Duration(milliseconds: 1000),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icon/heroku_icon.svg",
                            height: 100.sp,
                            width: 100.sp,
                            semanticsLabel: 'heroku_icon',
                            color: const Color(0x80FFFFFF),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20.sp, bottom: 5.sp),
                            child: Text(
                              "Heroku Wake Up",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  color: const Color(0xCCFFFFFF),
                                  letterSpacing: 1.2,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              // style: TextStyle(
                              //   fontSize: 14.sp,
                              //   color: Colors.white70,
                              //   letterSpacing: 1.2,
                              //   fontWeight: FontWeight.w400,
                              // ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.fromLTRB(50.sp, 0, 50.sp, 50.sp),
                            child: Text(
                              "Smartly give your free Heroku app a cup of coffee so it never sleeps and saves the dyno hour",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                fontSize: 10.sp,
                                color: const Color(0xB3FFFFFF),
                                letterSpacing: 1.2,
                                fontWeight: FontWeight.w300,
                              )),
                            ),
                          ),
                        ]),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Material(
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.circular(1000),
                      color: const Color(0x14FFFFFF),
                      child: InkWell(
                        onTap: () {
                          setFirstLaunch();
                          Get.to(const DashboardView());
                        },
                        child: Container(
                          width: 100.sp,
                          padding: EdgeInsets.all(10.sp),
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: SvgPicture.asset(
                            "assets/icon/play.svg",
                            height: 14.sp,
                            width: 14.sp,
                            semanticsLabel: 'play',
                            color: const Color(0x80FFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
