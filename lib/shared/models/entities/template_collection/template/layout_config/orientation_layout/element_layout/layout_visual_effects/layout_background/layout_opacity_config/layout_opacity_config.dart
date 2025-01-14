import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'layout_opacity_config.g.dart';

@HiveType(typeId: 85)
@JsonSerializable()
class LayoutOpacityConfig {
  @HiveField(0)
  @JsonKey(name: 'base')
  final double base;
  
  @HiveField(1)
  @JsonKey(name: 'min')
  final double min;
  
  @HiveField(2)
  @JsonKey(name: 'max')
  final double max;

  LayoutOpacityConfig({
    required this.base,
    required this.min,
    required this.max,
  });

  factory LayoutOpacityConfig.fromJson(Map<String, dynamic> json) => _$LayoutOpacityConfigFromJson(json);
  Map<String, dynamic> toJson() => _$LayoutOpacityConfigToJson(this);
}