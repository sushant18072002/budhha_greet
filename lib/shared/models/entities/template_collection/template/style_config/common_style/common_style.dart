import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'common_animations/common_animations.dart';
import 'common_gradient_overlay/common_gradient_overlay.dart';

export 'common_animations/common_animations.dart';
export 'common_gradient_overlay/common_gradient_overlay.dart';

part 'common_style.g.dart';

@HiveType(typeId: 88)
@JsonSerializable()
class CommonStyle {
  @HiveField(0)
  @JsonKey(name: 'gradient_overlay')
  final CommonGradientOverlay gradientOverlay;
  
  @HiveField(1)
  @JsonKey(name: 'animations')
  final CommonAnimations animations;

  CommonStyle({
    required this.gradientOverlay,
    required this.animations,
  });

  factory CommonStyle.fromJson(Map<String, dynamic> json) => _$CommonStyleFromJson(json);
  Map<String, dynamic> toJson() => _$CommonStyleToJson(this);
}