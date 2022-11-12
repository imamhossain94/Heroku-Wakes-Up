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
  String startTime; // Ex: 10/56/AM
  @HiveField(4)
  String interval;  // Ex: 30/m
  @HiveField(5)
  List<String> wakingUpTimes;   // Ex: ['10/56/AM', '11/36/AM', '12/56/AM']

  HerokuApp(
      {required this.id,
      required this.name,
      required this.link,
      required this.startTime,
      required this.interval,
      required this.wakingUpTimes});

  HerokuApp.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? '',
        name = json['name'] ?? '',
        link = json['link'] ?? '',
        startTime = json['startTime'] ?? '',
        interval = json['interval'] ?? '',
        wakingUpTimes = json['wakingUpTimes'] ?? [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['link'] = link;
    data['startTime'] = startTime;
    data['interval'] = interval;
    data['wakingUpTimes'] = wakingUpTimes;
    return data;
  }
}
