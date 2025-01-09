import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'orientation_layout.dart';


part 'layout_config.g.dart';

@HiveType(typeId: 32)
@JsonSerializable()
class LayoutConfig {
  @HiveField(0)
  @JsonKey(name: 'responsive')
  final bool responsive;
  
  @HiveField(1)
  @JsonKey(name: 'portrait')
  final OrientationLayout portrait;
  
  @HiveField(2)
  @JsonKey(name: 'landscape')
  final OrientationLayout landscape;

  LayoutConfig({
    required this.responsive,
    required this.portrait,
    required this.landscape,
  });

  factory LayoutConfig.fromJson(Map<String, dynamic> json) => 
    _$LayoutConfigFromJson(json);
  
  Map<String, dynamic> toJson() => _$LayoutConfigToJson(this);
}
