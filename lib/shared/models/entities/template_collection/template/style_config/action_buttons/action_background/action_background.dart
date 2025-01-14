import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'action_background.g.dart';

@HiveType(typeId: 202)
@JsonSerializable()
class ActionBackground {
  @HiveField(0)
  final double opacity;

  @HiveField(1)
  final String color;

  ActionBackground({
    required this.opacity,
    required this.color,
  });

  factory ActionBackground.fromJson(Map<String, dynamic> json) =>
      _$ActionBackgroundFromJson(json);

  Map<String, dynamic> toJson() => _$ActionBackgroundToJson(this);
}
