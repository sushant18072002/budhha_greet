import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'metadata.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Metadata {
  @HiveField(0)
  @JsonKey(name: 'schema_version')
  final String schemaVersion;

  @HiveField(1)
  @JsonKey(name: 'last_updated')
  final DateTime lastUpdated;

  @HiveField(2)
  @JsonKey(name: 'min_app_version')
  final String minAppVersion;

  Metadata({
    required this.schemaVersion,
    required this.lastUpdated,
    required this.minAppVersion,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}
