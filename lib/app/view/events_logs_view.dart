import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heroku_wake_up/app/controller/heroku_wake_up_app_controller.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

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
                            onTap: () => controller.deleteAllHerokuEvents,
                            borderRadius: BorderRadius.circular(8),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset("assets/icon/trash.svg",
                                  height: 22.sp,
                                  width: 22.sp,
                                  color:
                                      const Color(0xFFFFBD44).withOpacity(0.7),
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
                                      const Color(0xFFFE605C).withOpacity(0.7),
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
                  padding: EdgeInsets.fromLTRB(10.sp, 0, 10.sp, 5.sp),
                  child: THeader(
                    animDuration: 500,
                    bgColor: Colors.white,
                    padding: EdgeInsets.all(10.sp),
                    textColor: Colors.black,
                    fontSize: 10.sp,
                  ),
                ),
                Obx(
                  () => controller.eventList.isEmpty
                      ? empty("Empty")
                      : ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount: controller.eventList.length,
                          reverse: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  EdgeInsets.fromLTRB(10.sp, 0, 10.sp, 5.sp),
                              child: TRow(
                                  animDuration:
                                      500 + (500 * (index / 50)).round(),
                                  textColor: Colors.blueGrey,
                                  fontSize: 8.sp,
                                  borderRadius: index ==
                                          0 //controller.eventList.length - 1
                                      ? BorderRadius.only(
                                          bottomRight: Radius.circular(8.sp),
                                          bottomLeft: Radius.circular(8.sp))
                                      : null,
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
