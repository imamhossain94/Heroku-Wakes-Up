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
  var apps = getAppList();
  app.id = (apps.isNotEmpty ? int.parse(apps.last.id) + 1 : 0).toString();
  await HiveHelper.appBox.add(app);
}

void updateApp(HerokuApp app) async {
  await HiveHelper.appBox.putAt(int.parse(app.id), app);
}

void deleteApp(int index) async {
  await HiveHelper.appBox.deleteAt(index);
}

void closeHive() {
  HiveHelper.appBox.close();
}
