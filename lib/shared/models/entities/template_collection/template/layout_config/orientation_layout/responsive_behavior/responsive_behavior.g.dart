// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responsive_behavior.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResponsiveBehaviorAdapter extends TypeAdapter<ResponsiveBehavior> {
  @override
  final int typeId = 108;

  @override
  ResponsiveBehavior read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ResponsiveBehavior(
      breakpoints: fields[0] as Breakpoints,
    );
  }

  @override
  void write(BinaryWriter writer, ResponsiveBehavior obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.breakpoints);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResponsiveBehaviorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponsiveBehavior _$ResponsiveBehaviorFromJson(Map<String, dynamic> json) =>
    ResponsiveBehavior(
      breakpoints:
          Breakpoints.fromJson(json['breakpoints'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponsiveBehaviorToJson(ResponsiveBehavior instance) =>
    <String, dynamic>{
      'breakpoints': instance.breakpoints,
    };
