import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'position/position.dart';
import 'safe_area/safe_area.dart';
import 'size/size.dart';
import 'visual_effects/visual_effects.dart';

part 'element_layout.g.dart';

@HiveType(typeId: 34)
@JsonSerializable()
class ElementLayout {
  @HiveField(0)
  @JsonKey(name: 'position')
  final Position position;
  
  @HiveField(1)
  @JsonKey(name: 'size')
  final Size size;
  
  @HiveField(2)
  @JsonKey(name: 'padding')
  final double padding;
  
  @HiveField(3)
  @JsonKey(name: 'safe_area')
  final SafeArea? safeArea;
  
  @HiveField(4)
  @JsonKey(name: 'visual_effects')
  final VisualEffects visualEffects;

  ElementLayout({
    required this.position,
    required this.size,
    required this.padding,
    this.safeArea,
    required this.visualEffects,
  });

  factory ElementLayout.fromJson(Map<String, dynamic> json) => _$ElementLayoutFromJson(json);
  Map<String, dynamic> toJson() => _$ElementLayoutToJson(this);
}
