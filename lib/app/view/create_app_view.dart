import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/heroku_wake_up_controller.dart';
import '../utils/extensions.dart';
import '../utils/system_overlay.dart';
import 'dialogues/dialogues.dart';
import 'widgets/create_app_appbar.dart';
import 'widgets/custom_text_editing_field.dart';
import 'widgets/section_title.dart';

class CreateAppView extends StatelessWidget {
  const CreateAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemOverlay.transparent,
      child: GetBuilder<HerokuWakeUpController>(
          init: Get.find<HerokuWakeUpController>(),
          builder: (controller) {
            return Scaffold(
                backgroundColor: Colors.white,
                extendBody: true,
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      statusBarSize(),
                      createAppAppBar(),
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
                          hintText:
                              'Ex- https://smart-notice-bubt.herokuapp.com/',
                          controller: controller.appLinkTextController,
                          duration: 600,
                          bgColor: const Color(0xFFFF7171)),
                      sectionTitle(
                        title: 'From when to take this service?',
                      ),
                      FadeInUp(
                          duration: const Duration(milliseconds: 700),
                          child: const CustomTimePicker()),
                      FadeInUp(
                        duration: const Duration(milliseconds: 650),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(15.sp, 15.sp, 10.sp, 0),
                          child: Text(
                            'Give me a cup of coffee every?',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xFF613C96).withOpacity(0.8),
                            ),
                          ),
                        ),
                      ),
                      FadeInUp(
                        duration: const Duration(milliseconds: 700),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.sp, vertical: 5.sp),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                showAboutDialogue();
                              },
                              borderRadius: BorderRadius.circular(8.sp),
                              child: Container(
                                padding: EdgeInsets.all(15.sp),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFFF79D8)
                                        .withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8.sp),
                                    border: Border.all(
                                        color: const Color(0xFFFF79D8)
                                            .withOpacity(0.3))),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/icon/heroku_icon.svg",
                                        height: 14.sp,
                                        width: 14.sp,
                                        color: Colors.black,
                                        semanticsLabel: 'heroku-icon'),
                                    SizedBox(
                                      width: 10.sp,
                                    ),
                                    Text(
                                      '1 hours',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    const Spacer(),
                                    SvgPicture.asset(
                                        "assets/icon/down_arrow_square.svg",
                                        height: 14.sp,
                                        width: 14.sp,
                                        color: Colors.black,
                                        semanticsLabel: 'heroku-icon'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      FadeInUp(
                        duration: const Duration(milliseconds: 750),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(15.sp, 15.sp, 10.sp, 0),
                          child: Text(
                            'You will be given a cup of coffee during these times:',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xFF613C96).withOpacity(0.8),
                            ),
                          ),
                        ),
                      ),
                      FadeInUp(
                        duration: const Duration(milliseconds: 800),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.sp, vertical: 5.sp),
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: List.generate(5, (index) {
                              return Container(
                                padding: EdgeInsets.all(8.sp),
                                decoration: BoxDecoration(
                                    color: const Color(0xFF575880)
                                        .withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8.sp),
                                    border: Border.all(
                                        color: const Color(0xFF575880)
                                            .withOpacity(0.3))),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(
                                        "assets/icon/clock_square.svg",
                                        height: 12.sp,
                                        width: 12.sp,
                                        color: Colors.black,
                                        semanticsLabel: 'heroku-icon'),
                                    SizedBox(
                                      width: 8.sp,
                                    ),
                                    Text(
                                      '10:30 PM',
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                      )
                    ],
                  ),
                ));
          }),
    );
  }
}

class CustomTimePicker extends StatefulWidget {
  const CustomTimePicker({Key? key}) : super(key: key);

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8.sp),
            border:
                Border.all(color: const Color(0xFFFFA451).withOpacity(0.3))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.sp, top: 10.sp, bottom: 10.sp),
              child: Text(
                "From when to take this service?",
                style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xFF613C96).withOpacity(0.8),
                    fontWeight: FontWeight.normal),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                color: const Color(0xFFFFA451).withOpacity(0.1),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.sp),
                    bottomRight: Radius.circular(8.sp)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Material(
                            type: MaterialType.transparency,
                            child: Ink(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black54, width: 2.0),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(8.sp)),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(7.sp),
                                onTap: () {},
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.sp, vertical: 5.sp),
                                  child: SvgPicture.asset(
                                      "assets/icon/up_arrow.svg",
                                      height: 12.sp,
                                      width: 12.sp,
                                      color: Colors.black54,
                                      semanticsLabel: 'Menu'),
                                ),
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.sp),
                          child: Text(
                            "10",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Material(
                            type: MaterialType.transparency,
                            child: Ink(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black54, width: 2.0),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(8.sp)),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(7.sp),
                                onTap: () {},
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.sp, vertical: 5.sp),
                                  child: SvgPicture.asset(
                                      "assets/icon/down_arrow.svg",
                                      height: 12.sp,
                                      width: 12.sp,
                                      color: Colors.black54,
                                      semanticsLabel: 'Menu'),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.sp,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Material(
                            type: MaterialType.transparency,
                            child: Ink(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black54, width: 2.0),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(8.sp)),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(7.sp),
                                onTap: () {},
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.sp, vertical: 5.sp),
                                  child: SvgPicture.asset(
                                      "assets/icon/up_arrow.svg",
                                      height: 12.sp,
                                      width: 12.sp,
                                      color: Colors.black54,
                                      semanticsLabel: 'Menu'),
                                ),
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.sp),
                          child: Text(
                            "56",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Material(
                            type: MaterialType.transparency,
                            child: Ink(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black54, width: 2.0),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(8.sp)),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(7.sp),
                                onTap: () {},
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.sp, vertical: 5.sp),
                                  child: SvgPicture.asset(
                                      "assets/icon/down_arrow.svg",
                                      height: 12.sp,
                                      width: 12.sp,
                                      color: Colors.black54,
                                      semanticsLabel: 'Menu'),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.sp,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Material(
                            type: MaterialType.transparency,
                            child: Ink(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black54, width: 2.0),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(8.sp)),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(7.sp),
                                onTap: () {},
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.sp, vertical: 5.sp),
                                  child: SvgPicture.asset(
                                      "assets/icon/up_arrow.svg",
                                      height: 12.sp,
                                      width: 12.sp,
                                      color: Colors.black54,
                                      semanticsLabel: 'Menu'),
                                ),
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.sp),
                          child: Text(
                            "AM",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Material(
                            type: MaterialType.transparency,
                            child: Ink(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black54, width: 2.0),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(8.sp)),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(7.sp),
                                onTap: () {},
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.sp, vertical: 5.sp),
                                  child: SvgPicture.asset(
                                      "assets/icon/down_arrow.svg",
                                      height: 12.sp,
                                      width: 12.sp,
                                      color: Colors.black54,
                                      semanticsLabel: 'Menu'),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
