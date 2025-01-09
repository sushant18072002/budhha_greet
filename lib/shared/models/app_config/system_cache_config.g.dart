// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_cache_config.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SystemCacheConfigAdapter extends TypeAdapter<SystemCacheConfig> {
  @override
  final int typeId = 78;

  @override
  SystemCacheConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SystemCacheConfig(
      image: fields[0] as ImageCacheConfig,
      data: fields[1] as DataCacheConfig,
    );
  }

  @override
  void write(BinaryWriter writer, SystemCacheConfig obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SystemCacheConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemCacheConfig _$SystemCacheConfigFromJson(Map<String, dynamic> json) =>
    SystemCacheConfig(
      image: ImageCacheConfig.fromJson(json['image'] as Map<String, dynamic>),
      data: DataCacheConfig.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SystemCacheConfigToJson(SystemCacheConfig instance) =>
    <String, dynamic>{
      'image': instance.image,
      'data': instance.data,
    };
