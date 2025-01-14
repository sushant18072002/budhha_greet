import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'break_points/break_points.dart';
export 'break_points/break_points.dart';

part 'responsive_behavior.g.dart';


@HiveType(typeId: 108)
@JsonSerializable()
class ResponsiveBehavior {
  @HiveField(0)
  @JsonKey(name: 'breakpoints')
  final Breakpoints breakpoints;

  ResponsiveBehavior({required this.breakpoints});

  factory ResponsiveBehavior.fromJson(Map<String, dynamic> json) =>
      _$ResponsiveBehaviorFromJson(json);

  Map<String, dynamic> toJson() => _$ResponsiveBehaviorToJson(this);
}
