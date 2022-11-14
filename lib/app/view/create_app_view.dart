import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controller/heroku_wake_up_app_controller.dart';
import '../utils/extensions.dart';
import '../utils/system_overlay.dart';
import 'widgets/create_app_appbar.dart';
import 'widgets/custom_text_editing_field.dart';
import 'widgets/custom_time_picker.dart';
import 'widgets/interval_time_picker.dart';
import 'widgets/section_title.dart';
import 'widgets/waking_up_time_widget.dart';

class CreateAppView extends StatelessWidget {
  final HerokuWakeUpAppController controller;
  const CreateAppView({Key? key, required this.controller}) : super(key: key);

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
                statusBarSize(),
                createAppAppBar(
                  controller: controller,
                ),
                sectionTitle(
                  title: 'App name',
                ),
                customTextEditingField(
                    hintText: 'Ex- Bubt Smart Notice',
                    controller: controller.appNameTextController,
                    duration: 550,
                    bgColor: const Color(0xFFFFB711)),
                sectionTitle(
                  title: 'Link',
                ),
                customTextEditingField(
                    hintText: 'Ex- https://smart-notice-bubt.herokuapp.com/',
                    controller: controller.appLinkTextController,
                    duration: 600,
                    bgColor: const Color(0xFFFF7171)),
                sectionTitle(
                  title: 'From when to take this service?',
                ),
                customTimePicker(controller: controller),
                sectionTitle(
                  title: 'Give me a cup of coffee every?',
                ),
                intervalTimePicker(controller: controller),
                Obx(() => sectionTitle(
                      title:
                          'You will be given ${controller.coffeeServingTimes.length} cup of coffees per day:',
                    )),
                wakingUpTimesWidget(controller: controller)
              ],
            ),
          )),
    );
  }
}
