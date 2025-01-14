import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'template_composition.g.dart';

@HiveType(typeId: 31)
@JsonSerializable()
class TemplateComposition {
  @HiveField(0)
  @JsonKey(name: 'background_id')
  final String backgroundId;
  
  @HiveField(1)
  @JsonKey(name: 'quote_id')
  final String quoteId;
  
  @HiveField(2)
  @JsonKey(name: 'layout')
  final String layout;
  
  @HiveField(3)
  @JsonKey(name: 'aspect_ratio')
  final String aspectRatio;

  TemplateComposition({
    required this.backgroundId,
    required this.quoteId,
    required this.layout,
    required this.aspectRatio,
  });

  factory TemplateComposition.fromJson(Map<String, dynamic> json) => _$TemplateCompositionFromJson(json);
  Map<String, dynamic> toJson() => _$TemplateCompositionToJson(this);
}
