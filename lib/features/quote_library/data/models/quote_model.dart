import 'package:hive/hive.dart';

import '../../../../shared/models/background_text_style/background_text_style.dart';

part 'quote_model.g.dart';

@HiveType(typeId: 0)
class Quote extends HiveObject {
  @HiveField(0)
  final String uuid;

  @HiveField(1)
  final String id;

  @HiveField(2)
  final Map<String, String> text;

  @HiveField(3)
  final Author author;

  @HiveField(4)
  final Source source;

  @HiveField(5)
  final List<String> categories;

  @HiveField(6)
  final List<String> tags;

  @HiveField(7)
  final QuoteStyle style;

  @HiveField(8)
  final QuoteLocalization localization;

  @HiveField(9)
  final QuoteAccessibility accessibility;

  @HiveField(10)
  final QuoteModeration moderation;

  @HiveField(11)
  final QuoteMetrics metrics;

  @HiveField(12)
  final AuditInfo audit;

  Quote({
    required this.uuid,
    required this.id,
    required this.text,
    required this.author,
    required this.source,
    required this.categories,
    required this.tags,
    required this.style,
    required this.localization,
    required this.accessibility,
    required this.moderation,
    required this.metrics,
    required this.audit,
  });

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        uuid: json['uuid'],
        id: json['id'],
        text: Map<String, String>.from(json['text']),
        author: Author.fromJson(json['author']),
        source: Source.fromJson(json['source']),
        categories: List<String>.from(json['categories']),
        tags: List<String>.from(json['tags']),
        style: QuoteStyle.fromJson(json['style']),
        localization: QuoteLocalization.fromJson(json['localization']),
        accessibility: QuoteAccessibility.fromJson(json['accessibility']),
        moderation: QuoteModeration.fromJson(json['moderation']),
        metrics: QuoteMetrics.fromJson(json['metrics']),
        audit: AuditInfo.fromJson(json['audit']),
      );
}


