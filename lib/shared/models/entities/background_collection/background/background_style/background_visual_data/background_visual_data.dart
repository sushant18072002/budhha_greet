import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'background_color_data/background_color_data.dart';
import 'background_gradient_data/background_gradient_data.dart';
import 'background_image_data/background_image_data.dart';

export 'background_color_data/background_color_data.dart';
export 'background_gradient_data/background_gradient_data.dart';
export 'background_image_data/background_image_data.dart';

part 'background_visual_data.g.dart';

@HiveType(typeId: 18)
@JsonSerializable()
class BackgroundVisualData {
  @HiveField(0)
   @JsonKey(name: 'image')
  final BackgroundImageData? image;
  
  @HiveField(1)
   @JsonKey(name: 'gradient')
  final BackgroundGradientData? gradient;
  
  @HiveField(2)
   @JsonKey(name: 'color')
  final BackgroundColorData? color;

  BackgroundVisualData({
    this.image,
    this.gradient,
    this.color,
  });

  factory BackgroundVisualData.fromJson(Map<String, dynamic> json) => 
    _$BackgroundVisualDataFromJson(json);
  
  Map<String, dynamic> toJson() => _$BackgroundVisualDataToJson(this);
}
