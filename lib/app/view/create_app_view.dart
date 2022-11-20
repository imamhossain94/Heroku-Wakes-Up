import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

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
    print(const Color(0xFFFF7171).withOpacity(0.2));

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
                  animDuration: 800
                ),
                customTextEditingField(
                    hintText: 'Ex- Bubt Smart Notice',
                    controller: controller.appNameTextController,
                    animDuration: 810,
                    bgColor: const Color(0x33cbd5e1)),
                sectionTitle(
                  title: 'Link',
                    animDuration: 820
                ),
                customTextEditingField(
                    hintText: 'Ex- https://smart-notice-bubt.herokuapp.com/',
                    controller: controller.appLinkTextController,
                    animDuration: 830,
                    bgColor: const Color(0x33cbd5e1)),
                sectionTitle(
                  title: 'From when to take this service?',
                    animDuration: 840
                ),
                customTimePicker(controller: controller),
                sectionTitle(
                  title: 'Give me a cup of coffee every?',
                    animDuration: 860
                ),
                intervalTimePicker(controller: controller),
                FadeInUp(
                  duration: const Duration(milliseconds: 880),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 15.sp, right: 10.sp, top: 15.sp, bottom: 5.sp),
                    child: Obx(() => Text(
                          'You will be given ${controller.coffeeServingTimes.length} cup of coffees per day. '
                          '${controller.coffeeServingTimes.length > 96 ? 'Only 96 out of '
                              '${controller.coffeeServingTimes.length} possible' : 'Possible'} '
                          'coffee serving times are listed bellow.',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: const Color(0xCC613C96),
                          ),
                        )),
                  ),
                ),
                wakingUpTimesWidget(controller: controller)
              ],
            ),
          )),
    );
  }
}
