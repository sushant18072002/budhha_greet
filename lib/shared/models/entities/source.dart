import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../analytics/audit.dart';


part 'source.g.dart';

@HiveType(typeId: 73)
@JsonSerializable()
class SourceCollection {
  @HiveField(0)
  final List<Source> data;

  SourceCollection({
    required this.data,
  });

  factory SourceCollection.fromJson(Map<String, dynamic> json) => 
    _$SourceCollectionFromJson(json);
  
  Map<String, dynamic> toJson() => _$SourceCollectionToJson(this);
}

@HiveType(typeId: 74)
@JsonSerializable()
class Source {
  @HiveField(0)
  final String uuid;
  
  @HiveField(1)
  final Map<String, SourceTranslation> translations;
  
  @HiveField(2)
  final String reference;
  
  @HiveField(3)
  final String type;
  
  @HiveField(4)
  final Audit audit;

  Source({
    required this.uuid,
    required this.translations,
    required this.reference,
    required this.type,
    required this.audit,
  });

  factory Source.fromJson(Map<String, dynamic> json) => 
    _$SourceFromJson(json);
  
  Map<String, dynamic> toJson() => _$SourceToJson(this);
}

@HiveType(typeId: 75)
@JsonSerializable()
class SourceTranslation {
  @HiveField(0)
  final String title;

  SourceTranslation({
    required this.title,
  });

  factory SourceTranslation.fromJson(Map<String, dynamic> json) => 
    _$SourceTranslationFromJson(json);
  
  Map<String, dynamic> toJson() => _$SourceTranslationToJson(this);
}