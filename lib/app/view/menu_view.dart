import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/constants.dart';

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
                  FadeInUp(
                    duration: const Duration(milliseconds: 500),
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.sp, right: 5.sp),
                      child: Row(
                        children: [
                          SizedBox(
                            //width: double.infinity,
                            child: Text(
                              'Menu',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: const Color(0xFF613C96).withOpacity(0.8),
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
                                padding: EdgeInsets.all(10.sp),
                                child: SvgPicture.asset(
                                    "assets/icon/multiply.svg",
                                    height: 22.sp,
                                    width: 22.sp,
                                    color: const Color(0xFF613C96).withOpacity(0.8),
                                    semanticsLabel: 'Menu'),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  menuItem(
                      title: 'Write us',
                      description: 'imamagun94@gmail.com',
                      bgColor: const Color(0xFF4EBBFF).withOpacity(0.3),
                      duration: 500,
                      onTap: () async {
                        if (!await launchUrl(Uri.parse(contactMail))) {
                          throw 'Could not launch $contactMail';
                        }
                      }),
                  menuItem(
                      title: 'Check our website',
                      icon: SvgPicture.asset("assets/icon/link.svg",
                          height: 14.sp,
                          width: 14.sp,
                          color: Colors.black,
                          semanticsLabel: 'link'),
                      bgColor: const Color(0xFFFFA451).withOpacity(0.1),
                      duration: 600,
                      onTap: () async {
                        if (!await launchUrl(Uri.parse(websiteUrl))) {
                          throw 'Could not launch $websiteUrl';
                        }
                      }),
                  menuItem(
                      title: 'Privacy Policy',
                      icon: SvgPicture.asset("assets/icon/link.svg",
                          height: 14.sp,
                          width: 14.sp,
                          color: Colors.black,
                          semanticsLabel: 'link'),
                      bgColor: const Color(0xFF53F1F1).withOpacity(0.3),
                      duration: 700,
                      onTap: () async {
                        if (!await launchUrl(Uri.parse(privacyPolicyUrl))) {
                          throw 'Could not launch $privacyPolicyUrl';
                        }
                      }),
                  menuItem(
                      title: 'Feedback',
                      description: 'imamagun94@gmail.com',
                      bgColor: const Color(0xFFFF79D8).withOpacity(0.3),
                      duration: 800,
                      onTap: () async {
                        if (!await launchUrl(Uri.parse(feedbackMail))) {
                          throw 'Could not launch $feedbackMail';
                        }
                      }),
                  menuItem(
                      title: 'Rate us',
                      icon: SvgPicture.asset("assets/icon/star.svg",
                          height: 12.sp,
                          width: 12.sp,
                          color: Colors.black,
                          semanticsLabel: 'star'),
                      bgColor: const Color(0xFFFF7171).withOpacity(0.3),
                      duration: 900,
                      onTap: () async {
                        if (!await launchUrl(Uri.parse(appLink))) {
                          throw 'Could not launch $appLink';
                        }
                      }),
                  menuItem(
                      title: 'Other apps',
                      icon: SvgPicture.asset("assets/icon/play_store.svg",
                          height: 12.sp,
                          width: 12.sp,
                          color: Colors.black,
                          semanticsLabel: 'play_store'),
                      bgColor: const Color(0xFFAE7AFB).withOpacity(0.3),
                      duration: 1000,
                      onTap: () async {
                        if (!await launchUrl(Uri.parse(storeLink))) {
                          throw 'Could not launch $storeLink';
                        }
                      }),
                  menuItem(
                      title: 'Source code',
                      icon: SvgPicture.asset("assets/icon/git.svg",
                          height: 14.sp,
                          width: 14.sp,
                          color: Colors.black,
                          semanticsLabel: 'git source'),
                      bgColor: const Color(0xFF2DE786).withOpacity(0.3),
                      duration: 1100,
                      onTap: () async {
                        if (!await launchUrl(Uri.parse(sourceCodeLink))) {
                          throw 'Could not launch $storeLink';
                        }
                      }),
                  menuItem(
                      title: 'Icons by',
                      description: 'svgrepo.com',
                      bgColor: const Color(0xFF575880).withOpacity(0.3),
                      duration: 1200),
                  menuItem(
                    title: 'Version',
                    description: '1.0.0',
                    bgColor: const Color(0xFFFFB711).withOpacity(0.3),
                    duration: 1300,
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget menuItem(
      {required String title,
      String? description,
      Widget? icon,
      VoidCallback? onTap, required Color bgColor,
      required int duration}) {
    return FadeInUp(
      duration: Duration(milliseconds: duration),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(8.sp),
            child: Container(
              padding: EdgeInsets.all(15.sp),
              decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(8.sp),
                  border: Border.all(color: bgColor)),
                  // border: Border.all(color: const Color(0xFFF1F3F2))),
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
        ),
      ),
    );
  }
}
