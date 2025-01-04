import 'package:hive/hive.dart';

import '../../../../../shared/models/background_text_style/background_text_style.dart';
part 'template_style.g.dart';

@HiveType(typeId: 6)
class TemplateStyle extends HiveObject {
  @HiveField(0)
  final BackgroundTextStyle greeting;

  @HiveField(1)
  final BackgroundTextStyle quote;

  TemplateStyle({
    required this.greeting,
    required this.quote,
  });

  factory TemplateStyle.fromJson(Map<String, dynamic> json) => TemplateStyle(
        greeting: BackgroundTextStyle.fromJson(json['greeting']),
        quote: BackgroundTextStyle.fromJson(json['quote']),
      );

  Map<String, dynamic> toJson() => {
        'greeting': greeting.toJson(),
        'quote': quote.toJson(),
      };
}