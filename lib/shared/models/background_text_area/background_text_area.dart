import 'package:hive_flutter/hive_flutter.dart';

import '../background_text_position/background_text_position.dart';
part 'background_text_area.g.dart';

@HiveType(typeId: 3)
class BackgroundTextArea extends HiveObject {
    @HiveField(0)
    final String id;

    @HiveField(1)
    final BackgroundTextPosition portrait;

    @HiveField(2)
    final BackgroundTextPosition landscape;

    BackgroundTextArea({
        required this.id,
        required this.portrait,
        required this.landscape,
    });

    factory BackgroundTextArea.fromJson(Map<String, dynamic> json) => BackgroundTextArea(
        id: json['id'],
        portrait: BackgroundTextPosition.fromJson(json['portrait'] as Map<String, dynamic>),
        landscape: BackgroundTextPosition.fromJson(json['landscape'] as Map<String, dynamic>),
    );
      Map<String, dynamic> toJson() => {
        'id': id,
        'portrait': portrait,
        'landscape': landscape,
      };
}
