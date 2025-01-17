import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../analytics/audit.dart';
import 'category_metadata/category_metadata.dart';
import 'category_translation/category_translation.dart';

export  '../../../analytics/audit.dart';
export 'category_metadata/category_metadata.dart';
export 'category_translation/category_translation.dart';

part 'category.g.dart';

@HiveType(typeId: 60)
@JsonSerializable()
class Category {
  @HiveField(0)
  @JsonKey(name: 'id')
  final String id;
  
  @HiveField(1)
  @JsonKey(name: 'type')
  final String type;
  
  @HiveField(2)
  @JsonKey(name: 'parent_id')
  final String? parentId;
  
  @HiveField(3)
  @JsonKey(name: 'translations')
  final Map<String, CategoryTranslation> translations;
  
  @HiveField(4)
  @JsonKey(name: 'metadata')
  final CategoryMetadata metadata;
  
  @HiveField(5)
  @JsonKey(name: 'audit')
  final Audit audit;

  Category({
    required this.id,
    required this.type,
    this.parentId,
    required this.translations,
    required this.metadata,
    required this.audit,
  });

  factory Category.fromJson(Map<String, dynamic> json) => 
    _$CategoryFromJson(json);
  
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
