// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reporting_config.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReportingConfigAdapter extends TypeAdapter<ReportingConfig> {
  @override
  final int typeId = 49;

  @override
  ReportingConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReportingConfig(
      dailyStats: fields[0] as bool,
      weeklyStats: fields[1] as bool,
      monthlyStats: fields[2] as bool,
      popularItems: fields[3] as PopularItems,
    );
  }

  @override
  void write(BinaryWriter writer, ReportingConfig obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.dailyStats)
      ..writeByte(1)
      ..write(obj.weeklyStats)
      ..writeByte(2)
      ..write(obj.monthlyStats)
      ..writeByte(3)
      ..write(obj.popularItems);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReportingConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportingConfig _$ReportingConfigFromJson(Map<String, dynamic> json) =>
    ReportingConfig(
      dailyStats: json['daily_stats'] as bool,
      weeklyStats: json['weekly_stats'] as bool,
      monthlyStats: json['monthly_stats'] as bool,
      popularItems:
          PopularItems.fromJson(json['popular_items'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReportingConfigToJson(ReportingConfig instance) =>
    <String, dynamic>{
      'daily_stats': instance.dailyStats,
      'weekly_stats': instance.weeklyStats,
      'monthly_stats': instance.monthlyStats,
      'popular_items': instance.popularItems,
    };
