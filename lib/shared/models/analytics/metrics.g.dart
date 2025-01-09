// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metrics.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MetricsAdapter extends TypeAdapter<Metrics> {
  @override
  final int typeId = 16;

  @override
  Metrics read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Metrics(
      views: fields[0] as int,
      shares: fields[1] as int,
      favorites: fields[2] as int,
      lastInteraction: fields[3] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Metrics obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.views)
      ..writeByte(1)
      ..write(obj.shares)
      ..writeByte(2)
      ..write(obj.favorites)
      ..writeByte(3)
      ..write(obj.lastInteraction);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MetricsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Metrics _$MetricsFromJson(Map<String, dynamic> json) => Metrics(
      views: (json['views'] as num).toInt(),
      shares: (json['shares'] as num).toInt(),
      favorites: (json['favorites'] as num).toInt(),
      lastInteraction: json['last_interaction'] == null
          ? null
          : DateTime.parse(json['last_interaction'] as String),
    );

Map<String, dynamic> _$MetricsToJson(Metrics instance) => <String, dynamic>{
      'views': instance.views,
      'shares': instance.shares,
      'favorites': instance.favorites,
      'last_interaction': instance.lastInteraction?.toIso8601String(),
    };
