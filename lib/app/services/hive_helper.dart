import 'package:heroku_wake_up/app/model/heroku_app.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import '../model/activity.dart';
import '../model/events.dart';

class HiveHelper {
  static late Box appBox;
  static late Box eventBox;
  static late Box activityBox;

  Future init() async {
    appBox = await Hive.openBox('appBox');
    eventBox = await Hive.openBox('eventBox');
    activityBox = await Hive.openBox('activityBox');
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
  await HiveHelper.appBox.deleteAll(HiveHelper.appBox.keys);
}

// Methods for eventBox
List<Events> getEventList() {
  List events = <Events>[];
  events = HiveHelper.eventBox.values.toList();
  events.sort((b, a) =>
      DateTime.parse(a.timestamp).compareTo(DateTime.parse(b.timestamp)));
  return List<Events>.from(events).toList();
}

Future<void> saveEvent(Events event) async {
  var len = HiveHelper.eventBox.values.length;
  if (len > 50) {
    var firstEvent = HiveHelper.eventBox.values.first;
    HiveHelper.eventBox.delete(firstEvent.id);
  }
  await HiveHelper.eventBox.put(event.id, event);
  await saveActivity(event);
}

void deleteEvent(Events event) async {
  await HiveHelper.eventBox.delete(event.id);
}

Future<void> deleteAllEvent() async {
  await HiveHelper.eventBox.deleteAll(HiveHelper.eventBox.keys);
}

// Activity
List<Activity> getActivities() {
  List activities = <Activity>[];
  activities = HiveHelper.activityBox.values.toList();
  activities.sort((b, a) => DateFormat('d/M/yyyy')
      .parse(a.id)
      .compareTo(DateFormat('d/M/yyyy').parse(b.id)));
  return List<Activity>.from(activities).toList();
}

Future<void> saveActivity(Events event) async {
  var now = DateTime.now();
  var key = DateFormat('d/M/yyyy').format(now).toString();
  Activity activity = await HiveHelper.activityBox.get(key) ??
      Activity(id: key, events: 0, success: 0, failure: 0);
  activity.events += 1;
  activity.success += event.status == 'success' ? 1 : 0;
  activity.failure += event.status == 'failure' ? 1 : 0;
  await HiveHelper.activityBox.put(key, activity);
}

void deleteActivities() async {
  await HiveHelper.activityBox.deleteAll(HiveHelper.activityBox.keys);
}

// Close all the openedBox
void closeHive() {
  HiveHelper.appBox.close();
  HiveHelper.eventBox.close();
  HiveHelper.activityBox.close();
}
