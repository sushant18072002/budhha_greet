// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retry_config.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RetryConfigAdapter extends TypeAdapter<RetryConfig> {
  @override
  final int typeId = 53;

  @override
  RetryConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RetryConfig(
      maxAttempts: fields[0] as int,
      backoffMs: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, RetryConfig obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.maxAttempts)
      ..writeByte(1)
      ..write(obj.backoffMs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RetryConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RetryConfig _$RetryConfigFromJson(Map<String, dynamic> json) => RetryConfig(
      maxAttempts: (json['maxAttempts'] as num).toInt(),
      backoffMs: (json['backoffMs'] as num).toInt(),
    );

Map<String, dynamic> _$RetryConfigToJson(RetryConfig instance) =>
    <String, dynamic>{
      'maxAttempts': instance.maxAttempts,
      'backoffMs': instance.backoffMs,
    };
