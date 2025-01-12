import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'opacity_config.g.dart';

@HiveType(typeId: 85)
@JsonSerializable()
class OpacityConfig {
  @HiveField(0)
  @JsonKey(name: 'base')
  final double base;
  
  @HiveField(1)
  @JsonKey(name: 'min')
  final double min;
  
  @HiveField(2)
  @JsonKey(name: 'max')
  final double max;

  OpacityConfig({
    required this.base,
    required this.min,
    required this.max,
  });

  factory OpacityConfig.fromJson(Map<String, dynamic> json) => _$OpacityConfigFromJson(json);
  Map<String, dynamic> toJson() => _$OpacityConfigToJson(this);
}