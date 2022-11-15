import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../model/heroku_app.dart';
import '../services/hive_helper.dart';
import '../utils/extensions.dart';

class HerokuWakeUpAppController extends GetxController {
  var isLoading = false.obs;
  var appList = <HerokuApp>[].obs;
  int? index;

  late TextEditingController appNameTextController;
  late TextEditingController appLinkTextController;

  // Time selector
  var hours = [for (var i = 1; i <= 12; i++) '$i'];
  var minutes = [for (var i = 0; i < 60; i++) i < 10 ? '0$i' : '$i'];
  var meridiem = ['AM', 'PM'];

  var hourIndex = 0.obs;
  var minuteIndex = 0.obs;
  var meridiemIndex = 0.obs;

  // Interval selector
  var intervalHours = [for (var i = 1; i <= 12; i++) '$i'];
  var intervalMinutes = ['15', '30'];
  var intervalHourOrMinute = ['H', 'M'];

  var intervalHourOrMinuteIndex = 0.obs;
  var intervalHoursIndex = 11.obs;
  var intervalMinuteIndex = 0.obs;

  // Possible coffee serving time
  var coffeeServingTimes = <String>[].obs;

  @override
  void onInit() {
    appNameTextController = TextEditingController();
    appLinkTextController = TextEditingController();
    fetchApps();
    possibleServingTime();
    super.onInit();
  }

  @override
  void dispose() {
    appNameTextController.dispose();
    appLinkTextController.dispose();
    super.dispose();
  }

  void fetchApps() {
    isLoading(true);
    appList.value = getAppList();
    isLoading(false);
  }

  void loadControllerValueFromApp(int appIndex) {
    index = appIndex;
    var app = appList[appIndex];
    appNameTextController.text = app.name;
    appLinkTextController.text = app.link;
    hourIndex.value = app.hourIndex;
    minuteIndex.value = app.minuteIndex;
    meridiemIndex.value = app.meridiemIndex;
    intervalHourOrMinuteIndex.value = app.intervalHourOrMinuteIndex;
    intervalHoursIndex.value = app.intervalHoursIndex;
    intervalMinuteIndex.value = app.intervalMinuteIndex;
    coffeeServingTimes.addAll(app.wakingUpTimes);
    fetchApps();
    update();
  }

  void resetControllerValue() {
    index = null;
    appNameTextController.clear();
    appLinkTextController.clear();
    hourIndex.value = 0;
    minuteIndex.value = 0;
    meridiemIndex.value = 0;
    intervalHourOrMinuteIndex.value = 0;
    intervalHoursIndex.value = 11;
    intervalMinuteIndex.value = 0;
    coffeeServingTimes.clear();
    possibleServingTime();
    fetchApps();
    update();
  }

  // Custom Time Picker
  void customTimeHourIncrement() {
    hourIndex < 11 ? hourIndex++ : hourIndex.value = 0;
    possibleServingTime();
  }

  void customTimeHourDecrement() {
    hourIndex > 0 ? hourIndex-- : hourIndex.value = 11;
    possibleServingTime();
  }

  void customTimeMinuteIncrement() {
    minuteIndex < 59 ? minuteIndex++ : minuteIndex.value = 0;
    possibleServingTime();
  }

  void customTimeMinuteDecrement() {
    minuteIndex > 0 ? minuteIndex-- : minuteIndex.value = 59;
    possibleServingTime();
  }

  void customTimeMeridiemIncrement() {
    meridiemIndex.value == 0 ? meridiemIndex++ : meridiemIndex.value = 0;
    possibleServingTime();
  }

  void customTimeMeridiemDecrement() {
    meridiemIndex.value == 1 ? meridiemIndex-- : meridiemIndex.value = 1;
    possibleServingTime();
  }

  // Interval time picker
  void intervalTimeIncrement() {
    if (intervalHourOrMinuteIndex.value == 0) {
      intervalHoursIndex < 11
          ? intervalHoursIndex++
          : intervalHoursIndex.value = 0;
    } else {
      intervalMinuteIndex.value == 0
          ? intervalMinuteIndex++
          : intervalMinuteIndex.value = 0;
    }
    possibleServingTime();
  }

