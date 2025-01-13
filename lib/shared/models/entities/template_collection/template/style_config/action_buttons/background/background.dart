import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'background.g.dart';

@HiveType(typeId: 202)
@JsonSerializable()
class Background {
  @HiveField(0)
  final double opacity;

  @HiveField(1)
  final String color;

  Background({
    required this.opacity,
    required this.color,
  });

  factory Background.fromJson(Map<String, dynamic> json) =>
      _$BackgroundFromJson(json);

  Map<String, dynamic> toJson() => _$BackgroundToJson(this);
}
