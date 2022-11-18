import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:heroku_wake_up/app/controller/heroku_wake_up_app_controller.dart';
import 'package:heroku_wake_up/app/utils/constants.dart';
import 'package:heroku_wake_up/app/view/app_list_view.dart';
import 'package:heroku_wake_up/app/view/create_app_view.dart';

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
                            totalEvents: controller.eventList.length)),
                        sectionTitle(
                            title: 'App list',
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
                              ? empty("Empty")
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
                                    cardColor: Color(colorList[index])
                                        .withOpacity(0.2),
                                    statusColor: Color(colorList[index])
                                        .withOpacity(0.8),
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
                        sectionTitle(
                          title: 'Activity logs',
                        ),
                        Obx(() => controller.eventList.isEmpty
                            ? empty("Empty")
                            : controller.isLoadingEvent.value
                            ? empty("Loading...")
                            : ActivityLogs(
                          bottomTitles: controller.bottomTitles,
                          chartData: controller.chartData,
                        )),
                        sectionTitle(
                            title: 'Events Logs',
                            onListClick: () => Get.to(EventsLogsView(
                              controller: controller,
                            ))),
                        eventLogs(controller: controller)
                      ],
                    ),
                  ));
            }),
      ),
    );
  }
}