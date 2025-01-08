import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'text_validation.g.dart';

@HiveType(typeId: 43)
@JsonSerializable()
class TextValidation {
  @HiveField(0)
  final int maxLength;
  
  @HiveField(1)
  final int minLength;
  
  @HiveField(2)
  final String allowedCharacters;

  TextValidation({
    required this.maxLength,
    required this.minLength,
    required this.allowedCharacters,
  });

  factory TextValidation.fromJson(Map<String, dynamic> json) => 
    _$TextValidationFromJson(json);
  
  Map<String, dynamic> toJson() => _$TextValidationToJson(this);
}
