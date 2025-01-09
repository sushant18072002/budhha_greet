// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppConfigAdapter extends TypeAdapter<AppConfig> {
  @override
  final int typeId = 0;

  @override
  AppConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppConfig(
      metadata: fields[0] as Metadata,
      systemConfig: fields[1] as SystemConfig,
      entities: fields[2] as Entities,
      validationRules: fields[3] as ValidationRules,
      analyticsConfig: fields[4] as AnalyticsConfig,
    )..isInitialized = fields[5] as bool;
  }

  @override
  void write(BinaryWriter writer, AppConfig obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.metadata)
      ..writeByte(1)
      ..write(obj.systemConfig)
      ..writeByte(2)
      ..write(obj.entities)
      ..writeByte(3)
      ..write(obj.validationRules)
      ..writeByte(4)
      ..write(obj.analyticsConfig)
      ..writeByte(5)
      ..write(obj.isInitialized);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) => AppConfig(
      metadata: Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      systemConfig:
          SystemConfig.fromJson(json['systemConfig'] as Map<String, dynamic>),
      entities: Entities.fromJson(json['entities'] as Map<String, dynamic>),
      validationRules: ValidationRules.fromJson(
          json['validationRules'] as Map<String, dynamic>),
      analyticsConfig: AnalyticsConfig.fromJson(
          json['analyticsConfig'] as Map<String, dynamic>),
    )..isInitialized = json['isInitialized'] as bool;

Map<String, dynamic> _$AppConfigToJson(AppConfig instance) => <String, dynamic>{
      'metadata': instance.metadata,
      'systemConfig': instance.systemConfig,
      'entities': instance.entities,
      'validationRules': instance.validationRules,
      'analyticsConfig': instance.analyticsConfig,
      'isInitialized': instance.isInitialized,
    };
