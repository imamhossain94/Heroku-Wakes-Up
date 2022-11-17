import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heroku_wake_up/app/model/heroku_app.dart';
import 'package:heroku_wake_up/app/utils/constants.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:uuid/uuid.dart';

import 'app/controller/binding.dart';
import 'app/model/events.dart';
import 'app/services/get_storage_service.dart';
import 'app/services/hive_helper.dart';
import 'app/services/theme_service.dart';
import 'app/utils/themes.dart';
import 'app/view/dashboard_view.dart';
import 'app/view/welcome_view.dart';

@pragma('vm:entry-point')
void repeatTask() async {
  final DateTime now = DateTime.now();
  final int isolateId = Isolate.current.hashCode;

  await initHive();

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
    if (flag) {
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
          status: 'failure',
          summary: '$e',
        ));
      }
    }
  }

  print("[$now] Hello, world! isolate=${isolateId} function='$repeatTask'");
}

Future<void> initHive() async {
  final appDocDir = await getApplicationDocumentsDirectory();

  if (!Hive.isAdapterRegistered(0) && !Hive.isAdapterRegistered(1)) {
    Hive
      ..init(appDocDir.path)
      ..registerAdapter(HerokuAppAdapter())
      ..registerAdapter(EventsAdapter());
  }

  await HiveHelper().init();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
  await initHive();

  await GetStorage.init();
  setAppVersion();

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: appName,
        theme: Themes.light,
        darkTheme: Themes.dark,
        themeMode: ThemeService().theme,
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.fadeIn,
        initialBinding: Binding(),
        home: isFirstLaunch() ? const WelcomeView() : const DashboardView(),
      );
    });
  }
}
