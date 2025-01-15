import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'background/background.dart';
import 'background/background_schema/background_schema.dart';

export 'background/background.dart';
export 'background/background_schema/background_schema.dart';

part 'background_collection.g.dart';

@HiveType(typeId: 63)
@JsonSerializable()
class BackgroundCollection {
  @HiveField(0)
   @JsonKey(name: 'schema')
  final BackgroundSchema schema;
  
  @HiveField(1)
   @JsonKey(name: 'data')
  final List<Background> data;

  BackgroundCollection({
    required this.schema,
    required this.data,
  });

  factory BackgroundCollection.fromJson(Map<String, dynamic> json) => 
    _$BackgroundCollectionFromJson(json);
  
  Map<String, dynamic> toJson() => _$BackgroundCollectionToJson(this);
}
