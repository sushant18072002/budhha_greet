import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hover_animation.g.dart';

@HiveType(typeId: 92)
@JsonSerializable()
class HoverAnimation {
  @HiveField(0)
  @JsonKey(name: 'scale')
  final double scale;
  
  @HiveField(1)
  @JsonKey(name: 'duration')
  final int duration;

  HoverAnimation({
    required this.scale,
    required this.duration,
  });

  factory HoverAnimation.fromJson(Map<String, dynamic> json) => _$HoverAnimationFromJson(json);

  Map<String, dynamic> toJson() => _$HoverAnimationToJson(this);
}