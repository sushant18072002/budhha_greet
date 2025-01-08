// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_cache_config.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataCacheConfigAdapter extends TypeAdapter<DataCacheConfig> {
  @override
  final int typeId = 57;

  @override
  DataCacheConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataCacheConfig(
      ttlSeconds: fields[0] as int,
      strategy: fields[1] as String,
      persistence: fields[2] as bool,
      encryption: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, DataCacheConfig obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.ttlSeconds)
      ..writeByte(1)
      ..write(obj.strategy)
      ..writeByte(2)
      ..write(obj.persistence)
      ..writeByte(3)
      ..write(obj.encryption);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataCacheConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataCacheConfig _$DataCacheConfigFromJson(Map<String, dynamic> json) =>
    DataCacheConfig(
      ttlSeconds: (json['ttlSeconds'] as num).toInt(),
      strategy: json['strategy'] as String,
      persistence: json['persistence'] as bool,
      encryption: json['encryption'] as bool,
    );

Map<String, dynamic> _$DataCacheConfigToJson(DataCacheConfig instance) =>
    <String, dynamic>{
      'ttlSeconds': instance.ttlSeconds,
      'strategy': instance.strategy,
      'persistence': instance.persistence,
      'encryption': instance.encryption,
    };
