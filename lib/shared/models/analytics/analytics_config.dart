import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'reporting_config.dart';
import 'tracking_config.dart';

part 'analytics_config.g.dart';

@HiveType(typeId: 47)
@JsonSerializable()
class AnalyticsConfig {
  @HiveField(0)
   @JsonKey(name: 'tracking')
  final TrackingConfig tracking;
  
  @HiveField(1)
   @JsonKey(name: 'reporting')
  final ReportingConfig reporting;

  AnalyticsConfig({
    required this.tracking,
    required this.reporting,
  });

  factory AnalyticsConfig.fromJson(Map<String, dynamic> json) => 
    _$AnalyticsConfigFromJson(json);
  
  Map<String, dynamic> toJson() => _$AnalyticsConfigToJson(this);
}
