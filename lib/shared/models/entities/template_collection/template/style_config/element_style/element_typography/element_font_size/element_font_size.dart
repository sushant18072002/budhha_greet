import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'element_font_size.g.dart'; 

@HiveType(typeId: 94)
@JsonSerializable()
class ElementFontSize {
  @HiveField(0)
  @JsonKey(name: 'base')
  final double base;
  
  @HiveField(1)
  @JsonKey(name: 'min')
  final double min;
  
  @HiveField(2)
  @JsonKey(name: 'max')
  final double max;
  
  @HiveField(3)
  @JsonKey(name: 'scale')
  final double scale;

  ElementFontSize({
    required this.base,
    required this.min,
    required this.max,
    required this.scale,
  });

  factory ElementFontSize.fromJson(Map<String, dynamic> json) => _$ElementFontSizeFromJson(json);
  Map<String, dynamic> toJson() => _$ElementFontSizeToJson(this);
}
