import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/get_storage_service.dart';
import '../utils/constants.dart';
import '../utils/system_overlay.dart';
import 'widgets/menu_item.dart';

class MenuView extends StatelessWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemOverlay.transparent,
      child: Scaffold(
          backgroundColor: Colors.white,
          extendBody: true,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).viewPadding.top,
                ),
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
                              color: Colors.black,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          child: InkWell(
                            onTap: () {
                              Share.share(
                                  'Hey check out this android app $appLink');
                            },
                            borderRadius: BorderRadius.circular(8),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset("assets/icon/share.svg",
                                  height: 22.sp,
                                  width: 22.sp,
                                  color:
                                      const Color(0xFF613C96).withOpacity(0.9),
                                  semanticsLabel: 'Menu'),
                            ),
                          ),
                        ),
                        // Material(
                        //   color: Colors.transparent,
                        //   borderRadius: BorderRadius.circular(8),
                        //   child: InkWell(
                        //     onTap: () {},
                        //     borderRadius: BorderRadius.circular(8),
                        //     child: Padding(
                        //       padding: const EdgeInsets.all(10.0),
                        //       child: SvgPicture.asset(
                        //           "assets/icon/settings.svg",
                        //           height: 22.sp,
                        //           width: 22.sp,
                        //           color:
                        //               const Color(0xFF613C96).withOpacity(0.9),
                        //           semanticsLabel: 'Menu'),
                        //     ),
                        //   ),
                        // ),
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
                                  color: Colors.redAccent.withOpacity(0.8),
                                  semanticsLabel: 'multiply'),
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
                    bgColor: const Color(0xFF4EBBFF),
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
                    bgColor: const Color(0xFFFFA451),
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
                    bgColor: const Color(0xFF53F1F1),
                    duration: 700,
                    onTap: () async {
                      if (!await launchUrl(Uri.parse(privacyPolicyUrl))) {
                        throw 'Could not launch $privacyPolicyUrl';
                      }
                    }),
                menuItem(
                    title: 'Feedback',
                    description: 'imamagun94@gmail.com',
                    bgColor: const Color(0xFFFF79D8),
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
                    bgColor: const Color(0xFFFF7171),
                    duration: 900,
                    onTap: () async {
                      if (!await launchUrl(Uri.parse(appLink),
                          mode: LaunchMode.externalApplication)) {
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
                    bgColor: const Color(0xFFAE7AFB),
                    duration: 1000,
                    onTap: () async {
                      if (!await launchUrl(Uri.parse(storeLink),
                          mode: LaunchMode.externalApplication)) {
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
                    bgColor: const Color(0xFF2DE786),
                    duration: 1100,
                    onTap: () async {
                      if (!await launchUrl(Uri.parse(sourceCodeLink))) {
                        throw 'Could not launch $storeLink';
                      }
                    }),
                menuItem(
                    title: 'Icons by',
                    description: 'svgrepo.com',
                    bgColor: const Color(0xFF575880),
                    duration: 1200),
                menuItem(
                  title: 'Version',
                  description: appVersion(),
                  bgColor: const Color(0xFFFFB711),
                  duration: 1300,
                ),
              ],
            ),
          )),
    );
  }
}
