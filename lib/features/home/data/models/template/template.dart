import 'package:hive/hive.dart';

import '../template_style/template_style.dart';
part 'template.g.dart';

@HiveType(typeId: 5)
class Template extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final Map<String, String> title;

  @HiveField(2)
  final Map<String, String> description;

  @HiveField(3)
  final String backgroundId;

  @HiveField(4)
  final String? quoteId;

  @HiveField(5)
  final Map<String, String> greeting;

  @HiveField(6)
  final TemplateStyle style;

  @HiveField(7)
  final List<String> categories;

  @HiveField(8)
  final List<String> occasions;

  @HiveField(9)
  final bool isPremium;

  @HiveField(10)
  final DateTime createdAt;

  Template({
    required this.id,
    required this.title,
    required this.description,
    required this.backgroundId,
    this.quoteId,
    required this.greeting,
    required this.style,
    required this.categories,
    required this.occasions,
    required this.isPremium,
    required this.createdAt,
  });

  factory Template.fromJson(Map<String, dynamic> json) => Template(
        id: json['id'],
        title: Map<String, String>.from(json['title']),
        description: Map<String, String>.from(json['description']),
        backgroundId: json['backgroundId'],
        quoteId: json['quoteId'],
        greeting: Map<String, String>.from(json['greeting']),
        style: TemplateStyle.fromJson(json['style']),
        categories: List<String>.from(json['categories']),
        occasions: List<String>.from(json['occasions']),
        isPremium: json['isPremium'],
        createdAt: DateTime.parse(json['createdAt']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'backgroundId': backgroundId,
        'quoteId': quoteId,
        'greeting': greeting,
        'style': style.toJson(),
        'categories': categories,
        'occasions': occasions,
        'isPremium': isPremium,
        'createdAt': createdAt.toIso8601String(),
      };
}