  void intervalTimeDecrement() {
    if (intervalHourOrMinuteIndex.value == 0) {
      intervalHoursIndex > 0
          ? intervalHoursIndex--
          : intervalHoursIndex.value = 11;
    } else {
      intervalMinuteIndex.value == 1
          ? intervalMinuteIndex--
          : intervalMinuteIndex.value == 1;
    }
    possibleServingTime();
  }

  void intervalClockTypeIncrement() {
    intervalHourOrMinuteIndex.value == 0
        ? intervalHourOrMinuteIndex++
        : intervalHourOrMinuteIndex.value = 0;
    possibleServingTime();
  }

  void intervalClockTypeDecrement() {
    intervalHourOrMinuteIndex.value == 1
        ? intervalHourOrMinuteIndex--
        : intervalHourOrMinuteIndex.value = 1;
    possibleServingTime();
  }

  // Possible Coffee Serving Times generator function
  void possibleServingTime() async {
    coffeeServingTimes.clear();

    var h = int.parse(hours[hourIndex.value]);
    var m = minutes[minuteIndex.value];
    var a = meridiem[meridiemIndex.value];
    h = (a == meridiem[0]) ? (h == 12 ? 0 : h) : (h != 12 ? h + 12 : h);
    // Interval
    var clockType = intervalHourOrMinute[intervalHourOrMinuteIndex.value];

    if (clockType == intervalHourOrMinute[0]) {
      int intervalHour = int.parse(intervalHours[intervalHoursIndex.value]);
      for (int i = 0; i < ((24 - 6) / intervalHour).floor(); i++) {
        h = ((h + (intervalHour * i) > 23))
            ? (h + (intervalHour * i) - 24)
            : (h + (intervalHour * i));
        DateTime tempDate = DateFormat("hh:mm").parse('$h:$m');
        coffeeServingTimes.add(DateFormat("h:mm a").format(tempDate));
      }
    } else {
      int intervalMinute =
          int.parse(intervalMinutes[intervalMinuteIndex.value]);

      for (int i = 0; i < ((24 - 6) * 60 / intervalMinute).floor(); i++) {
        int intervalTime = ((intervalMinute % 1440) +
                (h * 60 + (intervalMinute * i) + int.parse(m)) +
                1440) %
            1440;
        DateTime tempDate = DateFormat("hh:mm")
            .parse('${intervalTime ~/ 60}:${intervalTime % 60}');
        coffeeServingTimes.add(DateFormat("h:mm a").format(tempDate));
      }
    }
  }

  void createApp() {
    String appName = appNameTextController.text.toString();
    String appLink = appLinkTextController.text.toString();

    if (appName.isNotEmpty && appLink.isNotEmpty) {
      var interval = intervalHourOrMinute[intervalHourOrMinuteIndex.value] ==
              intervalHourOrMinute[0]
          ? intervalHours[intervalHoursIndex.value]
          : intervalMinutes[intervalMinuteIndex.value];

      var herokuApp = HerokuApp(
        id: index != null ? index.toString() : '',
        name: appName,
        link: appLink,
        startTime:
            '${hours[hourIndex.value]}:${minutes[minuteIndex.value]} ${meridiem[meridiemIndex.value]}',
        interval:
            '$interval/${intervalHourOrMinute[intervalHourOrMinuteIndex.value]}',
        wakingUpTimes: coffeeServingTimes,
        status: true,
        hourIndex: hourIndex.value,
        minuteIndex: minuteIndex.value,
        meridiemIndex: meridiemIndex.value,
        intervalHourOrMinuteIndex: intervalHourOrMinuteIndex.value,
        intervalHoursIndex: intervalHoursIndex.value,
        intervalMinuteIndex: intervalMinuteIndex.value,
      );

      if(index != null) {
        updateApp(herokuApp);
      }else{
        saveApp(herokuApp);
      }

      resetControllerValue();
      Get.back();
    } else {
      showMessage('Please enter both name and link');
    }
  }

  void deleteHerokuApp(int index) {
    deleteApp(index);
    resetControllerValue();
  }

}