import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'sigma/sigma.dart';

part 'blur.g.dart';

@HiveType(typeId: 203)
@JsonSerializable()
class Blur {
  @HiveField(0)
  final bool enabled;

  @HiveField(1)
  final Sigma sigma;

  Blur({
    required this.enabled,
    required this.sigma,
  });

  factory Blur.fromJson(Map<String, dynamic> json) => _$BlurFromJson(json);

  Map<String, dynamic> toJson() => _$BlurToJson(this);
}
