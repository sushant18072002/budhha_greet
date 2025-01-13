import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'layout_breakpoints.g.dart';

@HiveType(typeId: 87)
@JsonSerializable()
class LayoutBreakpoints {
  @HiveField(0)
  @JsonKey(name: 'small')
  final int small;
  
  @HiveField(1)
  @JsonKey(name: 'medium')
  final int medium;
  
  @HiveField(2)
  @JsonKey(name: 'large')
  final int large;

  LayoutBreakpoints({
    required this.small,
    required this.medium,
    required this.large,
  });

  factory LayoutBreakpoints.fromJson(Map<String, dynamic> json) => _$LayoutBreakpointsFromJson(json);
  Map<String, dynamic> toJson() => _$LayoutBreakpointsToJson(this);
}