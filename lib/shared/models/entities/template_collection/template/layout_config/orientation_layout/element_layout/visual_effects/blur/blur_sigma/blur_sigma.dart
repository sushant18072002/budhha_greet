import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'sigma_value/sigma_value.dart';

part 'blur_sigma.g.dart';

@HiveType(typeId: 81)
@JsonSerializable()
class BlurSigma {
  @HiveField(0)
  @JsonKey(name: 'x')
  final SigmaValue x;
  
  @HiveField(1)
  @JsonKey(name: 'y')
  final SigmaValue y;

  BlurSigma({
    required this.x,
    required this.y,
  });

  factory BlurSigma.fromJson(Map<String, dynamic> json) => _$BlurSigmaFromJson(json);
  Map<String, dynamic> toJson() => _$BlurSigmaToJson(this);
}
