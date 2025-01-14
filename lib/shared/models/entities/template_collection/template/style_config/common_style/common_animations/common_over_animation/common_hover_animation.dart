import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'common_hover_animation.g.dart';

@HiveType(typeId: 92)
@JsonSerializable()
class CommonHoverAnimation {
  @HiveField(0)
  @JsonKey(name: 'scale')
  final double scale;
  
  @HiveField(1)
  @JsonKey(name: 'duration')
  final int duration;

  CommonHoverAnimation({
    required this.scale,
    required this.duration,
  });

  factory CommonHoverAnimation.fromJson(Map<String, dynamic> json) => _$CommonHoverAnimationFromJson(json);

  Map<String, dynamic> toJson() => _$CommonHoverAnimationToJson(this);
}