import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data_cache_config.dart';
import 'image_cache_config.dart';

part 'system_cache_config.g.dart';

@HiveType(typeId: 28)
@JsonSerializable()
class SystemCacheConfig{
  @HiveField(0)
  final ImageCacheConfig image;
  
  @HiveField(1)
  final DataCacheConfig data;

  SystemCacheConfig({
    required this.image,
    required this.data,
  });

  factory SystemCacheConfig.fromJson(Map<String, dynamic> json) => 
    _$SystemCacheConfigFromJson(json);
  
  Map<String, dynamic> toJson() => _$SystemCacheConfigToJson(this);
}
