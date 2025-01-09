import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'style_colors.dart';
import 'typography.dart';

part 'style.g.dart';

@HiveType(typeId: 11)
@JsonSerializable()
class Style {
  @HiveField(0)
  @JsonKey(name: 'typography')
  final Typography typography;
  
  @HiveField(1)
  @JsonKey(name: 'colors')
  final StyleColors colors;

  Style({
    required this.typography,
    required this.colors,
  });

  factory Style.fromJson(Map<String, dynamic> json) => 
    _$StyleFromJson(json);
  
  Map<String, dynamic> toJson() => _$StyleToJson(this);
}
