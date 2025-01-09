import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'audit.g.dart';

@HiveType(typeId: 17)
@JsonSerializable()
class Audit {
  @HiveField(0)
   @JsonKey(name: 'created_at')
  final DateTime createdAt;
  
  @HiveField(1)
   @JsonKey(name: 'created_by')
  final String createdBy;
  
  @HiveField(2)
   @JsonKey(name: 'modified_at')
  final DateTime modifiedAt;
  
  @HiveField(3)
   @JsonKey(name: 'modified_by')
  final String modifiedBy;
  
  @HiveField(4)
   @JsonKey(name: 'version')
  final int version;

  Audit({
    required this.createdAt,
    required this.createdBy,
    required this.modifiedAt,
    required this.modifiedBy,
    required this.version,
  });

  factory Audit.fromJson(Map<String, dynamic> json) => 
    _$AuditFromJson(json);
  
  Map<String, dynamic> toJson() => _$AuditToJson(this);
}
