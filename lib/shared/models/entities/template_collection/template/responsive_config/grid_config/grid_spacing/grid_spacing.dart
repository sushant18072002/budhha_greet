import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'grid_spacing.g.dart';

@HiveType(typeId: 105)
@JsonSerializable()
class GridSpacing {
  @HiveField(0)
  @JsonKey(name: 'small')
  final double small;
  
  @HiveField(1)
  @JsonKey(name: 'medium')
  final double medium;
  
  @HiveField(2)
  @JsonKey(name: 'large')
  final double large;

  GridSpacing({
    required this.small,
    required this.medium,
    required this.large,
  });

  factory GridSpacing.fromJson(Map<String, dynamic> json) => _$GridSpacingFromJson(json);
  Map<String, dynamic> toJson() => _$GridSpacingToJson(this);
}