import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Layout_breakpoints/layout_breakpoints.dart';
import 'orientation_layout/orientation_layout.dart';

export 'Layout_breakpoints/layout_breakpoints.dart';
export 'orientation_layout/orientation_layout.dart';

part 'layout_config.g.dart';

@HiveType(typeId: 32)
@JsonSerializable()
class LayoutConfig {
  @HiveField(0)
  @JsonKey(name: 'responsive')
  final bool responsive;
  
  @HiveField(1)
  @JsonKey(name: 'breakpoints')
  final LayoutBreakpoints? breakpoints;
  
  @HiveField(2)
  @JsonKey(name: 'portrait')
  final OrientationLayout? portrait;
  
  @HiveField(3)
  @JsonKey(name: 'landscape')
  final OrientationLayout? landscape;

  LayoutConfig({
    required this.responsive,
    required this.breakpoints,
    required this.portrait,
    required this.landscape,
  });

  factory LayoutConfig.fromJson(Map<String, dynamic> json) => _$LayoutConfigFromJson(json);
  Map<String, dynamic> toJson() => _$LayoutConfigToJson(this);
}
