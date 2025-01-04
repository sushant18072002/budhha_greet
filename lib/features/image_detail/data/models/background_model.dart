import 'package:buddha_greet/shared/models/background_text_area/background_text_area.dart';
import 'package:hive/hive.dart';
part 'background_model.g.dart';

@HiveType(typeId: 2)
class Background extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String type;

  @HiveField(2)
  final String? imageUrl;

  @HiveField(3)
  final Map<String, dynamic>? gradient;

  @HiveField(4)
  final Map<String, String> title;

  @HiveField(5)
  final Map<String, String>? description;

  @HiveField(6)
  final List<String> categories;

  @HiveField(7)
  final List<String> tags;

  @HiveField(8)
  final Map<String, int>? dimensions;

  @HiveField(9)
  final List<BackgroundTextArea> textAreas;

  @HiveField(10)
  final String? attribution;

  @HiveField(11)
  final DateTime createdAt;

  Background({
    required this.id,
    required this.type,
    this.imageUrl,
    this.gradient,
    required this.title,
    this.description,
    required this.categories,
    required this.tags,
    this.dimensions,
    required this.textAreas,
    this.attribution,
    required this.createdAt,
  });

  factory Background.fromJson(Map<String, dynamic> json) => Background(
        id: json['id'],
        type: json['type'],
        imageUrl: json['imageUrl'],
        gradient: json['gradient'],
        title: Map<String, String>.from(json['title']),
        description: json['description'] != null
            ? Map<String, String>.from(json['description'])
            : null,
        categories: List<String>.from(json['categories']),
        tags: List<String>.from(json['tags']),
        dimensions: json['dimensions'] != null
            ? Map<String, int>.from(json['dimensions'])
            : null,
        textAreas: (json['textAreas'] as List)
            .map((e) => BackgroundTextArea.fromJson(e))
            .toList(),
        attribution: json['attribution'],
        createdAt: DateTime.parse(json['createdAt']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'imageUrl': imageUrl,
        'gradient': gradient,
        'title': title,
        'description': description,
        'categories': categories,
        'tags': tags,
        'dimensions': dimensions,
        'textAreas': textAreas.map((e) => e.toJson()).toList(),
        'attribution': attribution,
        'createdAt': createdAt.toIso8601String(),
      };
}