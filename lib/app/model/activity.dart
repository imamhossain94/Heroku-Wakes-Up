import 'package:hive/hive.dart';

part 'activity.g.dart';

@HiveType(typeId: 2)
class Activity {
  @HiveField(0)
  String id;
  @HiveField(1)
  int events;
  @HiveField(2)
  int success;
  @HiveField(3)
  int failure;

  Activity({
    required this.id,
    required this.events,
    required this.success,
    required this.failure
  });

}
