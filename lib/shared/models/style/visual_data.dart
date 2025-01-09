import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../entities/background.dart';

part 'visual_data.g.dart';

@HiveType(typeId: 18)
@JsonSerializable()
class VisualData {
  @HiveField(0)
   @JsonKey(name: 'image')
  final ImageData? image;
  
  @HiveField(1)
   @JsonKey(name: 'gradient')
  final GradientData? gradient;
  
  @HiveField(2)
   @JsonKey(name: 'color')
  final ColorData? color;

  VisualData({
    this.image,
    this.gradient,
    this.color,
  });

  factory VisualData.fromJson(Map<String, dynamic> json) => 
    _$VisualDataFromJson(json);
  
  Map<String, dynamic> toJson() => _$VisualDataToJson(this);
}
