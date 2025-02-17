import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'language_config.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class LanguageConfig {
  @HiveField(0)
  @JsonKey(name: 'supported')
  final List<String> supported;
  
  @HiveField(1)
   @JsonKey(name: 'default')
  final String defaultLang;
  
  @HiveField(2)
   @JsonKey(name: 'fallback')
  final String fallback;

  LanguageConfig({
    required this.supported,
    required this.defaultLang,
    required this.fallback,
  });

  factory LanguageConfig.fromJson(Map<String, dynamic> json) => 
    _$LanguageConfigFromJson(json);
  
  Map<String, dynamic> toJson() => _$LanguageConfigToJson(this);
}