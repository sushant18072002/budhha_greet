// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layout_opacity_config.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LayoutOpacityConfigAdapter extends TypeAdapter<LayoutOpacityConfig> {
  @override
  final int typeId = 85;

  @override
  LayoutOpacityConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LayoutOpacityConfig(
      base: fields[0] as double,
      min: fields[1] as double,
      max: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, LayoutOpacityConfig obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.base)
      ..writeByte(1)
      ..write(obj.min)
      ..writeByte(2)
      ..write(obj.max);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LayoutOpacityConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LayoutOpacityConfig _$LayoutOpacityConfigFromJson(Map<String, dynamic> json) =>
    LayoutOpacityConfig(
      base: (json['base'] as num).toDouble(),
      min: (json['min'] as num).toDouble(),
      max: (json['max'] as num).toDouble(),
    );

Map<String, dynamic> _$LayoutOpacityConfigToJson(
        LayoutOpacityConfig instance) =>
    <String, dynamic>{
      'base': instance.base,
      'min': instance.min,
      'max': instance.max,
    };
