// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_metrics.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TemplateMetricsAdapter extends TypeAdapter<TemplateMetrics> {
  @override
  final int typeId = 116;

  @override
  TemplateMetrics read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TemplateMetrics(
      views: fields[0] as int,
      shares: fields[1] as int,
      favorites: fields[2] as int,
      lastUsed: fields[3] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, TemplateMetrics obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.views)
      ..writeByte(1)
      ..write(obj.shares)
      ..writeByte(2)
      ..write(obj.favorites)
      ..writeByte(3)
      ..write(obj.lastUsed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TemplateMetricsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemplateMetrics _$TemplateMetricsFromJson(Map<String, dynamic> json) =>
    TemplateMetrics(
      views: (json['views'] as num).toInt(),
      shares: (json['shares'] as num).toInt(),
      favorites: (json['favorites'] as num).toInt(),
      lastUsed: json['last_used'] == null
          ? null
          : DateTime.parse(json['last_used'] as String),
    );

Map<String, dynamic> _$TemplateMetricsToJson(TemplateMetrics instance) =>
    <String, dynamic>{
      'views': instance.views,
      'shares': instance.shares,
      'favorites': instance.favorites,
      'last_used': instance.lastUsed?.toIso8601String(),
    };
