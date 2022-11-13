import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heroku_wake_up/app/controller/heroku_wake_up_app_controller.dart';
import 'package:heroku_wake_up/app/utils/constants.dart';
import 'package:heroku_wake_up/app/view/create_app_view.dart';
import 'package:sizer/sizer.dart';

import '../utils/extensions.dart';
import '../utils/system_overlay.dart';
import 'widgets/app_card.dart';
import 'widgets/dashboard_appbar.dart';
import 'widgets/dashboard_statistic_card.dart';
import 'widgets/events_life_line.dart';
import 'widgets/events_logs.dart';
import 'widgets/section_title.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemOverlay.transparent,
        child: GetBuilder<HerokuWakeUpAppController>(
            init: Get.find<HerokuWakeUpAppController>(),
            builder: (controller) {
              return Scaffold(
                  backgroundColor: Colors.white, // const Color(0xFFE8E9E6),
                  extendBody: true,
                  body: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        statusBarSize(),
                        dashboardAppBar(),
                        Obx(() => dashboardStatisticCard(
                            totalApps: controller.appList.length,
                            totalEvents: 150)),
                        sectionTitle(
                            title: 'App list',
                            icon: SvgPicture.asset(
                                "assets/icon/plus_square.svg",
                                height: 14.sp,
                                width: 14.sp,
                                color: const Color(0xFF613C96).withOpacity(0.8),
                                semanticsLabel: 'heroku-icon'),
                            onTap: () => Get.to(CreateAppView(
                                  controller: controller,
                                ))),
                        Obx(
                          () => ListView.builder(
                            shrinkWrap: true,
                              itemCount: controller.appList.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Dismissible(
                                  key: Key(controller.appList[index].id),
                                  child: appCard(
                                    cardColor:
                                    Color(colorList[index]).withOpacity(0.2),
                                    title: controller.appList[index].name,
                                    description:
                                    'Give me a cup of coffee every ${controller.appList[index].interval} minutes',
                                    statusColor:
                                    Color(colorList[index]).withOpacity(0.8),
                                  ),
                                  background: Container(
                                    alignment: Alignment.center,
                                     margin: EdgeInsets.all(10.sp),
                                     decoration: BoxDecoration(
                                       color: Colors.red,
                                       borderRadius: BorderRadius.circular(8.sp)
                                     ),
                                      child: Text('Delete'),
                                  ),
                                );
                              }
                          ),
                        ),
                        sectionTitle(
                          title: 'Events Life Line',
                        ),
                        eventsLifeLine(),
                        sectionTitle(
                          title: 'Events Logs',
                        ),
                        eventLogs()
                      ],
                    ),
                  ));
            }),
      ),
    );
  }
}
