import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'retry_config.g.dart';

@HiveType(typeId: 53)
@JsonSerializable()
class RetryConfig {
  @HiveField(0)
  @JsonKey(name: 'max_attempts')
  final int maxAttempts;
  
  @HiveField(1)
  @JsonKey(name: 'backoff_ms')
  final int backoffMs;

  RetryConfig({
    required this.maxAttempts,
    required this.backoffMs,
  });

  factory RetryConfig.fromJson(Map<String, dynamic> json) => 
    _$RetryConfigFromJson(json);
  
  Map<String, dynamic> toJson() => _$RetryConfigToJson(this);
}
