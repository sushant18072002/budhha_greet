import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'qoute_style_color.g.dart';

@HiveType(typeId: 14)
@JsonSerializable()
class QouteStyleColors {
  @HiveField(0)
  @JsonKey(name: 'text')
  final String text;
  
  @HiveField(1)
  @JsonKey(name: 'shadow')
  final String shadow;

  QouteStyleColors({
    required this.text,
    required this.shadow,
  });

  factory QouteStyleColors.fromJson(Map<String, dynamic> json) => 
    _$QouteStyleColorsFromJson(json);
  
  Map<String, dynamic> toJson() => _$QouteStyleColorsToJson(this);
}
