import 'package:background_fetch/background_fetch.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../model/events.dart';
import '../model/heroku_app.dart';
import '../services/get_storage_service.dart';
import '../services/hive_helper.dart';
import '../utils/extensions.dart';

class HerokuWakeUpAppController extends GetxController {
  var isLoading = false.obs;
  var appList = <HerokuApp>[].obs;
  var eventList = <Events>[].obs;
  var id = '';

  var isLoadingEvent = false.obs;
  List<String> bottomTitles = [];
  List<List<double>> chartData = [];

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
    fetchEvents();
    possibleServingTime();
    generateActivityLogData();
    initPlatformState();
    startBackgroundFetch();
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

  void generateActivityLogData() {
    if(chartData.isEmpty) {
      isLoadingEvent(true);
    }
    bottomTitles = [];
    chartData = [];
    var now = DateTime.now();
    var startDate = now.subtract(const Duration(days: 6));
    var endDate = now.add(const Duration(days: 6));
    List<DateTime> dateList = getDaysInBetween(startDate, endDate);
    var eventsList = getRawEventList();




    for (var date in dateList) {
      int totalEvents = 0;
      int successEvents = 0;
      int errorEvents = 0;
      for (var event in eventsList) {

        print(event.appName + " " + event.summary + " " + event.timestamp);

        var eventDate = DateTime.parse(event.timestamp);
        if (date.month == eventDate.month && date.day == eventDate.day) {
          totalEvents++;
          if (event.status == "success") {
            successEvents++;
          } else {
            errorEvents++;
          }
        }
      }
      bottomTitles.add(DateFormat('E').format(date));

      double se=0.0, ee=0.0, te=0.0;
      if(totalEvents != 0 && successEvents != 0) {
        se = (totalEvents/successEvents);
      }
      if(totalEvents != 0 && errorEvents != 0) {
        ee = (totalEvents/errorEvents);
      }
      if(totalEvents != 0) {
        te = 1 - (se + ee);
      }
      print("-----------");
      print("$totalEvents $successEvents $errorEvents ${eventsList.length}");
      print("$se $ee $te");

      chartData.add([se, ee, te]);
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
    intervalMinuteIndex.value = 0;
    coffeeServingTimes.clear();
    possibleServingTime();
    fetchApps();
    update();
  }

  // Background fetch
  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // Configure BackgroundFetch.
    try {
      await BackgroundFetch.configure(
          BackgroundFetchConfig(
              minimumFetchInterval: 5, //15
              forceAlarmManager: true,
              // default was false
              stopOnTerminate: false,
              startOnBoot: true,
              enableHeadless: true,
              requiresBatteryNotLow: false,
              requiresCharging: false,
              requiresStorageNotLow: false,
              requiresDeviceIdle: false,
              requiredNetworkType: NetworkType.ANY),
          _onBackgroundFetch,
          _onBackgroundFetchTimeout);
    } on Exception catch (e) {
      print("[BackgroundFetch] ERROR: $e");
      saveEvent(Events(
        id: const Uuid().v1().toString(),
        appId: '',
        appName: 'BackgroundFetch',
        timestamp: DateTime.now().toString(),
        status: 'error',
        summary: '$e',
      ));
    }
  }

  void _onBackgroundFetch(String taskId) async {
    print(">>BackgroundFetch: $taskId");
    saveEvent(Events(
      id: const Uuid().v1().toString(),
      appId: '',
      appName: 'BackgroundFetch',
      timestamp: DateTime.now().toString(),
      status: 'success',
      summary: 'Event received $taskId',
    ));

    if (taskId == "wake_up_heroku") {
      var appList = getAppList();
      for (var app in appList) {
        bool flag = false;
        DateTime now = DateTime.now();
        for (var wake in app.wakingUpTimes) {
          DateTime wakeUpTime = DateFormat("dd.MM.yyyy h:mm a")
              .parse('${now.day}.${now.month}.${now.year} $wake');

          DateTime startDate = now.subtract(const Duration(minutes: 5));
          DateTime endDate = now.add(const Duration(minutes: 5));
          if (startDate.isBefore(wakeUpTime) && endDate.isAfter(wakeUpTime)) {
            flag = true;
            break;
          }
        }
        if (flag || true) {
          // Give heroku a cup of coffee 🥀
          try {
            var response = await Dio().get(app.link);
            print(response);
            saveEvent(Events(
              id: const Uuid().v1().toString(),
              appId: app.id,
              appName: app.name,
              timestamp: DateTime.now().toString(),
              status: 'success',
              summary: '$response',
            ));
          } catch (e) {
            print(e);
            saveEvent(Events(
              id: const Uuid().v1().toString(),
              appId: app.id,
              appName: app.name,
              timestamp: DateTime.now().toString(),
              status: 'error',
              summary: '$e',
            ));
          }
        }
      }
    }

    fetchEvents();
    BackgroundFetch.finish(taskId);
  }

  void _onBackgroundFetchTimeout(String taskId) {
    print("[BackgroundFetch] TIMEOUT: $taskId");
    // update events logs
    saveEvent(Events(
      id: const Uuid().v1().toString(),
      appId: '',
      appName: 'BackgroundFetch',
      timestamp: DateTime.now().toString(),
      status: 'timeout',
      summary: taskId,
    ));
    fetchEvents();
    BackgroundFetch.finish(taskId);
  }

  // Start the background fetch
  void startBackgroundFetch() {
    if (isBackgroundFetchRunning()) {
      // Never stop is
      // BackgroundFetch.stop().then((status) {
      //   print('[BackgroundFetch] stop success: $status');
      //   setBackgroundFetchRunningStatus(false);
      //   saveEvent(Events(
      //     id: const Uuid().v1().toString(),
      //     appId: '',
      //     appName: 'BackgroundFetch',
      //     timestamp: DateTime.now().toString(),
      //     status: 'success',
      //     summary: '[BackgroundFetch] terminated!',
      //   ));
      // });
      setBackgroundFetchRunningStatus(true);
      print('[BackgroundFetch] already running!');
      // saveEvent(Events(
      //   id: const Uuid().v1().toString(),
      //   appId: '',
      //   appName: 'HerokuWakeUp',
      //   timestamp: DateTime.now().toString(),
      //   status: 'success',
      //   summary: 'launched successfully',
      // ));
    } else {
      BackgroundFetch.scheduleTask(
              TaskConfig(
                  taskId: 'wake_up_heroku',
                  delay: 10000,
                  periodic: true,
                  forceAlarmManager: true,
                  stopOnTerminate: false,
                  startOnBoot: true,
                  enableHeadless: true,
                  requiredNetworkType: NetworkType.ANY,
                  requiresBatteryNotLow: false,
                  requiresStorageNotLow: false,
                  requiresCharging: false,
                  requiresDeviceIdle: false
              ))
          .then((status) {
        print('[BackgroundFetch] start success: $status');
        saveEvent(Events(
          id: const Uuid().v1().toString(),
          appId: '',
          appName: 'BackgroundFetch',
          timestamp: DateTime.now().toString(),
          status: 'success',
          summary: 'start success: $status',
        ));
        setBackgroundFetchRunningStatus(true);
        fetchEvents();
      }).catchError((e) {
        print('[BackgroundFetch] start FAILURE: $e');
        saveEvent(Events(
          id: const Uuid().v1().toString(),
          appId: '',
          appName: 'BackgroundFetch',
          timestamp: DateTime.now().toString(),
          status: 'failure',
          summary: 'start failure: $e',
        ));
        setBackgroundFetchRunningStatus(false);
        fetchEvents();
      });
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
