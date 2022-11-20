import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroku_wake_up/app/controller/heroku_wake_up_app_controller.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../utils/constants.dart';
import 'empty_message.dart';
import 'table_widgets.dart';

Widget eventLogs({required HerokuWakeUpAppController controller}) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.fromLTRB(10.sp, 0, 10.sp, 15.sp),
        child: THeader(
          bgColor: const Color(0xFF94a3b8),
          padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 15.sp),
          textColor: Colors.white,
          fontSize: 10.sp,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF94a3b8).withOpacity(0.5),
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
            itemCount: controller.eventList.length < 5
                ? controller.eventList.length
                : 5,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(10.sp, 0, 10.sp, 5.sp),
                child: TRow(
                    textColor: Colors.black,
                    fontSize: 8.sp,
                    bgColor: const Color(0xFFe2e8f0),
                    borderRadius: null,
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
