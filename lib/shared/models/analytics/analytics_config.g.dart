// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_config.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnalyticsConfigAdapter extends TypeAdapter<AnalyticsConfig> {
  @override
  final int typeId = 47;

  @override
  AnalyticsConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnalyticsConfig(
      tracking: fields[0] as TrackingConfig,
      reporting: fields[1] as ReportingConfig,
    );
  }

  @override
  void write(BinaryWriter writer, AnalyticsConfig obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.tracking)
      ..writeByte(1)
      ..write(obj.reporting);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnalyticsConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnalyticsConfig _$AnalyticsConfigFromJson(Map<String, dynamic> json) =>
    AnalyticsConfig(
      tracking:
          TrackingConfig.fromJson(json['tracking'] as Map<String, dynamic>),
      reporting:
          ReportingConfig.fromJson(json['reporting'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnalyticsConfigToJson(AnalyticsConfig instance) =>
    <String, dynamic>{
      'tracking': instance.tracking,
      'reporting': instance.reporting,
    };
