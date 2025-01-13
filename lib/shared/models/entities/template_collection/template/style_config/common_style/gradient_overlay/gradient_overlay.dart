import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'gradient_stop/gradient_stop.dart';

part 'gradient_overlay.g.dart';

@HiveType(typeId: 89)
@JsonSerializable()
class GradientOverlay {
  @HiveField(0)
  @JsonKey(name: 'enabled')
  final bool enabled;
  
  @HiveField(1)
  @JsonKey(name: 'stops')
  final List<GradientStop> stops;
  
  @HiveField(2)
  @JsonKey(name: 'angle')
  final int angle;

  GradientOverlay({
    required this.enabled,
    required this.stops,
    required this.angle,
  });

  factory GradientOverlay.fromJson(Map<String, dynamic> json) => _$GradientOverlayFromJson(json);
  Map<String, dynamic> toJson() => _$GradientOverlayToJson(this);
}