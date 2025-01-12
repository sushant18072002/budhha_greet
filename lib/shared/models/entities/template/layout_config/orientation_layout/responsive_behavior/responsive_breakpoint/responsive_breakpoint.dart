import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'responsive_breakpoint.g.dart';


@HiveType(typeId: 107)
@JsonSerializable()
class ResponsiveBreakpoint {
  @HiveField(0)
  @JsonKey(name: 'max_width')
  final double maxWidth;
  
  @HiveField(1)
  @JsonKey(name: 'title_scale')
  final double titleScale;
  
  @HiveField(2)
  @JsonKey(name: 'quote_scale')
  final double quoteScale;
  
  @HiveField(3)
  @JsonKey(name: 'spacing_scale')
  final double spacingScale;

  ResponsiveBreakpoint({
    required this.maxWidth,
    required this.titleScale,
    required this.quoteScale,
    required this.spacingScale,
  });

  factory ResponsiveBreakpoint.fromJson(Map<String, dynamic> json) => _$ResponsiveBreakpointFromJson(json);
  Map<String, dynamic> toJson() => _$ResponsiveBreakpointToJson(this);
}