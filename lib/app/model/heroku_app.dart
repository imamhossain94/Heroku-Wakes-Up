import 'package:hive/hive.dart';

part 'heroku_app.g.dart';

@HiveType(typeId: 0)
class HerokuApp {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String icon;
  @HiveField(3)
  String link;

  HerokuApp(
      {required this.id,
      required this.name,
      required this.icon,
      required this.link});

  HerokuApp.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? '',
        name = json['name'] ?? '',
        icon = json['icon'] ?? '',
        link = json['link'] ?? '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['icon'] = icon;
    data['link'] = link;
    return data;
  }
}
