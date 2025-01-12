import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gradient_stop.g.dart';

@HiveType(typeId: 90)
@JsonSerializable()
class GradientStop {
  @HiveField(0)
  @JsonKey(name: 'color')
  final String color;
  
  @HiveField(1)
  @JsonKey(name: 'position')
  final double position;

  GradientStop({
    required this.color,
    required this.position,
  });

  factory GradientStop.fromJson(Map<String, dynamic> json) => _$GradientStopFromJson(json);
  Map<String, dynamic> toJson() => _$GradientStopToJson(this);
}