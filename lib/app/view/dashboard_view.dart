import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heroku_wake_up/app/controller/create_app_controller.dart';
import 'package:heroku_wake_up/app/utils/constants.dart';
import 'package:heroku_wake_up/app/view/create_app_view.dart';
import 'package:sizer/sizer.dart';
import 'package:uuid/uuid.dart';

import '../controller/dashboard_controller.dart';
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
        child: GetBuilder<DashboardController>(
            init: Get.find<DashboardController>(),
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
                            onTap: () {
                              var id = const Uuid().v1();
                              Get.to(CreateAppView(
                                controller: Get.put(CreateAppController(id: id),
                                    tag: id),
                              ));
                            }),
                        Obx(
                          () => Column(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(controller.appList.length,
                                  (index) {
                                return appCard(
                                  cardColor:
                                      Color(colorList[index]).withOpacity(0.2),
                                  title: controller.appList[index].name,
                                  description:
                                      'Give me a cup of coffee every ${controller.appList[index].interval} minutes',
                                  statusColor:
                                      Color(colorList[index]).withOpacity(0.8),
                                );
                              })),
                        ),
                        // sectionTitle(
                        //   title: 'Events Life Line',
                        // ),
                        //eventsLifeLine(),
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
