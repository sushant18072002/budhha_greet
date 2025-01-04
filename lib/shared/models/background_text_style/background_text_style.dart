import 'package:hive/hive.dart';
part 'background_text_style.g.dart';

@HiveType(typeId: 1)
class BackgroundTextStyle extends HiveObject {
  @HiveField(0)
  final double fontSize;

  @HiveField(1)
  final String fontFamily;

  @HiveField(2)
  final String colorHex;

  @HiveField(3)
  final List<String> effects;

  BackgroundTextStyle({
    required this.fontSize,
    required this.fontFamily,
    required this.colorHex,
    required this.effects,
  });

  factory BackgroundTextStyle.fromJson(Map<String, dynamic> json) => BackgroundTextStyle(
        fontSize: json['fontSize']?.toDouble() ?? 24,
        fontFamily: json['fontFamily'] ?? 'Playfair Display',
        colorHex: json['colorHex'] ?? '#FFFFFF',
        effects: List<String>.from(json['effects'] ?? []),
      );

  Map<String, dynamic> toJson() => {
        'fontSize': fontSize,
        'fontFamily': fontFamily,
        'colorHex': colorHex,
        'effects': effects,
      };
}