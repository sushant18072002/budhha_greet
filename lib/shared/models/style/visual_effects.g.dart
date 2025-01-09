// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visual_effects.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VisualEffectsAdapter extends TypeAdapter<VisualEffects> {
  @override
  final int typeId = 25;

  @override
  VisualEffects read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VisualEffects(
      opacity: fields[0] as double,
      blur: fields[1] as double,
      blendMode: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, VisualEffects obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.opacity)
      ..writeByte(1)
      ..write(obj.blur)
      ..writeByte(2)
      ..write(obj.blendMode);
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
      opacity: (json['opacity'] as num).toDouble(),
      blur: (json['blur'] as num).toDouble(),
      blendMode: json['blend_mode'] as String,
    );

Map<String, dynamic> _$VisualEffectsToJson(VisualEffects instance) =>
    <String, dynamic>{
      'opacity': instance.opacity,
      'blur': instance.blur,
      'blend_mode': instance.blendMode,
    };
