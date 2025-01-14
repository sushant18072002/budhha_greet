import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'common_over_animation/common_hover_animation.dart';

export 'common_over_animation/common_hover_animation.dart';

part 'common_animations.g.dart';

@HiveType(typeId: 91)
@JsonSerializable()
class CommonAnimations {
  @HiveField(0)
  @JsonKey(name: 'transition_duration')
  final int transitionDuration;
  
  @HiveField(1)
  @JsonKey(name: 'hover')
  final CommonHoverAnimation hover;

  CommonAnimations({
    required this.transitionDuration,
    required this.hover,
  });

  factory CommonAnimations.fromJson(Map<String, dynamic> json) => _$CommonAnimationsFromJson(json);
  Map<String, dynamic> toJson() => _$CommonAnimationsToJson(this);
}

