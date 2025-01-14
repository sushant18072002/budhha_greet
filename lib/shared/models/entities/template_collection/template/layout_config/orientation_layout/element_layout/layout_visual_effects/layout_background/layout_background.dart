import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'layout_opacity_config/layout_opacity_config.dart';

export 'layout_opacity_config/layout_opacity_config.dart';

part 'layout_background.g.dart';

@HiveType(typeId: 84)
@JsonSerializable()
class LayoutBackground {
  @HiveField(0)
  @JsonKey(name: 'opacity')
  final LayoutOpacityConfig opacity;
  
  @HiveField(1)
  @JsonKey(name: 'color')
  final String color;

  LayoutBackground({
    required this.opacity,
    required this.color,
  });

  factory LayoutBackground.fromJson(Map<String, dynamic> json) => _$LayoutBackgroundFromJson(json);
  Map<String, dynamic> toJson() => _$LayoutBackgroundToJson(this);
}
