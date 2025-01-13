import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'template_translation.g.dart';

@HiveType(typeId: 30)
@JsonSerializable()
class TemplateTranslation {
  @HiveField(0)
  @JsonKey(name: 'title')
  final String title;
  
  @HiveField(1)
  @JsonKey(name: 'description')
  final String description;
  
  @HiveField(2)
  @JsonKey(name: 'greeting')
  final String greeting;
  
  @HiveField(3)
  @JsonKey(name: 'semantic_label')
  final String semanticLabel;

  TemplateTranslation({
    required this.title,
    required this.description,
    required this.greeting,
    required this.semanticLabel,
  });

  factory TemplateTranslation.fromJson(Map<String, dynamic> json) => _$TemplateTranslationFromJson(json);
  Map<String, dynamic> toJson() => _$TemplateTranslationToJson(this);
}
