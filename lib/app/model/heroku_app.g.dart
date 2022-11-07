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
      icon: fields[2] as String,
      link: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HerokuApp obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.icon)
      ..writeByte(3)
      ..write(obj.link);
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
