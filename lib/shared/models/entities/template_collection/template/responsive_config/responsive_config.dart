import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'grid_config/grid_config.dart';

part 'responsive_config.g.dart';

@HiveType(typeId: 104)
@JsonSerializable()
class ResponsiveConfig {
  @HiveField(0)
  @JsonKey(name: 'grid')
  final GridConfig gridConfig;

  ResponsiveConfig({
    required this.gridConfig
  });

  factory ResponsiveConfig.fromJson(Map<String, dynamic> json) => _$ResponsiveConfigFromJson(json);
  Map<String, dynamic> toJson() => _$ResponsiveConfigToJson(this);
}