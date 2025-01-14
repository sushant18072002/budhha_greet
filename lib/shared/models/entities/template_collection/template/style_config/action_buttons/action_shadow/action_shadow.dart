import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'action_offset/action_offset.dart';

export 'action_offset/action_offset.dart';

part 'action_shadow.g.dart';

@HiveType(typeId: 205)
@JsonSerializable()
class ActionShadow {
  @HiveField(0)
  final String color;

  @HiveField(1)
  final ActionOffset offset;

  @HiveField(2)
  final double blurRadius;

  ActionShadow({
    required this.color,
    required this.offset,
    required this.blurRadius,
  });

  factory ActionShadow.fromJson(Map<String, dynamic> json) => _$ActionShadowFromJson(json);

  Map<String, dynamic> toJson() => _$ActionShadowToJson(this);
}
