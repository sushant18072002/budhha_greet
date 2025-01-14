// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_blur.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActionBlurAdapter extends TypeAdapter<ActionBlur> {
  @override
  final int typeId = 111;

  @override
  ActionBlur read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ActionBlur(
      enabled: fields[0] as bool,
      sigma: fields[1] as ActionSigma,
    );
  }

  @override
  void write(BinaryWriter writer, ActionBlur obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.enabled)
      ..writeByte(1)
      ..write(obj.sigma);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActionBlurAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionBlur _$ActionBlurFromJson(Map<String, dynamic> json) => ActionBlur(
      enabled: json['enabled'] as bool,
      sigma: ActionSigma.fromJson(json['sigma'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ActionBlurToJson(ActionBlur instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'sigma': instance.sigma,
    };
