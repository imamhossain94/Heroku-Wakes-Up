import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heroku_wake_up/app/controller/heroku_wake_up_app_controller.dart';
import 'package:sizer/sizer.dart';

import '../utils/system_overlay.dart';
import 'widgets/table_widgets.dart';

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
                            'Events Logs',
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
                            onTap: () => controller.deleteAllHerokuEvents,
                            borderRadius: BorderRadius.circular(8),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset("assets/icon/trash.svg",
                                  height: 22.sp,
                                  width: 22.sp,
                                  color: Colors.redAccent.withOpacity(0.8),
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
                                  color: Colors.redAccent.withOpacity(0.8),
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
                THeader(
                  bgColor: Colors.white,
                  padding: EdgeInsets.all(10.sp),
                  textColor: Colors.black,
                  fontSize: 10.sp,
                ),
                Obx(
                  () => ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: controller.eventList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      reverse: true,
                      itemBuilder: (context, index) {
                        return TRow(
                            textColor: Colors.black54,
                            fontSize: 8.sp,
                            borderRadius:
                                index == controller.eventList.length - 1
                                    ? BorderRadius.only(
                                        bottomRight: Radius.circular(8.sp),
                                        bottomLeft: Radius.circular(8.sp))
                                    : null,
                            data: [
                              controller.eventList[index].timestamp,
                              controller.eventList[index].status,
                              controller.eventList[index].summary
                            ]);
                      }),
                ),
              ],
            ),
          )),
    );
  }
}
