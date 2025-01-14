import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'action_sigma/action_sigma.dart';

export 'action_sigma/action_sigma.dart';

part 'action_blur.g.dart';

@HiveType(typeId: 111)
@JsonSerializable()
class ActionBlur {
  @HiveField(0)
  final bool enabled;

  @HiveField(1)
  final ActionSigma sigma;

  ActionBlur({
    required this.enabled,
    required this.sigma,
  });

  factory ActionBlur.fromJson(Map<String, dynamic> json) => _$ActionBlurFromJson(json);

  Map<String, dynamic> toJson() => _$ActionBlurToJson(this);
}
