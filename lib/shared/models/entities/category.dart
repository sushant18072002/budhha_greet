import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../analytics/audit.dart';

part 'category.g.dart';

@HiveType(typeId: 58)
@JsonSerializable()
class CategoryCollection {
  @HiveField(0)
  final CategorySchema schema;
  
  @HiveField(1)
  final List<Category> data;

  CategoryCollection({
    required this.schema,
    required this.data,
  });

  factory CategoryCollection.fromJson(Map<String, dynamic> json) => 
    _$CategoryCollectionFromJson(json);
  
  Map<String, dynamic> toJson() => _$CategoryCollectionToJson(this);
}

@HiveType(typeId: 59)
@JsonSerializable()
class CategorySchema {
  @HiveField(0)
  final String type;
  
  @HiveField(1)
  final String idPrefix;
  
  @HiveField(2)
  final List<String> indexes;
  
  @HiveField(3)
  final List<String> required;

  CategorySchema({
    required this.type,
    required this.idPrefix,
    required this.indexes,
    required this.required,
  });

  factory CategorySchema.fromJson(Map<String, dynamic> json) => 
    _$CategorySchemaFromJson(json);
  
  Map<String, dynamic> toJson() => _$CategorySchemaToJson(this);
}

@HiveType(typeId: 60)
@JsonSerializable()
class Category {
  @HiveField(0)
  final String id;
  
  @HiveField(1)
  final String type;
  
  @HiveField(2)
  final String? parentId;
  
  @HiveField(3)
  final Map<String, CategoryTranslation> translations;
  
  @HiveField(4)
  final CategoryMetadata metadata;
  
  @HiveField(5)
  final Audit audit;

  Category({
    required this.id,
    required this.type,
    this.parentId,
    required this.translations,
    required this.metadata,
    required this.audit,
  });

  factory Category.fromJson(Map<String, dynamic> json) => 
    _$CategoryFromJson(json);
  
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@HiveType(typeId: 61)
@JsonSerializable()
class CategoryTranslation {
  @HiveField(0)
  final String name;
  
  @HiveField(1)
  final String description;

  CategoryTranslation({
    required this.name,
    required this.description,
  });

  factory CategoryTranslation.fromJson(Map<String, dynamic> json) => 
    _$CategoryTranslationFromJson(json);
  
  Map<String, dynamic> toJson() => _$CategoryTranslationToJson(this);
}

@HiveType(typeId: 62)
@JsonSerializable()
class CategoryMetadata {
  @HiveField(0)
  final String icon;
  
  @HiveField(1)
  final String color;

  CategoryMetadata({
    required this.icon,
    required this.color,
  });

  factory CategoryMetadata.fromJson(Map<String, dynamic> json) => 
    _$CategoryMetadataFromJson(json);
  
  Map<String, dynamic> toJson() => _$CategoryMetadataToJson(this);
}
