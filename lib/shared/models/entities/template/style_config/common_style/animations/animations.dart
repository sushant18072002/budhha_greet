import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'hover_animation/hover_animation.dart';

part 'animations.g.dart';

@HiveType(typeId: 91)
@JsonSerializable()
class Animations {
  @HiveField(0)
  @JsonKey(name: 'transition_duration')
  final int transitionDuration;
  
  @HiveField(1)
  @JsonKey(name: 'hover')
  final HoverAnimation hover;

  Animations({
    required this.transitionDuration,
    required this.hover,
  });

  factory Animations.fromJson(Map<String, dynamic> json) => _$AnimationsFromJson(json);
  Map<String, dynamic> toJson() => _$AnimationsToJson(this);
}

