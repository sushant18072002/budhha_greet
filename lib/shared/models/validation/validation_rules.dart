import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'quote_validation.dart';
import 'template_validation.dart';

part 'validation_rules.g.dart';

@HiveType(typeId: 41)
@JsonSerializable()
class ValidationRules {
  @HiveField(0)
   @JsonKey(name: 'quotes')
  final QuoteValidation quotes;
  
  @HiveField(1)
   @JsonKey(name: 'templates')
  final TemplateValidation templates;

  ValidationRules({
    required this.quotes,
    required this.templates,
  });

  factory ValidationRules.fromJson(Map<String, dynamic> json) => 
    _$ValidationRulesFromJson(json);
  
  Map<String, dynamic> toJson() => _$ValidationRulesToJson(this);
}
