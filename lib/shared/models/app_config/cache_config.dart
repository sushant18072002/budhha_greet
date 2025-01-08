import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cache_config.g.dart';

@HiveType(typeId: 28)
@JsonSerializable()
class CacheConfig {
  @HiveField(0)
  final int ttlSeconds;
  
  @HiveField(1)
  final String priority;
  
  @HiveField(2)
  final bool preload;

  CacheConfig({
    required this.ttlSeconds,
    required this.priority,
    required this.preload,
  });

  factory CacheConfig.fromJson(Map<String, dynamic> json) => 
    _$CacheConfigFromJson(json);
  
  Map<String, dynamic> toJson() => _$CacheConfigToJson(this);
}
