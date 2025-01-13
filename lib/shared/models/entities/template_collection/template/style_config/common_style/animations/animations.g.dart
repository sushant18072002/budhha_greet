// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animations.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnimationsAdapter extends TypeAdapter<Animations> {
  @override
  final int typeId = 91;

  @override
  Animations read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Animations(
      transitionDuration: fields[0] as int,
      hover: fields[1] as HoverAnimation,
    );
  }

  @override
  void write(BinaryWriter writer, Animations obj) {
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
      other is AnimationsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Animations _$AnimationsFromJson(Map<String, dynamic> json) => Animations(
      transitionDuration: (json['transition_duration'] as num).toInt(),
      hover: HoverAnimation.fromJson(json['hover'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimationsToJson(Animations instance) =>
    <String, dynamic>{
      'transition_duration': instance.transitionDuration,
      'hover': instance.hover,
    };
