import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../analytics/audit.dart';
import '../app_config/data_cache_config.dart';
import '../app_config/image_cache_config.dart';

part 'author.g.dart';

@HiveType(typeId: 28)
@JsonSerializable()
class SystemCacheConfig{
  @HiveField(0)
  final ImageCacheConfig image;
  
  @HiveField(1)
  final DataCacheConfig data;

  SystemCacheConfig({
    required this.image,
    required this.data,
  });

  factory SystemCacheConfig.fromJson(Map<String, dynamic> json) => 
    _$SystemCacheConfigFromJson(json);
  
  Map<String, dynamic> toJson() => _$SystemCacheConfigToJson(this);
}


@HiveType(typeId: 70)
@JsonSerializable()
class AuthorCollection {
  @HiveField(0)
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
  final String uuid;
  
  @HiveField(1)
  final Map<String, AuthorTranslation> translations;
  
  @HiveField(2)
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
  final String name;
  
  @HiveField(1)
  final String info;

  AuthorTranslation({
    required this.name,
    required this.info,
  });

  factory AuthorTranslation.fromJson(Map<String, dynamic> json) => 
    _$AuthorTranslationFromJson(json);
  
  Map<String, dynamic> toJson() => _$AuthorTranslationToJson(this);
}