import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'opacity_config/opacity_config.dart';

part 'background.g.dart';

@HiveType(typeId: 84)
@JsonSerializable()
class Background {
  @HiveField(0)
  @JsonKey(name: 'opacity')
  final OpacityConfig opacity;
  
  @HiveField(1)
  @JsonKey(name: 'color')
  final String color;

  Background({
    required this.opacity,
    required this.color,
  });

  factory Background.fromJson(Map<String, dynamic> json) => _$BackgroundFromJson(json);
  Map<String, dynamic> toJson() => _$BackgroundToJson(this);
}
