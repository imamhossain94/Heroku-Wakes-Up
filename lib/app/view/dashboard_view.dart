import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:heroku_wake_up/app/controller/heroku_wake_up_app_controller.dart';
import 'package:heroku_wake_up/app/utils/constants.dart';
import 'package:heroku_wake_up/app/view/app_list_view.dart';
import 'package:heroku_wake_up/app/view/create_app_view.dart';
import 'package:sizer/sizer.dart';

import '../utils/extensions.dart';
import '../utils/system_overlay.dart';
import 'events_logs_view.dart';
import 'widgets/activity_logs.dart';
import 'widgets/app_card.dart';
import 'widgets/dashboard_appbar.dart';
import 'widgets/dashboard_statistic_card.dart';
import 'widgets/empty_message.dart';
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
                            totalEvents: controller.totalEvents.value)),
                        sectionTitle(
                            title: 'App list',
                            animDuration: 500,
                            onAddClick: () {
                              controller.resetControllerValue();
                              Get.to(CreateAppView(
                                controller: controller,
                              ));
                            },
                            onListClick: () => Get.to(AppListView(
                                  controller: controller,
                                ))),
                        Obx(
                          () => controller.appList.isEmpty
                              ? empty(message: "Empty")
                              : ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  itemCount: controller.appList.length < 3
                                      ? controller.appList.length
                                      : 3,
                                  reverse: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return appCard(
                                        app: controller.appList[index],
                                        animDuration:
                                            800 + (10 * index).round(),
                                        cardColor: colorList[index],
                                        statusColor: colorList[index],
                                        confirmDismiss: (direction) async {
                                          if (direction ==
                                              DismissDirection.endToStart) {
                                            // TODO: delete this item.
                                            controller.deleteHerokuApp(
                                                controller.appList[index]);
                                            return true;
                                          } else {
                                            // TODO: edit this item.
                                            controller
                                                .loadControllerValueFromApp(
                                                    controller.appList[index])
                                                .then((value) =>
                                                    Get.to(CreateAppView(
                                                      controller: controller,
                                                    )));
                                          }
                                          return null;
                                        });
                                  }),
                        ),
                        Obx(() => controller.appList.length > 3
                            ? empty(
                                message: 'Show more',
                            height: 30.sp,
                                onTap: () => Get.to(AppListView(
                                      controller: controller,
                                    )))
                            : const SizedBox.shrink()),
                        sectionTitle(
                          title: 'Activity logs',
                          animDuration: 500,
                        ),
                        Obx(() => controller.chartData.isEmpty
                            ? empty(message: "Empty")
                            : controller.isLoadingEvent.value
                                ? empty(message: "Loading")
                                : ActivityLogs(
                                    bottomTitles: controller.bottomTitles,
                                    chartData: controller.chartData,
                                  )),
                        sectionTitle(
                            title: 'Events Logs',
                            animDuration: 500,
                            onListClick: () => Get.to(EventsLogsView(
                                  controller: controller,
                                ))),
                        eventLogs(controller: controller),
                        Obx(() => controller.eventList.length > 5
                            ? empty(
                            message: 'Show more',
                            height: 30.sp,
                            onTap: () => Get.to(EventsLogsView(
                              controller: controller,
                            )))
                            : const SizedBox.shrink()),
                      ],
                    ),
                  ));
            }),
      ),
    );
  }
}
