import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'compression_config.dart';

part 'image_cache_config.g.dart';

@HiveType(typeId: 55)
@JsonSerializable()
class ImageCacheConfig {
  @HiveField(0)
  final int ttlSeconds;
  
  @HiveField(1)
  final String strategy;
  
  @HiveField(2)
  final int maxSizeMb;
  
  @HiveField(3)
  final CompressionConfig compression;

  ImageCacheConfig({
    required this.ttlSeconds,
    required this.strategy,
    required this.maxSizeMb,
    required this.compression,
  });

  factory ImageCacheConfig.fromJson(Map<String, dynamic> json) => 
    _$ImageCacheConfigFromJson(json);
  
  Map<String, dynamic> toJson() => _$ImageCacheConfigToJson(this);
}
