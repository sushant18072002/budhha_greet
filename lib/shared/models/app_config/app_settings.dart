import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'connectivity_config.dart';
import 'theme_config.dart';

part 'app_settings.g.dart';

@HiveType(typeId: 4)
@JsonSerializable()
class AppSettings {
  @HiveField(0)
  final ThemeConfig theme;
  
  @HiveField(1)
  final ConnectivityConfig connectivity;

  AppSettings({
    required this.theme,
    required this.connectivity,
  });

  factory AppSettings.fromJson(Map<String, dynamic> json) => 
    _$AppSettingsFromJson(json);
  
  Map<String, dynamic> toJson() => _$AppSettingsToJson(this);
}