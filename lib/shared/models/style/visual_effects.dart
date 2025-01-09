import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'visual_effects.g.dart';

@HiveType(typeId: 25)
@JsonSerializable()
class VisualEffects {
  @HiveField(0)
   @JsonKey(name: 'opacity')
  final double opacity;
  
  @HiveField(1)
   @JsonKey(name: 'blur')
  final double blur;
  
  @HiveField(2)
   @JsonKey(name: 'blend_mode')
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
