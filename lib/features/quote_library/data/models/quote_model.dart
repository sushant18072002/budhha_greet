import 'package:hive/hive.dart';

import '../../../../shared/models/background_text_style/background_text_style.dart';

part 'quote_model.g.dart';

@HiveType(typeId: 0)
class Quote extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final Map<String, String> text;

  @HiveField(2)
  final Map<String, String> author;

  @HiveField(3)
  final Map<String, String> source;

  @HiveField(4)
  final List<String> categories;

  @HiveField(5)
  final List<String> tags;

  @HiveField(6)
  final bool isVerified;

  @HiveField(7)
  final BackgroundTextStyle style;

  @HiveField(8)
  final DateTime createdAt;

  Quote({
    required this.id,
    required this.text,
    required this.author,
    required this.source,
    required this.categories,
    required this.tags,
    required this.isVerified,
    required this.style,
    required this.createdAt,
  });

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        id: json['id'],
        text: Map<String, String>.from(json['text']),
        author: Map<String, String>.from(json['author']),
        source: Map<String, String>.from(json['source']),
        categories: List<String>.from(json['categories']),
        tags: List<String>.from(json['tags']),
        isVerified: json['isVerified'],
        style: BackgroundTextStyle.fromJson(json['style']),
        createdAt: DateTime.parse(json['createdAt']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'text': text,
        'author': author,
        'source': source,
        'categories': categories,
        'tags': tags,
        'isVerified': isVerified,
        'style': style.toJson(),
        'createdAt': createdAt.toIso8601String(),
      };
}
