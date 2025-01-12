// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'border_radius.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BorderRadiusAdapter extends TypeAdapter<BorderRadius> {
  @override
  final int typeId = 83;

  @override
  BorderRadius read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BorderRadius(
      base: fields[0] as double,
      min: fields[1] as double,
      max: fields[2] as double,
      scaleFactor: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, BorderRadius obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.base)
      ..writeByte(1)
      ..write(obj.min)
      ..writeByte(2)
      ..write(obj.max)
      ..writeByte(3)
      ..write(obj.scaleFactor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BorderRadiusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BorderRadius _$BorderRadiusFromJson(Map<String, dynamic> json) => BorderRadius(
      base: (json['base'] as num).toDouble(),
      min: (json['min'] as num).toDouble(),
      max: (json['max'] as num).toDouble(),
      scaleFactor: (json['scale_factor'] as num).toDouble(),
    );

Map<String, dynamic> _$BorderRadiusToJson(BorderRadius instance) =>
    <String, dynamic>{
      'base': instance.base,
      'min': instance.min,
      'max': instance.max,
      'scale_factor': instance.scaleFactor,
    };
