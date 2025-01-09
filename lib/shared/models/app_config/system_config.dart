import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'api_config.dart';
import 'app_settings.dart';
import 'language_config.dart';
import 'system_cache_config.dart';

part 'system_config.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class SystemConfig {
  @HiveField(0)
  @JsonKey(name: 'languages')
  final LanguageConfig languages;
  
  @HiveField(1)
  @JsonKey(name: 'app_settings')
  final AppSettings appSettings;
  
  @HiveField(2)
  @JsonKey(name: 'system_cache_config')
  final SystemCacheConfig systemCacheConfig;
  
  @HiveField(3)
  @JsonKey(name: 'api_config')
  final ApiConfig apiConfig;

  SystemConfig({
    required this.languages,
    required this.appSettings,
    required this.systemCacheConfig,
    required this.apiConfig,
  });

  factory SystemConfig.fromJson(Map<String, dynamic> json) => 
    _$SystemConfigFromJson(json);
  
  Map<String, dynamic> toJson() => _$SystemConfigToJson(this);
}