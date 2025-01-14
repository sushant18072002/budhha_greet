import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'common_gradient_stop.g.dart';

@HiveType(typeId: 90)
@JsonSerializable()
class CommonGradientStop {
  @HiveField(0)
  @JsonKey(name: 'color')
  final String color;
  
  @HiveField(1)
  @JsonKey(name: 'position')
  final double position;

  CommonGradientStop({
    required this.color,
    required this.position,
  });

  factory CommonGradientStop.fromJson(Map<String, dynamic> json) => _$CommonGradientStopFromJson(json);
  Map<String, dynamic> toJson() => _$CommonGradientStopToJson(this);
}