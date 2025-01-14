import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'element_shadow/element_shadow.dart';
export 'element_shadow/element_shadow.dart';

part 'element_style_colors.g.dart'; 

@HiveType(typeId: 95)
@JsonSerializable()
class ElementStyleColors {
  @HiveField(0)
  @JsonKey(name: 'text')
  final String text;
  
  @HiveField(1)
  @JsonKey(name: 'shadow')
  final ElementShadow shadow;

  ElementStyleColors({
    required this.text,
    required this.shadow,
  });

  factory ElementStyleColors.fromJson(Map<String, dynamic> json) => _$ElementStyleColorsFromJson(json);
  Map<String, dynamic> toJson() => _$ElementStyleColorsToJson(this);
}