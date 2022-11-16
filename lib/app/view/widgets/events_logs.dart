import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroku_wake_up/app/controller/heroku_wake_up_app_controller.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import 'table_widgets.dart';

Widget eventLogs({required HerokuWakeUpAppController controller}) {
  return FadeInUp(
    duration: const Duration(milliseconds: 1300),
    child: Container(
      margin: EdgeInsets.only(left: 10.sp, right: 10.sp, bottom: 15.sp),
      decoration: BoxDecoration(
          color: Colors.orangeAccent.withOpacity(0.02),
          borderRadius: BorderRadius.circular(8.sp)),
      child: Column(
        children: [
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
                itemCount: controller.eventList.length < 5
                    ? controller.eventList.length
                    : 5,
                reverse: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return TRow(
                      textColor: Colors.blueGrey,
                      fontSize: 8.sp,
                      borderRadius: index == controller.eventList.length - 1
                          ? BorderRadius.only(
                              bottomRight: Radius.circular(8.sp),
                              bottomLeft: Radius.circular(8.sp))
                          : null,
                      data: [
                        DateFormat("dd.MM.yyyy h:mm a")
                            .format(DateTime.parse(controller.eventList[index].timestamp)).toString(),
                        controller.eventList[index].status,
                        controller.eventList[index].summary
                      ]);
                }),
          ),
        ],
      ),
    ),
  );
}
