// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_config.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CacheConfigAdapter extends TypeAdapter<CacheConfig> {
  @override
  final int typeId = 28;

  @override
  CacheConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CacheConfig(
      ttlSeconds: fields[0] as int,
      priority: fields[1] as String,
      preload: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, CacheConfig obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.ttlSeconds)
      ..writeByte(1)
      ..write(obj.priority)
      ..writeByte(2)
      ..write(obj.preload);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CacheConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CacheConfig _$CacheConfigFromJson(Map<String, dynamic> json) => CacheConfig(
      ttlSeconds: (json['ttlSeconds'] as num).toInt(),
      priority: json['priority'] as String,
      preload: json['preload'] as bool,
    );

Map<String, dynamic> _$CacheConfigToJson(CacheConfig instance) =>
    <String, dynamic>{
      'ttlSeconds': instance.ttlSeconds,
      'priority': instance.priority,
      'preload': instance.preload,
    };
