import 'package:buddha_greet/shared/models/entities/author.dart';
import 'package:buddha_greet/shared/models/entities/category.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'background.dart';
import 'language.dart';
import 'quote.dart';
import 'source.dart';
import 'template.dart';

part 'entities.g.dart';

@HiveType(typeId: 6)
@JsonSerializable()
class Entities {
  @HiveField(0)
  final LanguageCollection languages;
  
  @HiveField(1)
  final CategoryCollection categories;
  
  @HiveField(2)
  final AuthorCollection authors;
  
  @HiveField(3)
  final SourceCollection sources;
  
  @HiveField(4)
  final QuoteCollection quotes;
  
  @HiveField(5)
  final BackgroundCollection backgrounds;
  
  @HiveField(6)
  final Map<String, Template> templates;

  Entities({
    required this.languages,
    required this.categories,
    required this.authors,
    required this.sources,
    required this.quotes,
    required this.backgrounds,
    required this.templates,
  });

  factory Entities.fromJson(Map<String, dynamic> json) => 
    _$EntitiesFromJson(json);
  
  Map<String, dynamic> toJson() => _$EntitiesToJson(this);
}

