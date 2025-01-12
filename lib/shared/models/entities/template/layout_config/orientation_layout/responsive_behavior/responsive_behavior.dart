import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'responsive_breakpoint/responsive_breakpoint.dart';

part 'responsive_behavior.g.dart';


@HiveType(typeId: 108)
@JsonSerializable()
class ResponsiveBehavior {
  @HiveField(0)
  @JsonKey(name: 'breakpoints')
  final Map<String, ResponsiveBreakpoint> breakpoints;

  ResponsiveBehavior({
    required this.breakpoints,
  });

  factory ResponsiveBehavior.fromJson(Map<String, dynamic> json) => _$ResponsiveBehaviorFromJson(json);
  Map<String, dynamic> toJson() => _$ResponsiveBehaviorToJson(this);
}
