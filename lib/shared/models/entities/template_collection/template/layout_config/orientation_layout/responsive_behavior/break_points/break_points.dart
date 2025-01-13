import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'responsive_breakpoint/responsive_breakpoint.dart';

part 'break_points.g.dart';


@HiveType(typeId: 108)
@HiveType(typeId: 309)
@JsonSerializable()
class Breakpoints {
  @HiveField(0)
   @JsonKey(name: 'small')
  final ResponsiveBreakpoint small;

  @HiveField(1)
   @JsonKey(name: 'medium')
  final ResponsiveBreakpoint medium;

  @HiveField(2)
  @JsonKey(name: 'large')
  final ResponsiveBreakpoint large;

  Breakpoints({
    required this.small,
    required this.medium,
    required this.large,
  });

  factory Breakpoints.fromJson(Map<String, dynamic> json) =>
      _$BreakpointsFromJson(json);

  Map<String, dynamic> toJson() => _$BreakpointsToJson(this);
}
