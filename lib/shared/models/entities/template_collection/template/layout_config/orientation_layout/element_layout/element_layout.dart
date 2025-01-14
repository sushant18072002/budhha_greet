import 'package:buddha_greet/shared/models/entities/template_collection/template/template.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

export 'layout_position/layout_position.dart';
export 'layout_safe_area/layout_safe_area.dart';
export 'layout_size/layout_size.dart';
export 'layout_visual_effects/layout_visual_effects.dart';

part 'element_layout.g.dart';

@HiveType(typeId: 34)
@JsonSerializable()
class ElementLayout {
  @HiveField(0)
  @JsonKey(name: 'position')
  final LayoutPosition layoutPosition;
  
  @HiveField(1)
  @JsonKey(name: 'size')
  final LayoutSize size;
  
  @HiveField(2)
  @JsonKey(name: 'padding')
  final double padding;
  
  @HiveField(3)
  @JsonKey(name: 'safe_area')
  final LayoutSafeArea? safeArea;
  
  @HiveField(4)
  @JsonKey(name: 'visual_effects')
  final LayoutVisualEffects visualEffects;

  ElementLayout({
    required this.layoutPosition,
    required this.size,
    required this.padding,
    this.safeArea,
    required this.visualEffects,
  });

  factory ElementLayout.fromJson(Map<String, dynamic> json) => _$ElementLayoutFromJson(json);
  Map<String, dynamic> toJson() => _$ElementLayoutToJson(this);
}
