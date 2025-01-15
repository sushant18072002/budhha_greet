
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'background_gradient_stop.g.dart';


@HiveType(typeId: 22)
@JsonSerializable()
class BackgroundGradientStop {
  @HiveField(0)
   @JsonKey(name: 'position')
  final double position;
  
  @HiveField(1)
   @JsonKey(name: 'color')
  final String color;

  BackgroundGradientStop({
    required this.position,
    required this.color,
  });

  factory BackgroundGradientStop.fromJson(Map<String, dynamic> json) => 
    _$BackgroundGradientStopFromJson(json);
  
  Map<String, dynamic> toJson() => _$BackgroundGradientStopToJson(this);
}
