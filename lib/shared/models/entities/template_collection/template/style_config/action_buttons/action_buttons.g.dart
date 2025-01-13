// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_buttons.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActionButtonsAdapter extends TypeAdapter<ActionButtons> {
  @override
  final int typeId = 97;

  @override
  ActionButtons read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ActionButtons(
      size: fields[0] as double,
      background: fields[1] as Background,
      blur: fields[2] as Blur,
      shadow: fields[3] as Shadow,
    );
  }

  @override
  void write(BinaryWriter writer, ActionButtons obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.size)
      ..writeByte(1)
      ..write(obj.background)
      ..writeByte(2)
      ..write(obj.blur)
      ..writeByte(3)
      ..write(obj.shadow);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActionButtonsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionButtons _$ActionButtonsFromJson(Map<String, dynamic> json) =>
    ActionButtons(
      size: (json['size'] as num).toDouble(),
      background:
          Background.fromJson(json['background'] as Map<String, dynamic>),
      blur: Blur.fromJson(json['blur'] as Map<String, dynamic>),
      shadow: Shadow.fromJson(json['shadow'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ActionButtonsToJson(ActionButtons instance) =>
    <String, dynamic>{
      'size': instance.size,
      'background': instance.background,
      'blur': instance.blur,
      'shadow': instance.shadow,
    };
