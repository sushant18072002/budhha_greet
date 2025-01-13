import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'template_metadata.g.dart';

@HiveType(typeId: 40)
@JsonSerializable()
class TemplateMetadata {
  @HiveField(0)
  @JsonKey(name: 'is_premium')
  final bool isPremium;
  
  @HiveField(1)
  @JsonKey(name: 'status')
  final String status;
  
  @HiveField(2)
  @JsonKey(name: 'version')
  final int version;

  TemplateMetadata({
    required this.isPremium,
    required this.status,
    required this.version,
  });

  factory TemplateMetadata.fromJson(Map<String, dynamic> json) => _$TemplateMetadataFromJson(json);
  Map<String, dynamic> toJson() => _$TemplateMetadataToJson(this);
}