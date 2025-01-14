import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'layout_position.g.dart';

@HiveType(typeId: 35)
@JsonSerializable()
class LayoutPosition {
  @HiveField(0)
  @JsonKey(name: 'x')
  final double x;
  
  @HiveField(1)
  @JsonKey(name: 'y')
  final double y;

  LayoutPosition({
    required this.x,
    required this.y,
  });

  factory LayoutPosition.fromJson(Map<String, dynamic> json) => _$LayoutPositionFromJson(json);
  Map<String, dynamic> toJson() => _$LayoutPositionToJson(this);
}
