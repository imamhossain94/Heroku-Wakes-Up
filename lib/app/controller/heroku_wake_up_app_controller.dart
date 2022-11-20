import 'dart:isolate';
import 'dart:ui';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroku_wake_up/main.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../model/events.dart';
import '../model/heroku_app.dart';
import '../services/get_storage_service.dart';
import '../services/hive_helper.dart';
import '../utils/constants.dart';
import '../utils/extensions.dart';

class HerokuWakeUpAppController extends GetxController {
  static SendPort? uiSendPort;

  var isLoading = false.obs;
  var appList = <HerokuApp>[].obs;
  var eventList = <Events>[].obs;
  var id = '';

  var isLoadingEvent = false.obs;
  List<String> bottomTitles = [];
  List<List<int>> chartData = [];

  late TextEditingController appNameTextController;
  late TextEditingController appLinkTextController;

  var hourIndex = 0.obs;
  var minuteIndex = 0.obs;
  var meridiemIndex = 0.obs;

  var intervalHourOrMinuteIndex = 0.obs;
  var intervalHoursIndex = 11.obs;
  var intervalMinuteIndex = 5.obs;

  var coffeeServingTimes = <String>[].obs;

  @override
  void onInit() {
    appNameTextController = TextEditingController();
    appLinkTextController = TextEditingController();
    fetchApps();
    fetchEvents();
    possibleServingTime();
    initializeAlarmManager();
    startAlarmService();
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

  void fetchEvents() {
    isLoading(true);
    eventList.value = getEventList();
    generateActivityLogData();
    isLoading(false);
  }

  void generateActivityLogData() async {
    if (chartData.isEmpty) {
      isLoadingEvent(true);
    }
    chartData = [];
    var now = DateTime.now();
    var startDate = now.subtract(const Duration(days: 11));
    List<DateTime> dateList = getDaysInBetween(startDate, now);

    var activities = getActivities();

    for (var date in dateList) {
      int totalEvents = 0;
      int successEvents = 0;
      int failureEvents = 0;

      for (var activity in activities) {
        var activityDate = DateFormat('d/M/yyyy').parse(activity.id);
        if (date.month == activityDate.month && date.day == activityDate.day) {
          totalEvents = activity.events;
          successEvents = activity.success;
          failureEvents = activity.failure;
        }
      }
      bottomTitles.add(DateFormat('E').format(date));
      chartData.add([totalEvents, successEvents, failureEvents]);
    }
    if (isLoadingEvent.value) {
      await Future.delayed(const Duration(seconds: 1));
    }
    isLoadingEvent(false);
  }

  Future<void> loadControllerValueFromApp(HerokuApp app) async {
    id = app.id;
    appNameTextController.text = app.name;
    appLinkTextController.text = app.link;
    hourIndex.value = app.hourIndex;
    minuteIndex.value = app.minuteIndex;
    meridiemIndex.value = app.meridiemIndex;
    intervalHourOrMinuteIndex.value = app.intervalHourOrMinuteIndex;
    intervalHoursIndex.value = app.intervalHoursIndex;
    intervalMinuteIndex.value = app.intervalMinuteIndex;
    coffeeServingTimes.clear();
    if (app.wakingUpTimes.isNotEmpty) {
      coffeeServingTimes.addAll(app.wakingUpTimes);
    }
    fetchApps();
    update();
  }

  void resetControllerValue() {
    id = '';
    appNameTextController.clear();
    appLinkTextController.clear();
    hourIndex.value = 0;
    minuteIndex.value = 0;
    meridiemIndex.value = 0;
    intervalHourOrMinuteIndex.value = 0;
    intervalHoursIndex.value = 11;
    intervalMinuteIndex.value = 5;
    coffeeServingTimes.clear();
    possibleServingTime();
    fetchApps();
    fetchEvents();
    update();
  }

  // AlarmService
  void initializeAlarmManager() {
    try {
      AndroidAlarmManager.initialize();
      port.listen((_) async => await refreshUIData());
    } on Exception catch (_, e) {
      saveEvent(Events(
        id: const Uuid().v1().toString(),
        appId: "83568801",
        appName: "AndroidAlarmManager",
        timestamp: DateTime.now().toString(),
        status: 'failure',
        summary: 'Failed to initialize Android alarm manager: $e',
      ));
    }
  }

  Future<void> refreshUIData() async {
    fetchEvents();
  }

  @pragma('vm:entry-point')
  static Future<void> repeatTask() async {
    await initHive();

    // Alarm fired
    // saveEvent(Events(
    //   id: const Uuid().v1().toString(),
    //   appId: "83568801",
    //   appName: "AndroidAlarmManager",
    //   timestamp: DateTime.now().toString(),
    //   status: 'success',
    //   summary: 'Alarm fired',
    // ));

    // Checking for make api requests
    var appList = getAppList();
    for (var app in appList) {
      bool flag = false;
      DateTime now = DateTime.now();
      for (var wake in app.wakingUpTimes) {
        DateTime wakeUpTime = DateFormat("dd.MM.yyyy h:mm a")
            .parse('${now.day}.${now.month}.${now.year} $wake');
        DateTime startDate = now.subtract(const Duration(seconds: 150));
        DateTime endDate = now.add(const Duration(seconds: 150));
        if (startDate.isBefore(wakeUpTime) && endDate.isAfter(wakeUpTime)) {
          flag = true;
          break;
        }
      }
      if (flag) {
        try {
          var response = await Dio().get(app.link);
          await saveEvent(Events(
            id: const Uuid().v1().toString(),
            appId: app.id,
            appName: app.name,
            timestamp: DateTime.now().toString(),
            status: 'success',
            summary: '$response',
          ));
        } catch (e) {
          await saveEvent(Events(
            id: const Uuid().v1().toString(),
            appId: app.id,
            appName: app.name,
            timestamp: DateTime.now().toString(),
            status: 'failure',
            summary: '$e',
          ));
        }
      }
    }

    uiSendPort ??= IsolateNameServer.lookupPortByName(isolateName);
    uiSendPort?.send(null);
  }

  void startAlarmService() async {
    if (isBackgroundFetchRunning()) {
      setBackgroundFetchRunningStatus(true);
    } else {
      int id = 1082030;
      try{
        AndroidAlarmManager.cancel(id);
      }on Exception catch (_){ }

      bool result = await AndroidAlarmManager.periodic(
          const Duration(minutes: 1), id, repeatTask,
          rescheduleOnReboot: true, exact: true, allowWhileIdle: true);
      setBackgroundFetchRunningStatus(result);
      await saveEvent(Events(
        id: const Uuid().v1().toString(),
        appId: id.toString(),
        appName: "AndroidAlarmManager",
        timestamp: DateTime.now().toString(),
        status: result ? 'success' : 'failure',
        summary: result
            ? 'AndroidAlarmManager is running successfully'
            : 'Failed to start Android alarm manager',
      ));
      fetchEvents();
    }
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
      intervalMinuteIndex < 59
          ? intervalMinuteIndex++
          : intervalMinuteIndex.value = 1;
    }
    possibleServingTime();
  }

