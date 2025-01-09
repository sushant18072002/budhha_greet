import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../style/font_size.dart';
import '../style/style_colors.dart';

part 'translation.g.dart';

@HiveType(typeId: 10)
@JsonSerializable()
class Translation {
  @HiveField(0)
   @JsonKey(name: 'text')
  final String text;

  @HiveField(1)
   @JsonKey(name: 'description')
  final String? description;
  
  @HiveField(2)
   @JsonKey(name: 'semantic_label')
  final String? semanticLabel;

  Translation({
    required this.text,
    this.description,
    this.semanticLabel,
  });

  factory Translation.fromJson(Map<String, dynamic> json) => 
    _$TranslationFromJson(json);
  
  Map<String, dynamic> toJson() => _$TranslationToJson(this);
}


