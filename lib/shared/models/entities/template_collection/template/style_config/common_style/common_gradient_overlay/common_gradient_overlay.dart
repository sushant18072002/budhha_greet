import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'common_gradient_stop/common_gradient_stop.dart';

export 'common_gradient_stop/common_gradient_stop.dart';

part 'common_gradient_overlay.g.dart';

@HiveType(typeId: 89)
@JsonSerializable()
class CommonGradientOverlay {
  @HiveField(0)
  @JsonKey(name: 'enabled')
  final bool enabled;
  
  @HiveField(1)
  @JsonKey(name: 'stops')
  final List<CommonGradientStop> stops;
  
  @HiveField(2)
  @JsonKey(name: 'angle')
  final int angle;

  CommonGradientOverlay({
    required this.enabled,
    required this.stops,
    required this.angle,
  });

  factory CommonGradientOverlay.fromJson(Map<String, dynamic> json) => _$CommonGradientOverlayFromJson(json);
  Map<String, dynamic> toJson() => _$CommonGradientOverlayToJson(this);
}