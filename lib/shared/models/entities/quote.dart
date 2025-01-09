import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../analytics/audit.dart';
import '../analytics/metrics.dart';
import '../style/style.dart';
import 'translation.dart';

part 'quote.g.dart';

@HiveType(typeId: 77)
@JsonSerializable()
class QuoteCollection {
  @HiveField(0)
   @JsonKey(name: 'data')
  final List<Quote> data;

  QuoteCollection({
    required this.data,
  });

  factory QuoteCollection.fromJson(Map<String, dynamic> json) => 
    _$QuoteCollectionFromJson(json);
  
  Map<String, dynamic> toJson() => _$QuoteCollectionToJson(this);
}

@HiveType(typeId: 8)
@JsonSerializable()
class Quote {
  @HiveField(0)
   @JsonKey(name: 'uuid')
  final String uuid;
  
  @HiveField(1)
   @JsonKey(name: 'translations')
  final Map<String, Translation> translations;
  
  @HiveField(2)
   @JsonKey(name: 'author_id')
  final String authorId;
  
  @HiveField(3)
   @JsonKey(name: 'source_id')
  final String sourceId;
  
  @HiveField(4)
   @JsonKey(name: 'category_ids')
  final List<String> categoryIds;
  
  @HiveField(5)
   @JsonKey(name: 'tag_ids')
  final List<String> tagIds;
  
  @HiveField(6)
   @JsonKey(name: 'style')
  final Style style;
  
  @HiveField(7)
   @JsonKey(name: 'metadata')
  final QuoteMetadata metadata;
  
  @HiveField(8)
  @JsonKey(name: 'metrics')
  final Metrics metrics;
  
  @HiveField(9)
  @JsonKey(name: 'audit')
  final Audit audit;

  Quote({
    required this.uuid,
    required this.translations,
    required this.authorId,
    required this.sourceId,
    required this.categoryIds,
    required this.tagIds,
    required this.style,
    required this.metadata,
    required this.metrics,
    required this.audit,
  });

  factory Quote.fromJson(Map<String, dynamic> json) => 
    _$QuoteFromJson(json);
  
  Map<String, dynamic> toJson() => _$QuoteToJson(this);
}

@HiveType(typeId: 15)
@JsonSerializable()
class QuoteMetadata {
  @HiveField(0)
   @JsonKey(name: 'original_language')
  final String originalLanguage;
  
  @HiveField(1)
   @JsonKey(name: 'moderation_status')
  final String moderationStatus;
  
  @HiveField(2)
   @JsonKey(name: 'moderation_date')
  final DateTime moderationDate;
  
  @HiveField(3)
   @JsonKey(name: 'moderation_by')
  final String moderationBy;

  QuoteMetadata({
    required this.originalLanguage,
    required this.moderationStatus,
    required this.moderationDate,
    required this.moderationBy,
  });

  factory QuoteMetadata.fromJson(Map<String, dynamic> json) => 
    _$QuoteMetadataFromJson(json);
  
  Map<String, dynamic> toJson() => _$QuoteMetadataToJson(this);
}
