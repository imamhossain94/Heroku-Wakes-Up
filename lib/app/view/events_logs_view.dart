import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heroku_wake_up/app/controller/heroku_wake_up_app_controller.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../utils/constants.dart';
import '../utils/system_overlay.dart';
import 'widgets/empty_message.dart';
import 'widgets/table_widgets.dart';

class EventsLogsView extends StatelessWidget {
  final HerokuWakeUpAppController controller;

  const EventsLogsView({Key? key, required this.controller}) : super(key: key);

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
                            onTap: () => controller.deleteAllHerokuEvents(),
                            borderRadius: BorderRadius.circular(8),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset("assets/icon/trash.svg",
                                  height: 22.sp,
                                  width: 22.sp,
                                  color:
                                      const Color(0xFF000000).withOpacity(0.7),
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
                                  color:
                                      const Color(0xFF000000).withOpacity(0.7),
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
                Padding(
                  padding: EdgeInsets.fromLTRB(10.sp, 0, 10.sp, 15.sp),
                  child: THeader(
                    animDuration: 500,
                    bgColor: const Color(0xFF3B484C),
                    padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 15.sp),
                    textColor: Colors.white,
                    fontSize: 10.sp,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF3B484C).withOpacity(0.5),
                        spreadRadius: 0.5,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => controller.eventList.isEmpty
                      ? empty("Empty")
                      : ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount: controller.eventList.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  EdgeInsets.fromLTRB(10.sp, 0, 10.sp, 5.sp),
                              child: TRow(
                                  animDuration: 100,
                                      //500 + (500 * (index / 50)).round(),
                                  textColor: Colors.blueGrey,
                                  bgColor: const Color(0xFFe2e8f0),
                                  fontSize: 8.sp,
                                  data: [
                                    DateFormat("dd.MM.yyyy h:mm a")
                                        .format(DateTime.parse(controller
                                            .eventList[index].timestamp))
                                        .toString(),
                                    controller.eventList[index].status,
                                    controller.eventList[index].summary
                                  ]),
                            );
                          }),
                ),
              ],
            ),
          )),
    );
  }
}
