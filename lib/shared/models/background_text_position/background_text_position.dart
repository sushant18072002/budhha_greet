import 'package:hive/hive.dart';
part 'background_text_position.g.dart';

@HiveType(typeId: 4)
class BackgroundTextPosition extends HiveObject {
  @HiveField(0)
  final double x;

  @HiveField(1)
  final double y;

  @HiveField(2)
  final double width;

  @HiveField(3)
  final double height;

  @HiveField(4)
  final double rotation;

  BackgroundTextPosition({
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    this.rotation = 0,
  });

  factory BackgroundTextPosition.fromJson(Map<String, dynamic> json) => BackgroundTextPosition(
        x: json['x']?.toDouble() ?? 0.5,
        y: json['y']?.toDouble() ?? 0.5,
        width: json['width']?.toDouble() ?? 0.8,
        height: json['height']?.toDouble() ?? 0.2,
        rotation: json['rotation']?.toDouble() ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'x': x,
        'y': y,
        'width': width,
        'height': height,
        'rotation': rotation,
      };
}