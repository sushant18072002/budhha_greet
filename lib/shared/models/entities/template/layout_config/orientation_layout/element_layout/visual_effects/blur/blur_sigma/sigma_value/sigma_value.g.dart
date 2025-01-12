// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sigma_value.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SigmaValueAdapter extends TypeAdapter<SigmaValue> {
  @override
  final int typeId = 82;

  @override
  SigmaValue read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SigmaValue(
      base: fields[0] as double,
      min: fields[1] as double,
      max: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, SigmaValue obj) {
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
      other is SigmaValueAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SigmaValue _$SigmaValueFromJson(Map<String, dynamic> json) => SigmaValue(
      base: (json['base'] as num).toDouble(),
      min: (json['min'] as num).toDouble(),
      max: (json['max'] as num).toDouble(),
    );

Map<String, dynamic> _$SigmaValueToJson(SigmaValue instance) =>
    <String, dynamic>{
      'base': instance.base,
      'min': instance.min,
      'max': instance.max,
    };
