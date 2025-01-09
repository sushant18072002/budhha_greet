// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_config.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SystemConfigAdapter extends TypeAdapter<SystemConfig> {
  @override
  final int typeId = 2;

  @override
  SystemConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SystemConfig(
      languages: fields[0] as LanguageConfig,
      appSettings: fields[1] as AppSettings,
      systemCacheConfig: fields[2] as SystemCacheConfig,
      apiConfig: fields[3] as ApiConfig,
    );
  }

  @override
  void write(BinaryWriter writer, SystemConfig obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.languages)
      ..writeByte(1)
      ..write(obj.appSettings)
      ..writeByte(2)
      ..write(obj.systemCacheConfig)
      ..writeByte(3)
      ..write(obj.apiConfig);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SystemConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemConfig _$SystemConfigFromJson(Map<String, dynamic> json) => SystemConfig(
      languages:
          LanguageConfig.fromJson(json['languages'] as Map<String, dynamic>),
      appSettings:
          AppSettings.fromJson(json['app_settings'] as Map<String, dynamic>),
      systemCacheConfig: SystemCacheConfig.fromJson(
          json['system_cache_config'] as Map<String, dynamic>),
      apiConfig: ApiConfig.fromJson(json['api_config'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SystemConfigToJson(SystemConfig instance) =>
    <String, dynamic>{
      'languages': instance.languages,
      'app_settings': instance.appSettings,
      'system_cache_config': instance.systemCacheConfig,
      'api_config': instance.apiConfig,
    };
