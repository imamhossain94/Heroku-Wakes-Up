import 'dart:isolate';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heroku_wake_up/app/model/heroku_app.dart';
import 'package:heroku_wake_up/app/utils/constants.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';

import 'app/controller/binding.dart';
import 'app/model/events.dart';
import 'app/services/get_storage_service.dart';
import 'app/services/hive_helper.dart';
import 'app/services/theme_service.dart';
import 'app/utils/themes.dart';
import 'app/view/dashboard_view.dart';
import 'app/view/welcome_view.dart';

const String isolateName = 'wake_up';
ReceivePort port = ReceivePort();

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
  await initHive();
  await GetStorage.init();
  setAppVersion();

  // Register the UI isolateName
  IsolateNameServer.registerPortWithName(
    port.sendPort,
    isolateName,
  );

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
