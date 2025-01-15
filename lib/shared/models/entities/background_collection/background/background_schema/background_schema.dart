
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'background_schema.g.dart';

@HiveType(typeId: 64)
@JsonSerializable()
class BackgroundSchema {
  @HiveField(0)
   @JsonKey(name: 'type')
  final String type;
  
  @HiveField(1)
   @JsonKey(name: 'indexes')
  final List<String> indexes;
  
  @HiveField(2)
   @JsonKey(name: 'required')
  final List<String> required;
  
  @HiveField(3)
   @JsonKey(name: 'unique')
  final List<String> unique;

  BackgroundSchema({
    required this.type,
    required this.indexes,
    required this.required,
    required this.unique,
  });

  factory BackgroundSchema.fromJson(Map<String, dynamic> json) => 
    _$BackgroundSchemaFromJson(json);
  
  Map<String, dynamic> toJson() => _$BackgroundSchemaToJson(this);
}

