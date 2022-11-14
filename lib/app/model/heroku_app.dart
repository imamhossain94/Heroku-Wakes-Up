import 'package:hive/hive.dart';

part 'heroku_app.g.dart';

@HiveType(typeId: 0)
class HerokuApp {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String link;
  @HiveField(3)
  String startTime; // Ex: 10:56 AM
  @HiveField(4)
  String interval; // Ex: 30/m
  @HiveField(5)
  List<String> wakingUpTimes; // Ex: ['10:56 AM', '11:36 AM', '12:56 AM']
  @HiveField(6)
  bool status;
  @HiveField(7)
  int hourIndex;
  @HiveField(8)
  int minuteIndex;
  @HiveField(9)
  int meridiemIndex;
  @HiveField(10)
  int intervalHourOrMinuteIndex;
  @HiveField(11)
  int intervalHoursIndex;
  @HiveField(12)
  int intervalMinuteIndex;

  HerokuApp({
    required this.id,
    required this.name,
    required this.link,
    required this.startTime,
    required this.interval,
    required this.wakingUpTimes,
    required this.status,
    required this.hourIndex,
    required this.minuteIndex,
    required this.meridiemIndex,
    required this.intervalHourOrMinuteIndex,
    required this.intervalHoursIndex,
    required this.intervalMinuteIndex,
  });

  HerokuApp.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? '',
        name = json['name'] ?? '',
        link = json['link'] ?? '',
        startTime = json['startTime'] ?? '',
        interval = json['interval'] ?? '',
        wakingUpTimes = json['wakingUpTimes'] ?? [],
        status = json['status'] ?? false,
        hourIndex = json['hourIndex'] ?? 0,
        minuteIndex = json['minuteIndex'] ?? 0,
        meridiemIndex = json['meridiemIndex'] ?? 0,
        intervalHourOrMinuteIndex = json['intervalHourOrMinuteIndex'] ?? 0,
        intervalHoursIndex = json['intervalHoursIndex'] ?? 0,
        intervalMinuteIndex = json['intervalMinuteIndex'] ?? 0;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['link'] = link;
    data['startTime'] = startTime;
    data['interval'] = interval;
    data['wakingUpTimes'] = wakingUpTimes;
    data['status'] = status;
    data['hourIndex'] = hourIndex;
    data['minuteIndex'] = minuteIndex;
    data['meridiemIndex'] = meridiemIndex;
    data['intervalHourOrMinuteIndex'] = intervalHourOrMinuteIndex;
    data['intervalHoursIndex'] = intervalHoursIndex;
    data['intervalMinuteIndex'] = intervalMinuteIndex;
    return data;
  }
}
