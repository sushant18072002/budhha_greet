// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_config.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrackingConfigAdapter extends TypeAdapter<TrackingConfig> {
  @override
  final int typeId = 48;

  @override
  TrackingConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TrackingConfig(
      enabled: fields[0] as bool,
      metrics: (fields[1] as List).cast<String>(),
      events: (fields[2] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, TrackingConfig obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.enabled)
      ..writeByte(1)
      ..write(obj.metrics)
      ..writeByte(2)
      ..write(obj.events);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrackingConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackingConfig _$TrackingConfigFromJson(Map<String, dynamic> json) =>
    TrackingConfig(
      enabled: json['enabled'] as bool,
      metrics:
          (json['metrics'] as List<dynamic>).map((e) => e as String).toList(),
      events:
          (json['events'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$TrackingConfigToJson(TrackingConfig instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'metrics': instance.metrics,
      'events': instance.events,
    };
