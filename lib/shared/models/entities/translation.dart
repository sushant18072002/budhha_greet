import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../style/font_size.dart';
import '../style/style_colors.dart';

part 'translation.g.dart';

@HiveType(typeId: 10)
@JsonSerializable()
class Translation {
  @HiveField(0)
  final String text;
  
  @HiveField(1)
  final String semanticLabel;

  Translation({
    required this.text,
    required this.semanticLabel,
  });

  factory Translation.fromJson(Map<String, dynamic> json) => 
    _$TranslationFromJson(json);
  
  Map<String, dynamic> toJson() => _$TranslationToJson(this);
}

@HiveType(typeId: 11)
@JsonSerializable()
class Style {
  @HiveField(0)
  final Typography typography;
  
  @HiveField(1)
  final StyleColors colors;

  Style({
    required this.typography,
    required this.colors,
  });

  factory Style.fromJson(Map<String, dynamic> json) => 
    _$StyleFromJson(json);
  
  Map<String, dynamic> toJson() => _$StyleToJson(this);
}

@HiveType(typeId: 12)
@JsonSerializable()
class Typography {
  @HiveField(0)
  final String fontFamily;
  
  @HiveField(1)
  final FontSize fontSize;
  
  @HiveField(2)
  final String fontWeight;
  
  @HiveField(3)
  final double letterSpacing;
  
  @HiveField(4)
  final double lineHeight;
  
  @HiveField(5)
  final String textAlign;

  Typography({
    required this.fontFamily,
    required this.fontSize,
    required this.fontWeight,
    required this.letterSpacing,
    required this.lineHeight,
    required this.textAlign,
  });

  factory Typography.fromJson(Map<String, dynamic> json) => 
    _$TypographyFromJson(json);
  
  Map<String, dynamic> toJson() => _$TypographyToJson(this);
}
