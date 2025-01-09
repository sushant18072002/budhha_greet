import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'author_validation.g.dart';

@HiveType(typeId: 44)
@JsonSerializable()
class AuthorValidation {
  @HiveField(0)
   @JsonKey(name: '')
  final int maxLength;
  
  @HiveField(1)
   @JsonKey(name: '')
  final int minLength;

  AuthorValidation({
    required this.maxLength,
    required this.minLength,
  });

  factory AuthorValidation.fromJson(Map<String, dynamic> json) => 
    _$AuthorValidationFromJson(json);
  
  Map<String, dynamic> toJson() => _$AuthorValidationToJson(this);
}
