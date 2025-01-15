import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'layout_background/layout_background.dart';
import 'layout_blur/layout_blur.dart';
import 'layout_border_radius/layout_border_radius.dart';

export 'layout_background/layout_background.dart';
export 'layout_blur/layout_blur.dart';
export 'layout_border_radius/layout_border_radius.dart';

part 'layout_visual_effects.g.dart';

@HiveType(typeId: 86)
@JsonSerializable()
class LayoutVisualEffects {
  @HiveField(0)
  @JsonKey(name: 'blur')
  final LayoutBlur? blur;
  
  @HiveField(1)
  @JsonKey(name: 'border_radius')
  final LayoutBorderRadius borderRadius;
  
  @HiveField(2)
  @JsonKey(name: 'background')
  final LayoutBackground background;

  LayoutVisualEffects({
    required this.blur,
    required this.borderRadius,
    required this.background,
  });

  factory LayoutVisualEffects.fromJson(Map<String, dynamic> json) => _$LayoutVisualEffectsFromJson(json);
  Map<String, dynamic> toJson() => _$LayoutVisualEffectsToJson(this);
}

