import 'package:heroku_wake_up/app/model/heroku_app.dart';
import 'package:hive/hive.dart';

import '../model/events.dart';

class HiveHelper {
  static late Box appBox;
  static late Box eventBox;

  Future init() async {
    appBox = await Hive.openBox('appBox');
    eventBox = await Hive.openBox('eventBox');
  }
}

// Methods for appBox
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

// Methods for eventBox
List<Events> getEventList() {
  List events = <Events>[];
  events = HiveHelper.eventBox.values.toList();
  return List<Events>.from(events).toList();
}

void saveEvent(Events event) async {
  await HiveHelper.eventBox.put(event.id, event);
}

void deleteEvent(Events event) async {
  await HiveHelper.eventBox.delete(event.id);
}

void deleteAllEvent() async {
  await HiveHelper.eventBox.clear();
}

// Close all the openedBox
void closeHive() {
  HiveHelper.appBox.close();
  HiveHelper.eventBox.close();
}
