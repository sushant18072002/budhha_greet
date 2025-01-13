import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'offset/offset.dart';

part 'shadow.g.dart';

@HiveType(typeId: 205)
@JsonSerializable()
class Shadow {
  @HiveField(0)
  final String color;

  @HiveField(1)
  final Offset offset;

  @HiveField(2)
  final double blurRadius;

  Shadow({
    required this.color,
    required this.offset,
    required this.blurRadius,
  });

  factory Shadow.fromJson(Map<String, dynamic> json) => _$ShadowFromJson(json);

  Map<String, dynamic> toJson() => _$ShadowToJson(this);
}
