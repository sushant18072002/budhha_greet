// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BackgroundAdapter extends TypeAdapter<Background> {
  @override
  final int typeId = 202;

  @override
  Background read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Background(
      opacity: fields[0] as double,
      color: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Background obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.opacity)
      ..writeByte(1)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BackgroundAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Background _$BackgroundFromJson(Map<String, dynamic> json) => Background(
      opacity: (json['opacity'] as num).toDouble(),
      color: json['color'] as String,
    );

Map<String, dynamic> _$BackgroundToJson(Background instance) =>
    <String, dynamic>{
      'opacity': instance.opacity,
      'color': instance.color,
    };
