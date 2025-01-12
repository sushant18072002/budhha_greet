import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'blur_sigma/blur_sigma.dart';

part 'blur.g.dart';

@HiveType(typeId: 80)
@JsonSerializable()
class Blur {
  @HiveField(0)
  @JsonKey(name: 'enabled')
  final bool enabled;
  
  @HiveField(1)
  @JsonKey(name: 'sigma')
  final BlurSigma sigma;
  
  @HiveField(2)
  @JsonKey(name: 'quality')
  final String quality;

  Blur({
    required this.enabled,
    required this.sigma,
    required this.quality,
  });

  factory Blur.fromJson(Map<String, dynamic> json) => _$BlurFromJson(json);
  Map<String, dynamic> toJson() => _$BlurToJson(this);
}
