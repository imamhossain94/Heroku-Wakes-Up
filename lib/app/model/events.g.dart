// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventsAdapter extends TypeAdapter<Events> {
  @override
  final int typeId = 1;

  @override
  Events read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Events(
      id: fields[0] as String,
      appId: fields[1] as String,
      appName: fields[2] as String,
      timestamp: fields[3] as String,
      status: fields[4] as String,
      summary: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Events obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.appId)
      ..writeByte(2)
      ..write(obj.appName)
      ..writeByte(3)
      ..write(obj.timestamp)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.summary);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
