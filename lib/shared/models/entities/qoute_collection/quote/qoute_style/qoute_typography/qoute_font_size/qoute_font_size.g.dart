// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qoute_font_size.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QouteFontSizeAdapter extends TypeAdapter<QouteFontSize> {
  @override
  final int typeId = 13;

  @override
  QouteFontSize read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QouteFontSize(
      base: fields[0] as double,
      min: fields[1] as double,
      max: fields[2] as double,
      scale: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, QouteFontSize obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.base)
      ..writeByte(1)
      ..write(obj.min)
      ..writeByte(2)
      ..write(obj.max)
      ..writeByte(3)
      ..write(obj.scale);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QouteFontSizeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QouteFontSize _$QouteFontSizeFromJson(Map<String, dynamic> json) =>
    QouteFontSize(
      base: (json['base'] as num).toDouble(),
      min: (json['min'] as num).toDouble(),
      max: (json['max'] as num).toDouble(),
      scale: (json['scale'] as num).toDouble(),
    );

Map<String, dynamic> _$QouteFontSizeToJson(QouteFontSize instance) =>
    <String, dynamic>{
      'base': instance.base,
      'min': instance.min,
      'max': instance.max,
      'scale': instance.scale,
    };
