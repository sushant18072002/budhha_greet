import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'shadow_offset/shadow_offset.dart';

export 'shadow_offset/shadow_offset.dart';

part 'element_shadow.g.dart'; 

@HiveType(typeId: 96)
@JsonSerializable()
class ElementShadow {
  @HiveField(0)
  @JsonKey(name: 'color')
  final String color;
  
  @HiveField(1)
  @JsonKey(name: 'offset')
  final ShadowOffset offset;
  
  @HiveField(2)
  @JsonKey(name: 'blur_radius')
  final double blurRadius;
  
  @HiveField(3)
  @JsonKey(name: 'opacity')
  final double opacity;

  ElementShadow({
    required this.color,
    required this.offset,
    required this.blurRadius,
    required this.opacity,
  });

  factory ElementShadow.fromJson(Map<String, dynamic> json) => _$ElementShadowFromJson(json);
  Map<String, dynamic> toJson() => _$ElementShadowToJson(this);
}