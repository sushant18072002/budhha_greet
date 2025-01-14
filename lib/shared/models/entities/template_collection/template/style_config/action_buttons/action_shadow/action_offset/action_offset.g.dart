// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_offset.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActionOffsetAdapter extends TypeAdapter<ActionOffset> {
  @override
  final int typeId = 114;

  @override
  ActionOffset read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ActionOffset(
      x: fields[0] as double,
      y: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, ActionOffset obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.x)
      ..writeByte(1)
      ..write(obj.y);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActionOffsetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionOffset _$ActionOffsetFromJson(Map<String, dynamic> json) => ActionOffset(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
    );

Map<String, dynamic> _$ActionOffsetToJson(ActionOffset instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
    };
