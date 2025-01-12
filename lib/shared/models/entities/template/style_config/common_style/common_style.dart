import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'animations/animations.dart';

part 'common_style.g.dart';

@HiveType(typeId: 88)
@JsonSerializable()
class CommonStyle {
  @HiveField(0)
  @JsonKey(name: 'gradient_overlay')
  final GradientOverlay gradientOverlay;
  
  @HiveField(1)
  @JsonKey(name: 'animations')
  final Animations animations;

  CommonStyle({
    required this.gradientOverlay,
    required this.animations,
  });

  factory CommonStyle.fromJson(Map<String, dynamic> json) => _$CommonStyleFromJson(json);
  Map<String, dynamic> toJson() => _$CommonStyleToJson(this);
}