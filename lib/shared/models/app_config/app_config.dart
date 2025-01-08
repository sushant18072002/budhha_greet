import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../analytics/analytics_config.dart';
import '../entities/entities.dart';
import '../validation/validation_rules.dart';
import 'metadata.dart';
import 'system_config.dart';

part 'app_config.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class AppConfig {
  @HiveField(0)
  final Metadata metadata;
  
  @HiveField(1)
  final SystemConfig systemConfig;
  
  @HiveField(2)
  final Entities entities;
  
  @HiveField(3)
  final ValidationRules validationRules;
  
  @HiveField(4)
  final AnalyticsConfig analyticsConfig;

  AppConfig({
    required this.metadata,
    required this.systemConfig,
    required this.entities,
    required this.validationRules,
    required this.analyticsConfig,
  });

  factory AppConfig.fromJson(Map<String, dynamic> json) => 
    _$AppConfigFromJson(json);
  
  Map<String, dynamic> toJson() => _$AppConfigToJson(this);
}