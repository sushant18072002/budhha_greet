import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'text_validation.g.dart';

@HiveType(typeId: 43)
@JsonSerializable()
class TextValidation {
  @HiveField(0)
   @JsonKey(name: 'max_length')
  final int maxLength;
  
  @HiveField(1)
   @JsonKey(name: 'min_length')
  final int minLength;
  
  @HiveField(2)
  @JsonKey(name: 'allowed_characters')
  final String? allowedCharacters;

  TextValidation({
    required this.maxLength,
    required this.minLength,
    this.allowedCharacters,
  });

  factory TextValidation.fromJson(Map<String, dynamic> json) => 
    _$TextValidationFromJson(json);
  
  Map<String, dynamic> toJson() => _$TextValidationToJson(this);
}
