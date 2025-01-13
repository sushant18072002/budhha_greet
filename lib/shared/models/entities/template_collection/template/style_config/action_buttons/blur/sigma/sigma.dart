import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sigma.g.dart';

@HiveType(typeId: 204)
@JsonSerializable()
class Sigma {
  @HiveField(0)
  final double x;

  @HiveField(1)
  final double y;

  Sigma({
    required this.x,
    required this.y,
  });

  factory Sigma.fromJson(Map<String, dynamic> json) => _$SigmaFromJson(json);

  Map<String, dynamic> toJson() => _$SigmaToJson(this);
}
