import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'author_validation.dart';
import 'text_validation.dart';

part 'quote_validation.g.dart';

@HiveType(typeId: 42)
@JsonSerializable()
class QuoteValidation {
  @HiveField(0)
   @JsonKey(name: 'text')
  final TextValidation text;
  
  @HiveField(1)
   @JsonKey(name: '')
  final AuthorValidation author;

  QuoteValidation({
    required this.text,
    required this.author,
  });

  factory QuoteValidation.fromJson(Map<String, dynamic> json) => 
    _$QuoteValidationFromJson(json);
  
  Map<String, dynamic> toJson() => _$QuoteValidationToJson(this);
}
