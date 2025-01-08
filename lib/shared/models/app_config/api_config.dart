import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'rate_limit_config.dart';
import 'retry_config.dart';

part 'api_config.g.dart';

@HiveType(typeId: 52)
@JsonSerializable()
class ApiConfig {
  @HiveField(0)
  final String baseUrl;
  
  @HiveField(1)
  final int timeoutMs;
  
  @HiveField(2)
  final RetryConfig retry;
  
  @HiveField(3)
  final RateLimitConfig rateLimit;

  ApiConfig({
    required this.baseUrl,
    required this.timeoutMs,
    required this.retry,
    required this.rateLimit,
  });

  factory ApiConfig.fromJson(Map<String, dynamic> json) => 
    _$ApiConfigFromJson(json);
  
  Map<String, dynamic> toJson() => _$ApiConfigToJson(this);
}
