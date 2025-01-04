import 'package:hive/hive.dart';
part 'background_font_category.g.dart';

@HiveType(typeId: 7)
class BackgroundFontCategory extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final List<String> fonts;

  @HiveField(2)
  final List<int> sizes;

  BackgroundFontCategory({
    required this.id,
    required this.fonts,
    required this.sizes,
  });

  factory BackgroundFontCategory.fromJson(Map<String, dynamic> json) => BackgroundFontCategory(
        id: json['id'],
        fonts: List<String>.from(json['fonts']),
        sizes: List<int>.from(json['sizes']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'fonts': fonts,
        'sizes': sizes,
      };
}