import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'template/template.dart';
export 'template/template.dart';

part 'template_collection.g.dart';

@HiveType(typeId: 79)
@JsonSerializable()
class TemplateCollection {
  @HiveField(0)
  @JsonKey(name: 'data')
  final List<Template> data;

  TemplateCollection({
    required this.data,
  });

  factory TemplateCollection.fromJson(Map<String, dynamic> json) => _$TemplateCollectionFromJson(json);
  Map<String, dynamic> toJson() => _$TemplateCollectionToJson(this);
}
