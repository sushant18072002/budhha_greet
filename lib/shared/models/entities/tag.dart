import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../analytics/audit.dart';

part 'tag.g.dart';

@HiveType(typeId: 65)
@JsonSerializable()
class TagCollection {
  @HiveField(0)
   @JsonKey(name: 'schema')
  final TagSchema schema;
  
  @HiveField(1)
   @JsonKey(name: 'data')
  final List<Tag> data;

  TagCollection({
    required this.schema,
    required this.data,
  });

  factory TagCollection.fromJson(Map<String, dynamic> json) => 
    _$TagCollectionFromJson(json);
  
  Map<String, dynamic> toJson() => _$TagCollectionToJson(this);
}

@HiveType(typeId: 66)
@JsonSerializable()
class TagSchema {
  @HiveField(0)
   @JsonKey(name: 'type')
  final String type;
  
  @HiveField(1)
   @JsonKey(name: 'id_prefix')
  final String idPrefix;
  
  @HiveField(2)
   @JsonKey(name: 'indexes')
  final List<String> indexes;
  
  @HiveField(3)
   @JsonKey(name: 'required')
  final List<String> required;

  TagSchema({
    required this.type,
    required this.idPrefix,
    required this.indexes,
    required this.required,
  });

  factory TagSchema.fromJson(Map<String, dynamic> json) => 
    _$TagSchemaFromJson(json);
  
  Map<String, dynamic> toJson() => _$TagSchemaToJson(this);
}

@HiveType(typeId: 67)
@JsonSerializable()
class Tag {
  @HiveField(0)
   @JsonKey(name: 'id')
  final String id;
  
  @HiveField(1)
   @JsonKey(name: 'category')
  final String category;
  
  @HiveField(2)
   @JsonKey(name: 'translations')
  final Map<String, TagTranslation> translations;
  
  @HiveField(3)
   @JsonKey(name: 'metadata')
  final TagMetadata metadata;
  
  @HiveField(4)
   @JsonKey(name: 'audit')
  final Audit audit;

  Tag({
    required this.id,
    required this.category,
    required this.translations,
    required this.metadata,
    required this.audit,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => 
    _$TagFromJson(json);
  
  Map<String, dynamic> toJson() => _$TagToJson(this);
}

@HiveType(typeId: 68)
@JsonSerializable()
class TagTranslation {
  @HiveField(0)
   @JsonKey(name: 'name')
  final String name;
  
  @HiveField(1)
   @JsonKey(name: 'description')
  final String description;

  TagTranslation({
    required this.name,
    required this.description,
  });

  factory TagTranslation.fromJson(Map<String, dynamic> json) => 
    _$TagTranslationFromJson(json);
  
  Map<String, dynamic> toJson() => _$TagTranslationToJson(this);
}

@HiveType(typeId: 69)
@JsonSerializable()
class TagMetadata {
  @HiveField(0)
   @JsonKey(name: 'icon')
  final String icon;
  
  @HiveField(1)
   @JsonKey(name: 'color')
  final String color;

  TagMetadata({
    required this.icon,
    required this.color,
  });

  factory TagMetadata.fromJson(Map<String, dynamic> json) => 
    _$TagMetadataFromJson(json);
  
  Map<String, dynamic> toJson() => _$TagMetadataToJson(this);
}