import 'package:buddha_greet/shared/models/entities/author.dart';
import 'package:buddha_greet/shared/models/entities/category.dart';
import 'package:buddha_greet/shared/models/entities/tag.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'background_collection/background_collection.dart';
import 'language.dart';
import 'qoute_collection/qoute_collection.dart';
import 'source.dart';
import 'template_collection/template_collection.dart';


part 'entities.g.dart';

@HiveType(typeId: 6)
@JsonSerializable()
class Entities {
  @HiveField(0)
  @JsonKey(name: 'languages')
  final LanguageCollection languages;
  
  @HiveField(1)
  @JsonKey(name: 'categories')
  final CategoryCollection categories;
  
  @HiveField(2)
  @JsonKey(name: 'authors')
  final AuthorCollection authors;
  
  @HiveField(3)
  @JsonKey(name: 'sources')
  final SourceCollection sources;
  
  @HiveField(4)
  @JsonKey(name: 'quotes')
  final QuoteCollection quotes;
  
  @HiveField(5)
  @JsonKey(name: 'backgrounds')
  final BackgroundCollection backgrounds;
  
  @HiveField(6)
  @JsonKey(name: 'templates')
  final TemplateCollection templates;

  @HiveField(7)
  @JsonKey(name: 'tags')
  final TagCollection tagCollection;

  Entities({
    required this.languages,
    required this.categories,
    required this.authors,
    required this.sources,
    required this.quotes,
    required this.backgrounds,
    required this.templates,
    required this.tagCollection
  });

  factory Entities.fromJson(Map<String, dynamic> json) => 
    _$EntitiesFromJson(json);
  
  Map<String, dynamic> toJson() => _$EntitiesToJson(this);
}

