// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_config.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ApiConfigAdapter extends TypeAdapter<ApiConfig> {
  @override
  final int typeId = 52;

  @override
  ApiConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ApiConfig(
      baseUrl: fields[0] as String,
      timeoutMs: fields[1] as int,
      retry: fields[2] as RetryConfig,
      rateLimit: fields[3] as RateLimitConfig,
    );
  }

  @override
  void write(BinaryWriter writer, ApiConfig obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.baseUrl)
      ..writeByte(1)
      ..write(obj.timeoutMs)
      ..writeByte(2)
      ..write(obj.retry)
      ..writeByte(3)
      ..write(obj.rateLimit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApiConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiConfig _$ApiConfigFromJson(Map<String, dynamic> json) => ApiConfig(
      baseUrl: json['baseUrl'] as String,
      timeoutMs: (json['timeoutMs'] as num).toInt(),
      retry: RetryConfig.fromJson(json['retry'] as Map<String, dynamic>),
      rateLimit:
          RateLimitConfig.fromJson(json['rateLimit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiConfigToJson(ApiConfig instance) => <String, dynamic>{
      'baseUrl': instance.baseUrl,
      'timeoutMs': instance.timeoutMs,
      'retry': instance.retry,
      'rateLimit': instance.rateLimit,
    };
