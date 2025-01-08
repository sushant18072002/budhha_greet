import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'safe_area.g.dart';

@HiveType(typeId: 37)
@JsonSerializable()
class SafeArea {
  @HiveField(0)
  final double top;
  
  @HiveField(1)
  final double bottom;

  SafeArea({
    required this.top,
    required this.bottom,
  });

  factory SafeArea.fromJson(Map<String, dynamic> json) => 
    _$SafeAreaFromJson(json);
  
  Map<String, dynamic> toJson() => _$SafeAreaToJson(this);
}
