import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_cache_config.g.dart';

@HiveType(typeId: 57)
@JsonSerializable()
class DataCacheConfig {
  @HiveField(0)
  final int ttlSeconds;
  
  @HiveField(1)
  final String strategy;
  
  @HiveField(2)
  final bool persistence;
  
  @HiveField(3)
  final bool encryption;

  DataCacheConfig({
    required this.ttlSeconds,
    required this.strategy,
    required this.persistence,
    required this.encryption,
  });

  factory DataCacheConfig.fromJson(Map<String, dynamic> json) => 
    _$DataCacheConfigFromJson(json);
  
  Map<String, dynamic> toJson() => _$DataCacheConfigToJson(this);
}
