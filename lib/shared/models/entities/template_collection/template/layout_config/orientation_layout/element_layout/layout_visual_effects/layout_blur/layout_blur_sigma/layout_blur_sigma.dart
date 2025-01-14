import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'layout_sigma_value/layout_sigma_value.dart';

part 'layout_blur_sigma.g.dart';

@HiveType(typeId: 81)
@JsonSerializable()
class LayoutBlurSigma {
  @HiveField(0)
  @JsonKey(name: 'x')
  final LayoutSigmaValue x;
  
  @HiveField(1)
  @JsonKey(name: 'y')
  final LayoutSigmaValue y;

  LayoutBlurSigma({
    required this.x,
    required this.y,
  });

  factory LayoutBlurSigma.fromJson(Map<String, dynamic> json) => _$LayoutBlurSigmaFromJson(json);
  Map<String, dynamic> toJson() => _$LayoutBlurSigmaToJson(this);
}
