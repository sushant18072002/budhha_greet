// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_visual_effects.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BackgroundVisualEffectsAdapter
    extends TypeAdapter<BackgroundVisualEffects> {
  @override
  final int typeId = 25;

  @override
  BackgroundVisualEffects read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BackgroundVisualEffects(
      opacity: fields[0] as double,
      blur: fields[1] as double,
      blendMode: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BackgroundVisualEffects obj) {
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
      other is BackgroundVisualEffectsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BackgroundVisualEffects _$BackgroundVisualEffectsFromJson(
        Map<String, dynamic> json) =>
    BackgroundVisualEffects(
      opacity: (json['opacity'] as num).toDouble(),
      blur: (json['blur'] as num).toDouble(),
      blendMode: json['blend_mode'] as String,
    );

Map<String, dynamic> _$BackgroundVisualEffectsToJson(
        BackgroundVisualEffects instance) =>
    <String, dynamic>{
      'opacity': instance.opacity,
      'blur': instance.blur,
      'blend_mode': instance.blendMode,
    };
