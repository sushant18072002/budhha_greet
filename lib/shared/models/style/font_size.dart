import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'font_size.g.dart';

@HiveType(typeId: 13)
@JsonSerializable()
class FontSize {
  @HiveField(0)
  final double base;
  
  @HiveField(1)
  final double min;
  
  @HiveField(2)
  final double max;
  
  @HiveField(3)
  final double scale;

  FontSize({
    required this.base,
    required this.min,
    required this.max,
    required this.scale,
  });

  factory FontSize.fromJson(Map<String, dynamic> json) => 
    _$FontSizeFromJson(json);
  
  Map<String, dynamic> toJson() => _$FontSizeToJson(this);
}
