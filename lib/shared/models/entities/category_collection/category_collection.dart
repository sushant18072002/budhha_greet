import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'category/category.dart';
import 'category_schema/category_schema.dart';

export 'category/category.dart';
export 'category_schema/category_schema.dart';

part 'category_collection.g.dart';

@HiveType(typeId: 58)
@JsonSerializable()
class CategoryCollection {
  @HiveField(0)
  @JsonKey(name: 'schema')
  final CategorySchema schema;
  
  @HiveField(1)
  @JsonKey(name: 'data')
  final List<Category> data;

  CategoryCollection({
    required this.schema,
    required this.data,
  });

  factory CategoryCollection.fromJson(Map<String, dynamic> json) => 
    _$CategoryCollectionFromJson(json);
  
  Map<String, dynamic> toJson() => _$CategoryCollectionToJson(this);
}