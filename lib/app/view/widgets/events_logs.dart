import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroku_wake_up/app/controller/heroku_wake_up_app_controller.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import 'empty_message.dart';
import 'table_widgets.dart';

Widget eventLogs({required HerokuWakeUpAppController controller}) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.fromLTRB(10.sp, 0, 10.sp, 5.sp),
        child: THeader(
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
            itemCount: controller.eventList.length < 5
                ? controller.eventList.length
                : 5,
            reverse: false,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, ind) {
              int index = (controller.eventList.length -1) - ind;
              return Padding(
                padding: EdgeInsets.fromLTRB(10.sp, 0, 10.sp, 5.sp),
                child: TRow(
                    textColor: Colors.blueGrey,
                    fontSize: 8.sp,
                    borderRadius: index == 0//controller.eventList.length - 1
                        ? BorderRadius.only(
                            bottomRight: Radius.circular(8.sp),
                            bottomLeft: Radius.circular(8.sp))
                        : null,
                    data: [
                      DateFormat("dd.MM.yyyy h:mm a")
                          .format(DateTime.parse(controller.eventList[index].timestamp)).toString(),
                      controller.eventList[index].status,
                      controller.eventList[index].summary
                    ]),
              );
            }),
      ),
    ],
  );
}
