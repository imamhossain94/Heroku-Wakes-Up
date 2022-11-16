import 'package:background_fetch/background_fetch.dart';
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
import 'package:uuid/uuid.dart';

import 'app/controller/binding.dart';
import 'app/model/events.dart';
import 'app/services/get_storage_service.dart';
import 'app/services/hive_helper.dart';
import 'app/services/theme_service.dart';
import 'app/utils/themes.dart';
import 'app/view/dashboard_view.dart';
import 'app/view/welcome_view.dart';

/// This "Headless Task" is run when app is terminated.
@pragma('vm:entry-point')
void backgroundFetchHeadlessTask(HeadlessTask task) async {
  var taskId = task.taskId;
  var timeout = task.timeout;

  // Initializing Hive for Background fetch
  final appDocDir = await getApplicationDocumentsDirectory();
  Hive
    ..init(appDocDir.path)
    ..registerAdapter(HerokuAppAdapter())
    ..registerAdapter(EventsAdapter());
  await HiveHelper().init();

  // Check if the task is timeout
  if (timeout) {
    print("[BackgroundFetch] Headless task timed-out: $taskId");
    saveEvent(Events(
      id: const Uuid().v1().toString(),
      appId: '',
      appName: 'BackgroundFetch',
      timestamp: DateTime.now().toString(),
      status: 'timeout',
      summary: 'Headless task timed-out: $taskId',
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
    }
    BackgroundFetch.finish(taskId);
    return;
  }

  print("[BackgroundFetch] Headless event received: $taskId");

  saveEvent(Events(
    id: const Uuid().v1().toString(),
    appId: '',
    appName: 'BackgroundFetch',
    timestamp: DateTime.now().toString(),
    status: 'success',
    summary: 'Headless event received: $taskId',
  ));

  BackgroundFetch.finish(taskId);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocDir = await getApplicationDocumentsDirectory();
  Hive
    ..init(appDocDir.path)
    ..registerAdapter(HerokuAppAdapter())
    ..registerAdapter(EventsAdapter());
  await HiveHelper().init();

  await GetStorage.init();
  setAppVersion();

  runApp(const MyApp());

  BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
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
