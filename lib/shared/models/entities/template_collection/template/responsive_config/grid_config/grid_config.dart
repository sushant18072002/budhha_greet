import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'grid_columns/grid_columns.dart';
import 'grid_spacing/grid_spacing.dart';

export 'grid_columns/grid_columns.dart';
export 'grid_spacing/grid_spacing.dart';

part 'grid_config.g.dart';

@HiveType(typeId: 104)
@JsonSerializable()
class GridConfig {
  @HiveField(0)
  @JsonKey(name: 'spacing')
  final GridSpacing spacing;
  
  @HiveField(1)
  @JsonKey(name: 'columns')
  final GridColumns columns;

  GridConfig({
    required this.spacing,
    required this.columns,
  });

  factory GridConfig.fromJson(Map<String, dynamic> json) => _$GridConfigFromJson(json);
  Map<String, dynamic> toJson() => _$GridConfigToJson(this);
}