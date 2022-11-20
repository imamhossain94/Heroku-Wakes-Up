import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heroku_wake_up/app/controller/heroku_wake_up_app_controller.dart';
import 'package:sizer/sizer.dart';

import '../utils/constants.dart';
import '../utils/system_overlay.dart';
import 'create_app_view.dart';
import 'widgets/app_card.dart';
import 'widgets/empty_message.dart';

class AppListView extends StatelessWidget {
  final HerokuWakeUpAppController controller;

  const AppListView({Key? key, required this.controller}) : super(key: key);

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
                            'App list',
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
                            onTap: () => controller.deleteAllHerokuApp(),
                            borderRadius: BorderRadius.circular(8),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset("assets/icon/trash.svg",
                                  height: 22.sp,
                                  width: 22.sp,
                                  color: const Color(0xFF000000).withOpacity(0.7),
                                  semanticsLabel: ''),
                            ),
                          ),
                        ),
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
                                  color: const Color(0xFF000000).withOpacity(0.7),
                                  semanticsLabel: ''),
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
                Obx(
                  () => controller.appList.isEmpty
                      ? empty("Empty")
                      : ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: controller.appList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return appCard(
                            app: controller.appList[index],
                            animDuration: 800 + (10 * index).round(),
                            cardColor: colorList[index],
                            statusColor: colorList[index],
                            confirmDismiss: (direction) async {
                              if (direction == DismissDirection.endToStart) {
                                // TODO: delete this item.
                                controller
                                    .deleteHerokuApp(controller.appList[index]);
                                return true;
                              } else {
                                // TODO: edit this item.
                                controller
                                    .loadControllerValueFromApp(
                                        controller.appList[index])
                                    .then((value) => Get.to(CreateAppView(
                                          controller: controller,
                                        )));
                              }
                              return null;
                            });
                      }),
                ),
              ],
            ),
          )),
    );
  }
}
