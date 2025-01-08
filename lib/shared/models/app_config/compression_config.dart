import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'compression_config.g.dart';

@HiveType(typeId: 56)
@JsonSerializable()
class CompressionConfig {
  @HiveField(0)
  final bool enabled;
  
  @HiveField(1)
  final int quality;

  CompressionConfig({
    required this.enabled,
    required this.quality,
  });

  factory CompressionConfig.fromJson(Map<String, dynamic> json) => 
    _$CompressionConfigFromJson(json);
  
  Map<String, dynamic> toJson() => _$CompressionConfigToJson(this);
}
