import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'layout_blur_sigma/layout_blur_sigma.dart';

export 'layout_blur_sigma/layout_blur_sigma.dart';

part 'layout_blur.g.dart';

@HiveType(typeId: 115)
@JsonSerializable()
class LayoutBlur {
  @HiveField(0)
  @JsonKey(name: 'enabled')
  final bool enabled;
  
  @HiveField(1)
  @JsonKey(name: 'sigma')
  final LayoutBlurSigma sigma;
  
  @HiveField(2)
  @JsonKey(name: 'quality')
  final String quality;

  LayoutBlur({
    required this.enabled,
    required this.sigma,
    required this.quality,
  });

  factory LayoutBlur.fromJson(Map<String, dynamic> json) => _$LayoutBlurFromJson(json);
  Map<String, dynamic> toJson() => _$LayoutBlurToJson(this);
}
