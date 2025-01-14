// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_hover_animation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CommonHoverAnimationAdapter extends TypeAdapter<CommonHoverAnimation> {
  @override
  final int typeId = 92;

  @override
  CommonHoverAnimation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CommonHoverAnimation(
      scale: fields[0] as double,
      duration: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CommonHoverAnimation obj) {
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
      other is CommonHoverAnimationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonHoverAnimation _$CommonHoverAnimationFromJson(
        Map<String, dynamic> json) =>
    CommonHoverAnimation(
      scale: (json['scale'] as num).toDouble(),
      duration: (json['duration'] as num).toInt(),
    );

Map<String, dynamic> _$CommonHoverAnimationToJson(
        CommonHoverAnimation instance) =>
    <String, dynamic>{
      'scale': instance.scale,
      'duration': instance.duration,
    };
