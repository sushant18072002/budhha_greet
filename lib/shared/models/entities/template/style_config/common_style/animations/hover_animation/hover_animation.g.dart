// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hover_animation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HoverAnimationAdapter extends TypeAdapter<HoverAnimation> {
  @override
  final int typeId = 92;

  @override
  HoverAnimation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HoverAnimation(
      scale: fields[0] as double,
      duration: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HoverAnimation obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.scale)
      ..writeByte(1)
      ..write(obj.duration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HoverAnimationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HoverAnimation _$HoverAnimationFromJson(Map<String, dynamic> json) =>
    HoverAnimation(
      scale: (json['scale'] as num).toDouble(),
      duration: (json['duration'] as num).toInt(),
    );

Map<String, dynamic> _$HoverAnimationToJson(HoverAnimation instance) =>
    <String, dynamic>{
      'scale': instance.scale,
      'duration': instance.duration,
    };
