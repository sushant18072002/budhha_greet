import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'font_size.dart';

part 'typography.g.dart';

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
