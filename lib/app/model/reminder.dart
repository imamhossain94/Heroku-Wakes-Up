import 'package:hive/hive.dart';

import 'heroku_app.dart';

part 'reminder.g.dart';

@HiveType(typeId: 1)
class Reminder {
  @HiveField(0)
  final List<dynamic> notificationIDs;
  @HiveField(1)
  final HerokuApp herokuApp;
  @HiveField(2)
  final int interval;
  @HiveField(3)
  final String startTime;

  Reminder({
    required this.notificationIDs,
    required this.herokuApp,
    required this.startTime,
    required this.interval,
  });

  HerokuApp get getMedicine => herokuApp;

  int get getInterval => interval;

  String get getStartTime => startTime;

  List<dynamic> get getIDs => notificationIDs;

  Map<String, dynamic> toJson() {
    return {
      "ids": notificationIDs,
      "herokuApp": herokuApp,
      "interval": interval,
      "start": startTime,
    };
  }

  factory Reminder.fromJson(Map<String, dynamic> parsedJson) {
    return Reminder(
      notificationIDs: parsedJson['ids'],
      herokuApp: parsedJson['herokuApp'],
      interval: parsedJson['interval'],
      startTime: parsedJson['start'],
    );
  }
}
