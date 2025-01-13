
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../../../../layout/position.dart';


part 'shadow.g.dart'; 

@HiveType(typeId: 96)
@JsonSerializable()
class Shadow {
  @HiveField(0)
  @JsonKey(name: 'color')
  final String color;
  
  @HiveField(1)
  @JsonKey(name: 'offset')
  final Position offset;
  
  @HiveField(2)
  @JsonKey(name: 'blur_radius')
  final double blurRadius;
  
  @HiveField(3)
  @JsonKey(name: 'opacity')
  final double opacity;

  Shadow({
    required this.color,
    required this.offset,
    required this.blurRadius,
    required this.opacity,
  });

  factory Shadow.fromJson(Map<String, dynamic> json) => _$ShadowFromJson(json);
  Map<String, dynamic> toJson() => _$ShadowToJson(this);
}