// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_background.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActionBackgroundAdapter extends TypeAdapter<ActionBackground> {
  @override
  final int typeId = 110;

  @override
  ActionBackground read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ActionBackground(
      opacity: fields[0] as double,
      color: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ActionBackground obj) {
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
      other is ActionBackgroundAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionBackground _$ActionBackgroundFromJson(Map<String, dynamic> json) =>
    ActionBackground(
      opacity: (json['opacity'] as num).toDouble(),
      color: json['color'] as String,
    );

Map<String, dynamic> _$ActionBackgroundToJson(ActionBackground instance) =>
    <String, dynamic>{
      'opacity': instance.opacity,
      'color': instance.color,
    };
