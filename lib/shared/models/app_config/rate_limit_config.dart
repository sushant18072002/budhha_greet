import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rate_limit_config.g.dart';

@HiveType(typeId: 54)
@JsonSerializable()
class RateLimitConfig {
  @HiveField(0)
  final int requestsPerMinute;
  
  @HiveField(1)
  final int burstSize;

  RateLimitConfig({
    required this.requestsPerMinute,
    required this.burstSize,
  });

  factory RateLimitConfig.fromJson(Map<String, dynamic> json) => 
    _$RateLimitConfigFromJson(json);
  
  Map<String, dynamic> toJson() => _$RateLimitConfigToJson(this);
}
