// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visual_effects.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VisualEffectsAdapter extends TypeAdapter<VisualEffects> {
  @override
  final int typeId = 86;

  @override
  VisualEffects read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VisualEffects(
      blur: fields[0] as Blur,
      borderRadius: fields[1] as BorderRadius,
      background: fields[2] as Background,
    );
  }

  @override
  void write(BinaryWriter writer, VisualEffects obj) {
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
      other is VisualEffectsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisualEffects _$VisualEffectsFromJson(Map<String, dynamic> json) =>
    VisualEffects(
      blur: Blur.fromJson(json['blur'] as Map<String, dynamic>),
      borderRadius:
          BorderRadius.fromJson(json['border_radius'] as Map<String, dynamic>),
      background:
          Background.fromJson(json['background'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VisualEffectsToJson(VisualEffects instance) =>
    <String, dynamic>{
      'blur': instance.blur,
      'border_radius': instance.borderRadius,
      'background': instance.background,
    };
