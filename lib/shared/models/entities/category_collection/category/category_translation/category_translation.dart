import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_translation.g.dart';

@HiveType(typeId: 61)
@JsonSerializable()
class CategoryTranslation {
  @HiveField(0)
  @JsonKey(name: 'name')
  final String name;
  
  @HiveField(1)
  @JsonKey(name: 'description')
  final String description;

  CategoryTranslation({
    required this.name,
    required this.description,
  });

  factory CategoryTranslation.fromJson(Map<String, dynamic> json) => 
    _$CategoryTranslationFromJson(json);
  
  Map<String, dynamic> toJson() => _$CategoryTranslationToJson(this);
}