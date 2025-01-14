// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_animations.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CommonAnimationsAdapter extends TypeAdapter<CommonAnimations> {
  @override
  final int typeId = 91;

  @override
  CommonAnimations read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CommonAnimations(
      transitionDuration: fields[0] as int,
      hover: fields[1] as CommonHoverAnimation,
    );
  }

  @override
  void write(BinaryWriter writer, CommonAnimations obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.transitionDuration)
      ..writeByte(1)
      ..write(obj.hover);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommonAnimationsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonAnimations _$CommonAnimationsFromJson(Map<String, dynamic> json) =>
    CommonAnimations(
      transitionDuration: (json['transition_duration'] as num).toInt(),
      hover:
          CommonHoverAnimation.fromJson(json['hover'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommonAnimationsToJson(CommonAnimations instance) =>
    <String, dynamic>{
      'transition_duration': instance.transitionDuration,
      'hover': instance.hover,
    };
