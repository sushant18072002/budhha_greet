import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'theme_config.g.dart';

@HiveType(typeId: 5)
@JsonSerializable()
class ThemeConfig {
  @HiveField(0)
  final bool darkModeSupport;
  
  @HiveField(1)
  final bool dynamicColors;

  ThemeConfig({
    required this.darkModeSupport,
    required this.dynamicColors,
  });

  factory ThemeConfig.fromJson(Map<String, dynamic> json) => 
    _$ThemeConfigFromJson(json);
  
  Map<String, dynamic> toJson() => _$ThemeConfigToJson(this);
}