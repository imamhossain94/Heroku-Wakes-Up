import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heroku_wake_up/app/controller/heroku_wake_up_controller.dart';
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
        child: GetBuilder<HerokuWakeUpController>(
            init: Get.find<HerokuWakeUpController>(),
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
                        dashboardStatisticCard(totalApps: 3, totalEvents: 150),
                        sectionTitle(
                            title: 'App list',
                            icon: SvgPicture.asset(
                                "assets/icon/plus_square.svg",
                                height: 14.sp,
                                width: 14.sp,
                                color: const Color(0xFF613C96).withOpacity(0.8),
                                semanticsLabel: 'heroku-icon'),
                            onTap: () => Get.to(const CreateAppView())),
                        appCard(
                          cardColor: const Color(0xFFFF6384).withOpacity(0.2),
                          title: 'Bubt Smart Routine',
                          description:
                              'Give me a cup of coffee every 30 minutes',
                          statusColor: const Color(0xFF2CB77F).withOpacity(0.8),
                        ),
                        appCard(
                          cardColor: const Color(0xFF9966FF).withOpacity(0.2),
                          title: 'Url Shortener',
                          description:
                              'Give me a cup of coffee every 720 minutes',
                          statusColor: const Color(0xFF2CB77F).withOpacity(0.8),
                        ),
                        appCard(
                          cardColor: const Color(0xFF4BC0C0).withOpacity(0.2),
                          title: 'Bubt Smart Notice',
                          description:
                              'Give me a cup of coffee every 360 minutes',
                          statusColor: const Color(0xFF2CB77F).withOpacity(0.8),
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
