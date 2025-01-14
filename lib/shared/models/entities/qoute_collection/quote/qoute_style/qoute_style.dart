import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'qoute_style_color/qoute_style_color.dart';
import 'qoute_typography/qoute_typography.dart';

export 'qoute_style_color/qoute_style_color.dart';
export 'qoute_typography/qoute_typography.dart';

part 'qoute_style.g.dart';

@HiveType(typeId: 11)
@JsonSerializable()
class QouteStyle {
  @HiveField(0)
  @JsonKey(name: 'typography')
  final QouteTypography typography;
  
  @HiveField(1)
  @JsonKey(name: 'colors')
  final QouteStyleColors colors;

  QouteStyle({
    required this.typography,
    required this.colors,
  });

  factory QouteStyle.fromJson(Map<String, dynamic> json) => 
    _$QouteStyleFromJson(json);
  
  Map<String, dynamic> toJson() => _$QouteStyleToJson(this);
}
