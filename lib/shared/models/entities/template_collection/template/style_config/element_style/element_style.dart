import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'element_style_colors/element_style_colors.dart';
import 'element_typography/element_typography.dart';

export 'element_style_colors/element_style_colors.dart';
export 'element_typography/element_typography.dart';

part 'element_style.g.dart'; 

@HiveType(typeId: 30)
@JsonSerializable()
class ElementStyle {
  @HiveField(0)
  @JsonKey(name: 'typography')
  final ElementTypography typography;

  @HiveField(1)
  @JsonKey(name: 'colors')
  final ElementStyleColors colors;

  ElementStyle({
    required this.typography,
    required this.colors,
  });

  factory ElementStyle.fromJson(Map<String, dynamic> json) => _$ElementStyleFromJson(json);

  Map<String, dynamic> toJson() => _$ElementStyleToJson(this);
}