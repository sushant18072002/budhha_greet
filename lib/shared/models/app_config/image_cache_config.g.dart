// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_cache_config.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImageCacheConfigAdapter extends TypeAdapter<ImageCacheConfig> {
  @override
  final int typeId = 55;

  @override
  ImageCacheConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageCacheConfig(
      ttlSeconds: fields[0] as int,
      strategy: fields[1] as String,
      maxSizeMb: fields[2] as int,
      compression: fields[3] as CompressionConfig,
    );
  }

  @override
  void write(BinaryWriter writer, ImageCacheConfig obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.ttlSeconds)
      ..writeByte(1)
      ..write(obj.strategy)
      ..writeByte(2)
      ..write(obj.maxSizeMb)
      ..writeByte(3)
      ..write(obj.compression);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageCacheConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageCacheConfig _$ImageCacheConfigFromJson(Map<String, dynamic> json) =>
    ImageCacheConfig(
      ttlSeconds: (json['ttl_seconds'] as num).toInt(),
      strategy: json['strategy'] as String,
      maxSizeMb: (json['max_size_mb'] as num).toInt(),
      compression: CompressionConfig.fromJson(
          json['compression'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImageCacheConfigToJson(ImageCacheConfig instance) =>
    <String, dynamic>{
      'ttl_seconds': instance.ttlSeconds,
      'strategy': instance.strategy,
      'max_size_mb': instance.maxSizeMb,
      'compression': instance.compression,
    };
