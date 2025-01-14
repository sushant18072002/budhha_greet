import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'layout_border_radius.g.dart';

@HiveType(typeId: 83)
@JsonSerializable()
class LayoutBorderRadius {
  @HiveField(0)
  @JsonKey(name: 'base')
  final double base;
  
  @HiveField(1)
  @JsonKey(name: 'min')
  final double min;
  
  @HiveField(2)
  @JsonKey(name: 'max')
  final double max;
  
  @HiveField(3)
  @JsonKey(name: 'scale_factor')
  final double scaleFactor;

  LayoutBorderRadius({
    required this.base,
    required this.min,
    required this.max,
    required this.scaleFactor,
  });

  factory LayoutBorderRadius.fromJson(Map<String, dynamic> json) => _$LayoutBorderRadiusFromJson(json);
  Map<String, dynamic> toJson() => _$LayoutBorderRadiusToJson(this);
}