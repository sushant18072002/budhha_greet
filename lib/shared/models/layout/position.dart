import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';


part 'position.g.dart';

@HiveType(typeId: 35)
@JsonSerializable()
class Position {
  @HiveField(0)
  @JsonKey(name: 'x')
  final double x;
  
  @HiveField(1)
  @JsonKey(name: 'y')
  final double y;

  Position({
    required this.x,
    required this.y,
  });

  factory Position.fromJson(Map<String, dynamic> json) => 
    _$PositionFromJson(json);
  
  Map<String, dynamic> toJson() => _$PositionToJson(this);
}
