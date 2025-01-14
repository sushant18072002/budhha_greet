import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'action_sigma.g.dart';

@HiveType(typeId: 204)
@JsonSerializable()
class ActionSigma {
  @HiveField(0)
  final double x;

  @HiveField(1)
  final double y;

  ActionSigma({
    required this.x,
    required this.y,
  });

  factory ActionSigma.fromJson(Map<String, dynamic> json) => _$ActionSigmaFromJson(json);

  Map<String, dynamic> toJson() => _$ActionSigmaToJson(this);
}
