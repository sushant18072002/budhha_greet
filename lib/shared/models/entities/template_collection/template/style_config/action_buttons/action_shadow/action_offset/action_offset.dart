import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'action_offset.g.dart';

@HiveType(typeId: 206)
@JsonSerializable()
class ActionOffset {
  @HiveField(0)
  final double x;

  @HiveField(1)
  final double y;

  ActionOffset({
    required this.x,
    required this.y,
  });

  factory ActionOffset.fromJson(Map<String, dynamic> json) => _$ActionOffsetFromJson(json);

  Map<String, dynamic> toJson() => _$ActionOffsetToJson(this);
}
