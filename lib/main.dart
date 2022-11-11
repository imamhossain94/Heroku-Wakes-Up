import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heroku_wake_up/app/utils/constants.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';

import 'app/services/theme_service.dart';
import 'app/utils/themes.dart';
import 'app/view/welcome_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocDir = await getApplicationDocumentsDirectory();
  // Hive
  //   ..init(appDocDir.path)
  //   ..registerAdapter(MedicineAdapter())
  //   ..registerAdapter(ReminderAdapter());
  //
  // await HiveHelper().init();
  // await DatabaseService().init();
  await GetStorage.init();
  // setAppVersion();

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
        home: const WelcomeView(),
      );
    });
  }
}