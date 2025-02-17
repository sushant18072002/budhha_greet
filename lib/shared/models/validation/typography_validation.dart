import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'typography_validation.g.dart';

@HiveType(typeId: 46)
@JsonSerializable()
class TypographyValidation {
  @HiveField(0)
   @JsonKey(name: 'min_font_size')
  final int minFontSize;
  
  @HiveField(1)
   @JsonKey(name: 'max_font_size')
  final int maxFontSize;

  TypographyValidation({
    required this.minFontSize,
    required this.maxFontSize,
  });

  factory TypographyValidation.fromJson(Map<String, dynamic> json) => 
    _$TypographyValidationFromJson(json);
  
  Map<String, dynamic> toJson() => _$TypographyValidationToJson(this);
}
