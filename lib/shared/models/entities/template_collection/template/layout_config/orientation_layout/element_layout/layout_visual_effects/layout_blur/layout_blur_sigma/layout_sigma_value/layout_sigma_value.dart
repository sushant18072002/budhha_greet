import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'layout_sigma_value.g.dart';

@HiveType(typeId: 82)
@JsonSerializable()
class LayoutSigmaValue {
  @HiveField(0)
  @JsonKey(name: 'base')
  final double base;
  
  @HiveField(1)
  @JsonKey(name: 'min')
  final double min;
  
  @HiveField(2)
  @JsonKey(name: 'max')
  final double max;

  LayoutSigmaValue({
    required this.base,
    required this.min,
    required this.max,
  });

  factory LayoutSigmaValue.fromJson(Map<String, dynamic> json) => _$LayoutSigmaValueFromJson(json);
  Map<String, dynamic> toJson() => _$LayoutSigmaValueToJson(this);
}
