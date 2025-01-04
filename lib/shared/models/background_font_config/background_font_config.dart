import 'package:hive/hive.dart';

import '../background_font_category/background_font_category.dart';
part 'background_font_config.g.dart';

@HiveType(typeId: 8)
class BackgroundFontConfig extends HiveObject {
  @HiveField(0)
  final List<BackgroundFontCategory> categories;

  @HiveField(1)
  final List<String> effects;

  @HiveField(2)
  final List<String> colors;

  BackgroundFontConfig({
    required this.categories,
    required this.effects,
    required this.colors,
  });

  factory BackgroundFontConfig.fromJson(Map<String, dynamic> json) => BackgroundFontConfig(
        categories: (json['categories'] as List)
            .map((e) => BackgroundFontCategory.fromJson(e))
            .toList(),
        effects: List<String>.from(json['effects']),
        colors: List<String>.from(json['colors']),
      );

  Map<String, dynamic> toJson() => {
        'categories': categories.map((e) => e.toJson()).toList(),
        'effects': effects,
        'colors': colors,
      };
}