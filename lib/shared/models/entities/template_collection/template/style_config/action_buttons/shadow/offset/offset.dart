import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'offset.g.dart';

@HiveType(typeId: 206)
@JsonSerializable()
class Offset {
  @HiveField(0)
  final double x;

  @HiveField(1)
  final double y;

  Offset({
    required this.x,
    required this.y,
  });

  factory Offset.fromJson(Map<String, dynamic> json) => _$OffsetFromJson(json);

  Map<String, dynamic> toJson() => _$OffsetToJson(this);
}
