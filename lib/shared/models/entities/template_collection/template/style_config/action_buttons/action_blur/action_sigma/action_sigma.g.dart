// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_sigma.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActionSigmaAdapter extends TypeAdapter<ActionSigma> {
  @override
  final int typeId = 112;

  @override
  ActionSigma read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ActionSigma(
      x: fields[0] as double,
      y: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, ActionSigma obj) {
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
      other is ActionSigmaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionSigma _$ActionSigmaFromJson(Map<String, dynamic> json) => ActionSigma(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
    );

Map<String, dynamic> _$ActionSigmaToJson(ActionSigma instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
    };
