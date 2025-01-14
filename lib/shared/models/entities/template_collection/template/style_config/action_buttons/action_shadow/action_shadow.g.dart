// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_shadow.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActionShadowAdapter extends TypeAdapter<ActionShadow> {
  @override
  final int typeId = 205;

  @override
  ActionShadow read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ActionShadow(
      color: fields[0] as String,
      offset: fields[1] as ActionOffset,
      blurRadius: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, ActionShadow obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.color)
      ..writeByte(1)
      ..write(obj.offset)
      ..writeByte(2)
      ..write(obj.blurRadius);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActionShadowAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionShadow _$ActionShadowFromJson(Map<String, dynamic> json) => ActionShadow(
      color: json['color'] as String,
      offset: ActionOffset.fromJson(json['offset'] as Map<String, dynamic>),
      blurRadius: (json['blurRadius'] as num).toDouble(),
    );

Map<String, dynamic> _$ActionShadowToJson(ActionShadow instance) =>
    <String, dynamic>{
      'color': instance.color,
      'offset': instance.offset,
      'blurRadius': instance.blurRadius,
    };
