// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compression_config.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompressionConfigAdapter extends TypeAdapter<CompressionConfig> {
  @override
  final int typeId = 56;

  @override
  CompressionConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompressionConfig(
      enabled: fields[0] as bool,
      quality: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CompressionConfig obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.enabled)
      ..writeByte(1)
      ..write(obj.quality);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompressionConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompressionConfig _$CompressionConfigFromJson(Map<String, dynamic> json) =>
    CompressionConfig(
      enabled: json['enabled'] as bool,
      quality: (json['quality'] as num).toInt(),
    );

Map<String, dynamic> _$CompressionConfigToJson(CompressionConfig instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'quality': instance.quality,
    };
