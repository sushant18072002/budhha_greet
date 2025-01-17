import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_schema.g.dart';

@HiveType(typeId: 59)
@JsonSerializable()
class CategorySchema {
  @HiveField(0)
  @JsonKey(name: 'type')
  final String type;
  
  @HiveField(1)
  @JsonKey(name: 'id_prefix')
  final String idPrefix;
  
  @HiveField(2)
  @JsonKey(name: 'indexes')
  final List<String> indexes;
  
  @HiveField(3)
  @JsonKey(name: 'required')
  final List<String> required;

  CategorySchema({
    required this.type,
    required this.idPrefix,
    required this.indexes,
    required this.required,
  });

  factory CategorySchema.fromJson(Map<String, dynamic> json) => 
    _$CategorySchemaFromJson(json);
  
  Map<String, dynamic> toJson() => _$CategorySchemaToJson(this);
}