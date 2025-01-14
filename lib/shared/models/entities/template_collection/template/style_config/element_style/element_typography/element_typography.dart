import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'element_font_size/element_font_size.dart';
export 'element_font_size/element_font_size.dart';

part 'element_typography.g.dart'; 

@HiveType(typeId: 93)
@JsonSerializable()
class ElementTypography {
  @HiveField(0)
  @JsonKey(name: 'font_family')
  final String fontFamily;
  
  @HiveField(1)
  @JsonKey(name: 'font_size')
  final ElementFontSize fontSize;
  
  @HiveField(2)
  @JsonKey(name: 'font_weight')
  final String fontWeight;
  
  @HiveField(3)
  @JsonKey(name: 'letter_spacing')
  final double letterSpacing;
  
  @HiveField(4)
  @JsonKey(name: 'line_height')
  final double lineHeight;
  
  @HiveField(5)
  @JsonKey(name: 'text_align')
  final String textAlign;
  
  @HiveField(6)
  @JsonKey(name: 'text_transform')
  final String textTransform;

  ElementTypography({
    required this.fontFamily,
    required this.fontSize,
    required this.fontWeight,
    required this.letterSpacing,
    required this.lineHeight,
    required this.textAlign,
    required this.textTransform,
  });

  factory ElementTypography.fromJson(Map<String, dynamic> json) => _$ElementTypographyFromJson(json);
  Map<String, dynamic> toJson() => _$ElementTypographyToJson(this);
}
