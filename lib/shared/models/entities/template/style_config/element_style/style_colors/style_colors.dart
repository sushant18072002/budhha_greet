import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part '../colors/style_colors.g.dart'; 

@HiveType(typeId: 95)
@JsonSerializable()
class StyleColors {
  @HiveField(0)
  @JsonKey(name: 'text')
  final String text;
  
  @HiveField(1)
  @JsonKey(name: 'shadow')
  final Shadow shadow;

  StyleColors({
    required this.text,
    required this.shadow,
  });

  factory StyleColors.fromJson(Map<String, dynamic> json) => _$StyleColorsFromJson(json);
  Map<String, dynamic> toJson() => _$StyleColorsToJson(this);
}