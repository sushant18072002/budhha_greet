// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layout_visual_effects.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LayoutVisualEffectsAdapter extends TypeAdapter<LayoutVisualEffects> {
  @override
  final int typeId = 86;

  @override
  LayoutVisualEffects read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LayoutVisualEffects(
      blur: fields[0] as LayoutBlur?,
      borderRadius: fields[1] as LayoutBorderRadius,
      background: fields[2] as LayoutBackground,
    );
  }

  @override
  void write(BinaryWriter writer, LayoutVisualEffects obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.blur)
      ..writeByte(1)
      ..write(obj.borderRadius)
      ..writeByte(2)
      ..write(obj.background);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LayoutVisualEffectsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LayoutVisualEffects _$LayoutVisualEffectsFromJson(Map<String, dynamic> json) =>
    LayoutVisualEffects(
      blur: json['blur'] == null
          ? null
          : LayoutBlur.fromJson(json['blur'] as Map<String, dynamic>),
      borderRadius: LayoutBorderRadius.fromJson(
          json['border_radius'] as Map<String, dynamic>),
      background:
          LayoutBackground.fromJson(json['background'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LayoutVisualEffectsToJson(
        LayoutVisualEffects instance) =>
    <String, dynamic>{
      'blur': instance.blur,
      'border_radius': instance.borderRadius,
      'background': instance.background,
    };
