import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'background_visual_effects.g.dart';

@HiveType(typeId: 25)
@JsonSerializable()
class BackgroundVisualEffects {
  @HiveField(0)
   @JsonKey(name: 'opacity')
  final double opacity;
  
  @HiveField(1)
   @JsonKey(name: 'blur')
  final double blur;
  
  @HiveField(2)
   @JsonKey(name: 'blend_mode')
  final String blendMode;

  BackgroundVisualEffects({
    required this.opacity,
    required this.blur,
    required this.blendMode,
  });

  factory BackgroundVisualEffects.fromJson(Map<String, dynamic> json) => 
    _$BackgroundVisualEffectsFromJson(json);
  
  Map<String, dynamic> toJson() => _$BackgroundVisualEffectsToJson(this);
}
