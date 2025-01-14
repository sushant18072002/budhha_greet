
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shadow_offset.g.dart'; 

@HiveType(typeId: 118)
@JsonSerializable()
class ShadowOffset {
  @HiveField(0)
  @JsonKey(name: 'x')
  final double x;
  
  @HiveField(1)
  @JsonKey(name: 'y')
  final double y;

  ShadowOffset({
    required this.x,
    required this.y,
  });

  factory ShadowOffset.fromJson(Map<String, dynamic> json) => 
    _$ShadowOffsetFromJson(json);
  
  Map<String, dynamic> toJson() => _$ShadowOffsetToJson(this);
}
