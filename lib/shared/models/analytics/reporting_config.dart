import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'popular_item.dart';
part 'reporting_config.g.dart';

@HiveType(typeId: 49)
@JsonSerializable()
class ReportingConfig {
  @HiveField(0)
   @JsonKey(name: 'daily_stats')
  final bool dailyStats;
  
  @HiveField(1)
   @JsonKey(name: 'weekly_stats')
  final bool weeklyStats;
  
  @HiveField(2)
   @JsonKey(name: 'monthly_stats')
  final bool monthlyStats;
  
  @HiveField(3)
   @JsonKey(name: 'popular_items')
  final PopularItems popularItems;

  ReportingConfig({
    required this.dailyStats,
    required this.weeklyStats,
    required this.monthlyStats,
    required this.popularItems,
  });

  factory ReportingConfig.fromJson(Map<String, dynamic> json) => 
    _$ReportingConfigFromJson(json);
  
  Map<String, dynamic> toJson() => _$ReportingConfigToJson(this);
}
