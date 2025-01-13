import 'package:buddha_greet/shared/models/entities/template_collection/template/style_config/element_style/style_colors/style_colors.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'typography/typography.dart';

part 'element_style.g.dart'; 

@HiveType(typeId: 30)
@JsonSerializable()
class ElementStyle {
  @HiveField(0)
  @JsonKey(name: 'typography')
  final Typography typography;

  @HiveField(1)
  @JsonKey(name: 'colors')
  final StyleColors colors;

  ElementStyle({
    required this.typography,
    required this.colors,
  });

  factory ElementStyle.fromJson(Map<String, dynamic> json) => _$ElementStyleFromJson(json);

  Map<String, dynamic> toJson() => _$ElementStyleToJson(this);
}