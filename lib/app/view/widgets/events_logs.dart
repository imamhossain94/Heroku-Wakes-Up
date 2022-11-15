import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroku_wake_up/app/controller/heroku_wake_up_app_controller.dart';
import 'package:sizer/sizer.dart';

import 'table_widgets.dart';

Widget eventLogs({required HerokuWakeUpAppController controller}) {
  return FadeInUp(
    duration: const Duration(milliseconds: 1300),
    child: Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 10.sp, right: 10.sp, bottom: 15.sp),
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
                itemCount: controller.eventList.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return TRow(textColor: Colors.black54, fontSize: 8.sp, data: [
                    controller.eventList[index].timestamp,
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
