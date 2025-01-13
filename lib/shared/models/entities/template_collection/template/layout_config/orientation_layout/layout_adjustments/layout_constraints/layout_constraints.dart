import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'max_width/max_width.dart';
import 'min_height/min_height.dart';

part 'layout_constraints.g.dart';

@HiveType(typeId: 101)
@JsonSerializable()
class LayoutConstraints {
  @HiveField(0)
  @JsonKey(name: 'max_width')
  final MaxWidth maxWidth;
  
  @HiveField(1)
  @JsonKey(name: 'min_height')
  final MinHeight minHeight;

  LayoutConstraints({
    required this.maxWidth,
    required this.minHeight,
  });

  factory LayoutConstraints.fromJson(Map<String, dynamic> json) => _$LayoutConstraintsFromJson(json);
  Map<String, dynamic> toJson() => _$LayoutConstraintsToJson(this);
}