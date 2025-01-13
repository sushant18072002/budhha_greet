import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'grid_columns.g.dart';

@HiveType(typeId: 106)
@JsonSerializable()
class GridColumns {
  @HiveField(0)
  @JsonKey(name: 'small')
  final int small;
  
  @HiveField(1)
  @JsonKey(name: 'medium')
  final int medium;
  
  @HiveField(2)
  @JsonKey(name: 'large')
  final int large;
  
  @HiveField(3)
  @JsonKey(name: 'xlarge')
  final int xlarge;

  GridColumns({
    required this.small,
    required this.medium,
    required this.large,
    required this.xlarge,
  });

  factory GridColumns.fromJson(Map<String, dynamic> json) => _$GridColumnsFromJson(json);
  Map<String, dynamic> toJson() => _$GridColumnsToJson(this);
}