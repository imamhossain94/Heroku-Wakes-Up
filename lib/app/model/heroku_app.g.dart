// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'heroku_app.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HerokuAppAdapter extends TypeAdapter<HerokuApp> {
  @override
  final int typeId = 0;

  @override
  HerokuApp read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HerokuApp(
      id: fields[0] as String,
      name: fields[1] as String,
      link: fields[2] as String,
      startTime: fields[3] as String,
      interval: fields[4] as String,
      wakingUpTimes: (fields[5] as List).cast<String>(),
      status: fields[6] as bool,
      hourIndex: fields[7] as int,
      minuteIndex: fields[8] as int,
      meridiemIndex: fields[9] as int,
      intervalHourOrMinuteIndex: fields[10] as int,
      intervalHoursIndex: fields[11] as int,
      intervalMinuteIndex: fields[12] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HerokuApp obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.link)
      ..writeByte(3)
      ..write(obj.startTime)
      ..writeByte(4)
      ..write(obj.interval)
      ..writeByte(5)
      ..write(obj.wakingUpTimes)
      ..writeByte(6)
      ..write(obj.status)
      ..writeByte(7)
      ..write(obj.hourIndex)
      ..writeByte(8)
      ..write(obj.minuteIndex)
      ..writeByte(9)
      ..write(obj.meridiemIndex)
      ..writeByte(10)
      ..write(obj.intervalHourOrMinuteIndex)
      ..writeByte(11)
      ..write(obj.intervalHoursIndex)
      ..writeByte(12)
      ..write(obj.intervalMinuteIndex);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HerokuAppAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
