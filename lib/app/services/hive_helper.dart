import 'package:heroku_wake_up/app/model/heroku_app.dart';
import 'package:hive/hive.dart';

class HiveHelper {
  static late Box appBox;

  Future init() async {
    appBox = await Hive.openBox('appBox');
  }
}

List<HerokuApp> getAppList() {
  List apps = <HerokuApp>[];
  apps = HiveHelper.appBox.values.toList();
  // apps = apps.reversed.toList();
  return List<HerokuApp>.from(apps).toList();
}

void saveApp(HerokuApp app) async {
  await HiveHelper.appBox.put(app.id, app);
}

void deleteApp(HerokuApp app) async {
  await HiveHelper.appBox.delete(app.id);
}

void deleteAllApp() async {
  await HiveHelper.appBox.clear();
}

void closeHive() {
  HiveHelper.appBox.close();
}
