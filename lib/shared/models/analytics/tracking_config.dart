import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tracking_config.g.dart';

@HiveType(typeId: 48)
@JsonSerializable()
class TrackingConfig {
  @HiveField(0)
  final bool enabled;
  
  @HiveField(1)
  final List<String> metrics;
  
  @HiveField(2)
  final List<String> events;

  TrackingConfig({
    required this.enabled,
    required this.metrics,
    required this.events,
  });

  factory TrackingConfig.fromJson(Map<String, dynamic> json) => 
    _$TrackingConfigFromJson(json);
  
  Map<String, dynamic> toJson() => _$TrackingConfigToJson(this);
}


