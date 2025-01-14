import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'layout_alignment/layout_alignment.dart';
import 'layout_constraints/layout_constraints.dart';
import 'layout_spacing/layout_spacing.dart';

export 'layout_alignment/layout_alignment.dart';
export 'layout_constraints/layout_constraints.dart';
export 'layout_spacing/layout_spacing.dart';

part 'layout_adjustments.g.dart';

@HiveType(typeId: 98)
@JsonSerializable()
class LayoutAdjustments {
  @HiveField(0)
  @JsonKey(name: 'spacing')
  final LayoutSpacing spacing;
  
  @HiveField(1)
  @JsonKey(name: 'alignment')
  final LayoutAlignment alignment;
  
  @HiveField(2)
  @JsonKey(name: 'constraints')
  final LayoutConstraints constraints;

  LayoutAdjustments({
    required this.spacing,
    required this.alignment,
    required this.constraints,
  });

  factory LayoutAdjustments.fromJson(Map<String, dynamic> json) => _$LayoutAdjustmentsFromJson(json);
  Map<String, dynamic> toJson() => _$LayoutAdjustmentsToJson(this);
}