import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'visual_effects.g.dart';

@HiveType(typeId: 25)
@JsonSerializable()
class VisualEffects {
  @HiveField(0)
  final double opacity;
  
  @HiveField(1)
  final double blur;
  
  @HiveField(2)
  final String blendMode;

  VisualEffects({
    required this.opacity,
    required this.blur,
    required this.blendMode,
  });

  factory VisualEffects.fromJson(Map<String, dynamic> json) => 
    _$VisualEffectsFromJson(json);
  
  Map<String, dynamic> toJson() => _$VisualEffectsToJson(this);
}
