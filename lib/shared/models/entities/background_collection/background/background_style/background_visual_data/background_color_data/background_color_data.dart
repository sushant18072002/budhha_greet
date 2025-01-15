import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'background_color_palette/background_color_palette.dart';

export 'background_color_palette/background_color_palette.dart';

part 'background_color_data.g.dart';

@HiveType(typeId: 23)
@JsonSerializable()
class BackgroundColorData {
  @HiveField(0)
   @JsonKey(name: 'color')
  final String color;
  
  @HiveField(1)
   @JsonKey(name: 'palette')
  final BackgroundColorPalette palette;

  BackgroundColorData({
    required this.color,
    required this.palette,
  });

  factory BackgroundColorData.fromJson(Map<String, dynamic> json) => 
    _$BackgroundColorDataFromJson(json);
  
  Map<String, dynamic> toJson() => _$BackgroundColorDataToJson(this);
}