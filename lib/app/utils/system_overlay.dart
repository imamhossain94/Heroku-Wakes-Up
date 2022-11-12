/// Copyright, 2022, by the authors. All rights reserved.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

/// App SystemUiOverlayStyle.
/// This class is used to define the app SystemUiOverlayStyle.
abstract class SystemOverlay {
  static SystemUiOverlayStyle get welcome =>
      SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.black, systemNavigationBarColor: Colors.black);

  static SystemUiOverlayStyle get transparent =>
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: !Get.isDarkMode ? Colors.white : Colors.black,
        systemNavigationBarIconBrightness:
          !Get.isDarkMode ? Brightness.dark : Brightness.light,
        statusBarBrightness:
          !Get.isDarkMode ? Brightness.dark : Brightness.light,
        statusBarIconBrightness:
          !Get.isDarkMode ? Brightness.dark : Brightness.light,
      );

  static SystemUiOverlayStyle get common => SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: !Get.isDarkMode ? Colors.white : Colors.black,
        systemNavigationBarIconBrightness:
            !Get.isDarkMode ? Brightness.dark : Brightness.light,
        statusBarColor: !Get.isDarkMode ? Colors.white : Colors.black,
        statusBarBrightness:
            !Get.isDarkMode ? Brightness.dark : Brightness.light,
        statusBarIconBrightness:
            !Get.isDarkMode ? Brightness.dark : Brightness.light,
      );
}
