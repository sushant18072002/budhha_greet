import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'text_validation.dart';
import 'typography_validation.dart';

part 'template_validation.g.dart';

@HiveType(typeId: 45)
@JsonSerializable()
class TemplateValidation {
  @HiveField(0)
   @JsonKey(name: '')
  final TextValidation greeting;
  
  @HiveField(1)
   @JsonKey(name: '')
  final TypographyValidation typography;

  TemplateValidation({
    required this.greeting,
    required this.typography,
  });

  factory TemplateValidation.fromJson(Map<String, dynamic> json) => 
    _$TemplateValidationFromJson(json);
  
  Map<String, dynamic> toJson() => _$TemplateValidationToJson(this);
}
