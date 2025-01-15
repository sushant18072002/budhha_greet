
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'background_gradient_stop/background_gradient_stop.dart';

export 'background_gradient_stop/background_gradient_stop.dart';

part 'background_gradient_data.g.dart';

@HiveType(typeId: 21)
@JsonSerializable()
class BackgroundGradientData {
  @HiveField(0)
   @JsonKey(name: 'colors')
  final List<String> colors;
  
  @HiveField(1)
   @JsonKey(name: 'type')
  final String type;
  
  @HiveField(2)
   @JsonKey(name: 'angle')
  final double angle;
  
  @HiveField(3)
  @JsonKey(name: 'stops')
  final List<BackgroundGradientStop> stops;

  BackgroundGradientData({
    required this.colors,
    required this.type,
    required this.angle,
    required this.stops,
  });

  factory BackgroundGradientData.fromJson(Map<String, dynamic> json) => 
    _$BackgroundGradientDataFromJson(json);
  
  Map<String, dynamic> toJson() => _$BackgroundGradientDataToJson(this);
}
