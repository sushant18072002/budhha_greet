// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_limit_config.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RateLimitConfigAdapter extends TypeAdapter<RateLimitConfig> {
  @override
  final int typeId = 54;

  @override
  RateLimitConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RateLimitConfig(
      requestsPerMinute: fields[0] as int,
      burstSize: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, RateLimitConfig obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.requestsPerMinute)
      ..writeByte(1)
      ..write(obj.burstSize);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RateLimitConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RateLimitConfig _$RateLimitConfigFromJson(Map<String, dynamic> json) =>
    RateLimitConfig(
      requestsPerMinute: (json['requests_per_minute'] as num).toInt(),
      burstSize: (json['burst_size'] as num).toInt(),
    );

Map<String, dynamic> _$RateLimitConfigToJson(RateLimitConfig instance) =>
    <String, dynamic>{
      'requests_per_minute': instance.requestsPerMinute,
      'burst_size': instance.burstSize,
    };
