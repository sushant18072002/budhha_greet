import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'layout_spacing.g.dart';

@HiveType(typeId: 99)
@JsonSerializable()
class LayoutSpacing {
  @HiveField(0)
  @JsonKey(name: 'between_elements')
  final double betweenElements;
  
  @HiveField(1)
  @JsonKey(name: 'horizontal_margin')
  final double horizontalMargin;
  
  @HiveField(2)
  @JsonKey(name: 'vertical_margin')
  final double verticalMargin;

  LayoutSpacing({
    required this.betweenElements,
    required this.horizontalMargin,
    required this.verticalMargin,
  });

  factory LayoutSpacing.fromJson(Map<String, dynamic> json) => _$LayoutSpacingFromJson(json);
  Map<String, dynamic> toJson() => _$LayoutSpacingToJson(this);
}