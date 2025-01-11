import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../analytics/audit.dart';

part 'author.g.dart';

@HiveType(typeId: 70)
@JsonSerializable()
class AuthorCollection {
  @HiveField(0)
  @JsonKey(name: 'data')
  final List<Author> data;

  AuthorCollection({
    required this.data,
  });

  factory AuthorCollection.fromJson(Map<String, dynamic> json) => 
    _$AuthorCollectionFromJson(json);
  
  Map<String, dynamic> toJson() => _$AuthorCollectionToJson(this);
}

@HiveType(typeId: 71)
@JsonSerializable()
class Author {
  @HiveField(0)
  @JsonKey(name: 'uuid')
  final String uuid;
  
  @HiveField(1)
  @JsonKey(name: 'translations')
  final Map<String, AuthorTranslation> translations;
  
  @HiveField(2)
  @JsonKey(name: 'audit')
  final Audit audit;

  Author({
    required this.uuid,
    required this.translations,
    required this.audit,
  });

  factory Author.fromJson(Map<String, dynamic> json) => 
    _$AuthorFromJson(json);
  
  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}

@HiveType(typeId: 72)
@JsonSerializable()
class AuthorTranslation {
  
  @HiveField(0)
  @JsonKey(name: 'name')
  final String name;
  
  @HiveField(1)
  @JsonKey(name: 'info')
  final String info;

  AuthorTranslation({
    required this.name,
    required this.info,
  });

  factory AuthorTranslation.fromJson(Map<String, dynamic> json) => 
    _$AuthorTranslationFromJson(json);
  
  Map<String, dynamic> toJson() => _$AuthorTranslationToJson(this);
}