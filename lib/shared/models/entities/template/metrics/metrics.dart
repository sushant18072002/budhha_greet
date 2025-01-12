import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'metrics.g.dart';

@HiveType(typeId: 16)
@JsonSerializable()
class Metrics {
  @HiveField(0)
  @JsonKey(name: 'views')
  final int views;
  
  @HiveField(1)
  @JsonKey(name: 'shares')
  final int shares;
  
  @HiveField(2)
  @JsonKey(name: 'favorites')
  final int favorites;
  
  @HiveField(3)
  @JsonKey(name: 'last_used')
  final DateTime? lastUsed;

  Metrics({
    required this.views,
    required this.shares,
    required this.favorites,
    this.lastUsed,
  });

  factory Metrics.fromJson(Map<String, dynamic> json) => _$MetricsFromJson(json);
  Map<String, dynamic> toJson() => _$MetricsToJson(this);
}