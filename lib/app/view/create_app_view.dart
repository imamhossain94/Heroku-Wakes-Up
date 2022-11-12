import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'dialogues/dialogues.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            extendBody: true,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FadeInUp(
                    duration: const Duration(milliseconds: 500),
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.sp, right: 5.sp),
                      child: Row(
                        children: [
                          Text(
                            'Create app',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const Spacer(),
                          Material(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(8),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.asset("assets/icon/tick.svg",
                                    height: 22.sp,
                                    width: 22.sp,
                                    color: Colors.green.withOpacity(0.9),
                                    semanticsLabel: 'Menu'),
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            child: InkWell(
                              onTap: () {
                                Get.back();
                              },
                              borderRadius: BorderRadius.circular(8),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.asset(
                                    "assets/icon/multiply.svg",
                                    height: 22.sp,
                                    width: 22.sp,
                                    color: Colors.redAccent.withOpacity(0.8),
                                    semanticsLabel: 'Menu'),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 550),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15.sp, 0, 10.sp, 0),
                      child: Text(
                        'App name',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xFF613C96).withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                  customInputField(
                      hintText: 'Ex- Bubt Smart Notice',
                      controller: null,
                      duration: 550,
                      bgColor: const Color(0xFFFFB711)
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 600),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15.sp, 0, 10.sp, 0),
                      child: Text(
                        'Link',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xFF613C96).withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                  customInputField(
                      hintText: 'Ex- https://smart-notice-bubt.herokuapp.com/',
                      controller: null,
                      duration: 600,
                      bgColor: const Color(0xFFFF7171)
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
                                color: const Color(0xFFFF79D8).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8.sp),
                                border:
                                    Border.all(color: const Color(0xFFFF79D8).withOpacity(0.3))),
                            child: Row(
                              children: [
                                SvgPicture.asset("assets/icon/heroku_icon.svg",
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: List.generate(5, (index) {
                          return Container(
                            padding: EdgeInsets.all(8.sp),
                            decoration: BoxDecoration(
                                color: const Color(0xFF575880).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8.sp),
                                border:
                                    Border.all(color: const Color(0xFF575880).withOpacity(0.3))),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset("assets/icon/clock_square.svg",
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
            )),
      ),
    );
  }

  Widget customInputField(
      {required String hintText,
        required Color bgColor,
        TextEditingController? controller,
        required int duration}) {
    return FadeInUp(
      duration: Duration(milliseconds: duration),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
        child: TextFormField(
          maxLines: 1,
          controller: controller,
          inputFormatters: [
            LengthLimitingTextInputFormatter(60),
          ],
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              counterText: '',
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 10.sp,
                  color: Colors.black38,
                  letterSpacing: 0.2),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.sp),
                borderSide: BorderSide(
                  color: bgColor,
                  style: BorderStyle.solid,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.sp),
                borderSide: BorderSide(
                  color: bgColor.withOpacity(0.3),
                  style: BorderStyle.solid,
                ),
              ),
              enabled: true,
              fillColor: bgColor.withOpacity(0.1),
              filled: true),
        ),
      ),
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
            border: Border.all(color: const Color(0xFFFFA451).withOpacity(0.3))),
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
