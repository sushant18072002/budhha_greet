import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sigma_value.g.dart';

@HiveType(typeId: 82)
@JsonSerializable()
class SigmaValue {
  @HiveField(0)
  @JsonKey(name: 'base')
  final double base;
  
  @HiveField(1)
  @JsonKey(name: 'min')
  final double min;
  
  @HiveField(2)
  @JsonKey(name: 'max')
  final double max;

  SigmaValue({
    required this.base,
    required this.min,
    required this.max,
  });

  factory SigmaValue.fromJson(Map<String, dynamic> json) => _$SigmaValueFromJson(json);
  Map<String, dynamic> toJson() => _$SigmaValueToJson(this);
}
