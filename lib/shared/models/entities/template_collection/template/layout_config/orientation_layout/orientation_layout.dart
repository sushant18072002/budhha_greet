import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'element_layout/element_layout.dart';
import 'layout_adjustments/layout_adjustments.dart';
import 'responsive_behavior/responsive_behavior.dart';

export 'element_layout/element_layout.dart';
export 'layout_adjustments/layout_adjustments.dart';
export 'responsive_behavior/responsive_behavior.dart';

part 'orientation_layout.g.dart';

@HiveType(typeId: 33)
@JsonSerializable()
class OrientationLayout {
  @HiveField(0)
  @JsonKey(name: 'title')
  final ElementLayout? title;
  
  @HiveField(1)
  @JsonKey(name: 'quote')
  final ElementLayout? quote;
  
  @HiveField(2)
  @JsonKey(name: 'layout_adjustments')
  final LayoutAdjustments? layoutAdjustments;
  
  @HiveField(3)
  @JsonKey(name: 'responsive_behavior')
  final ResponsiveBehavior? responsiveBehavior;

  OrientationLayout({
    required this.title,
    required this.quote,
    required this.layoutAdjustments,
    required this.responsiveBehavior,
  });

  factory OrientationLayout.fromJson(Map<String, dynamic> json) => _$OrientationLayoutFromJson(json);
  Map<String, dynamic> toJson() => _$OrientationLayoutToJson(this);
}