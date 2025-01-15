import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'background_translation.g.dart';


@HiveType(typeId: 80)
@JsonSerializable()
class BackGroundTranslation {
  @HiveField(0)
  @JsonKey(name: 'title')
  final String title;
  
  @HiveField(1)
  @JsonKey(name: 'description')
  final String? description;
  
  @HiveField(2)
  @JsonKey(name: 'semantic_label')
  final String? semanticLabel;
  
  BackGroundTranslation({
    required this.title,
    this.description,
    this.semanticLabel,
  });

  factory BackGroundTranslation.fromJson(Map<String, dynamic> json) => 
    _$BackGroundTranslationFromJson(json);
  
  Map<String, dynamic> toJson() => _$BackGroundTranslationToJson(this);
}