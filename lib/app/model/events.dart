import 'package:hive/hive.dart';

part 'events.g.dart';

@HiveType(typeId: 1)
class Events {
  @HiveField(0)
  String id;
  @HiveField(1)
  String appId;
  @HiveField(2)
  String appName;
  @HiveField(3)
  String timestamp;
  @HiveField(4)
  String status;
  @HiveField(5)
  String summary;

  Events({
    required this.id,
    required this.appId,
    required this.appName,
    required this.timestamp,
    required this.status,
    required this.summary
  });

}
