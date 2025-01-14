import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'qoute_font_size.g.dart';

@HiveType(typeId: 13)
@JsonSerializable()
class QouteFontSize {
  @HiveField(0)
  @JsonKey(name: 'base')
  final double base;
  
  @HiveField(1)
  @JsonKey(name: 'min')
  final double min;
  
  @HiveField(2)
  @JsonKey(name: 'max')
  final double max;
  
  @HiveField(3)
  @JsonKey(name: 'scale')
  final double scale;

  QouteFontSize({
    required this.base,
    required this.min,
    required this.max,
    required this.scale,
  });

  factory QouteFontSize.fromJson(Map<String, dynamic> json) => 
    _$QouteFontSizeFromJson(json);
  
  Map<String, dynamic> toJson() => _$QouteFontSizeToJson(this);
}