  void intervalTimeDecrement() {
    if (intervalHourOrMinuteIndex.value == 0) {
      intervalHoursIndex > 0
          ? intervalHoursIndex--
          : intervalHoursIndex.value = 11;
    } else {
      intervalMinuteIndex > 1
          ? intervalMinuteIndex--
          : intervalMinuteIndex.value = 59;
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
      int intervalHour = int.parse(hours[intervalHoursIndex.value]);
      for (int i = 0; i < ((24 - sleepingHours) / intervalHour).floor(); i++) {
        h = ((h + (intervalHour * i) > 23))
            ? (h + (intervalHour * i) - 24)
            : (h + (intervalHour * i));
        DateTime tempDate = DateFormat("hh:mm").parse('$h:$m');
        coffeeServingTimes.add(DateFormat("h:mm a").format(tempDate));
      }
    } else {
      int intervalMinute = int.parse(minutes[intervalMinuteIndex.value]);

      for (int i = 0;
          i < ((24 - sleepingHours) * 60 / intervalMinute).floor();
          i++) {
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
          ? hours[intervalHoursIndex.value]
          : minutes[intervalMinuteIndex.value];

      var herokuApp = HerokuApp(
        id: id.isNotEmpty ? id : const Uuid().v1().toString(),
        name: appName,
        link: appLink,
        startTime:
            '${hours[hourIndex.value]}:${minutes[minuteIndex.value]} ${meridiem[meridiemIndex.value]}',
        interval:
            '$interval/${intervalHourOrMinute[intervalHourOrMinuteIndex.value]}',
        wakingUpTimes: coffeeServingTimes.toList(),
        status: true,
        hourIndex: hourIndex.value,
        minuteIndex: minuteIndex.value,
        meridiemIndex: meridiemIndex.value,
        intervalHourOrMinuteIndex: intervalHourOrMinuteIndex.value,
        intervalHoursIndex: intervalHoursIndex.value,
        intervalMinuteIndex: intervalMinuteIndex.value,
      );

      saveApp(herokuApp);
      resetControllerValue();
      Get.back();
    } else {
      showMessage('Please enter both name and link');
    }
  }

  void deleteHerokuApp(HerokuApp app) {
    deleteApp(app);
    resetControllerValue();
  }

  void deleteAllHerokuApp() {
    deleteAllApp();
    resetControllerValue();
  }

  void deleteAllHerokuEvents() {
    deleteAllEvent();
    resetControllerValue();
  }
}
