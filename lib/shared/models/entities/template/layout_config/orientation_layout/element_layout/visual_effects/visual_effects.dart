import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'background/background.dart';
import 'blur/blur.dart';
import 'border_radius/border_radius.dart';

part 'visual_effects.g.dart';

@HiveType(typeId: 86)
@JsonSerializable()
class VisualEffects {
  @HiveField(0)
  @JsonKey(name: 'blur')
  final Blur blur;
  
  @HiveField(1)
  @JsonKey(name: 'border_radius')
  final BorderRadius borderRadius;
  
  @HiveField(2)
  @JsonKey(name: 'background')
  final Background background;

  VisualEffects({
    required this.blur,
    required this.borderRadius,
    required this.background,
  });

  factory VisualEffects.fromJson(Map<String, dynamic> json) => _$VisualEffectsFromJson(json);
  Map<String, dynamic> toJson() => _$VisualEffectsToJson(this);
}
