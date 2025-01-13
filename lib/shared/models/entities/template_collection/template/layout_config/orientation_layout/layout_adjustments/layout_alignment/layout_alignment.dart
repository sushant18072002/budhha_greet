import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'layout_alignment.g.dart';

@HiveType(typeId: 100)
@JsonSerializable()
class LayoutAlignment {
  @HiveField(0)
  @JsonKey(name: 'title')
  final String title;
  
  @HiveField(1)
  @JsonKey(name: 'quote')
  final String quote;

  LayoutAlignment({
    required this.title,
    required this.quote,
  });

  factory LayoutAlignment.fromJson(Map<String, dynamic> json) => _$LayoutAlignmentFromJson(json);
  Map<String, dynamic> toJson() => _$LayoutAlignmentToJson(this);
}