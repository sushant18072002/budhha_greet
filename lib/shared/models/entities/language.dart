import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'language.g.dart';

@HiveType(typeId: 7)
@JsonSerializable()
class Language {
  @HiveField(0)
  final String id;
  
  @HiveField(1)
  final String name;
  
  @HiveField(2)
  final bool rtl;

  Language({
    required this.id,
    required this.name,
    required this.rtl,
  });

  factory Language.fromJson(Map<String, dynamic> json) => 
    _$LanguageFromJson(json);
  
  Map<String, dynamic> toJson() => _$LanguageToJson(this);
}

@HiveType(typeId: 76)
@JsonSerializable()
class LanguageCollection {
  @HiveField(0)
  final List<Language> data;

  LanguageCollection({
    required this.data,
  });

  factory LanguageCollection.fromJson(Map<String, dynamic> json) => 
    _$LanguageCollectionFromJson(json);
  
  Map<String, dynamic> toJson() => _$LanguageCollectionToJson(this);
}