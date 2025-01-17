import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_metadata.g.dart';

@HiveType(typeId: 62)
@JsonSerializable()
class CategoryMetadata {
  @HiveField(0)
  @JsonKey(name: 'icon')
  final String icon;
  
  @HiveField(1)
  @JsonKey(name: 'color')
  final String color;

  CategoryMetadata({
    required this.icon,
    required this.color,
  });

  factory CategoryMetadata.fromJson(Map<String, dynamic> json) => 
    _$CategoryMetadataFromJson(json);
  
  Map<String, dynamic> toJson() => _$CategoryMetadataToJson(this);
}
