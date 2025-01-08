import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'metrics.g.dart';

@HiveType(typeId: 16)
@JsonSerializable()
class Metrics {
  @HiveField(0)
  final int views;
  
  @HiveField(1)
  final int shares;
  
  @HiveField(2)
  final int favorites;
  
  @HiveField(3)
  final DateTime? lastInteraction;

  Metrics({
    required this.views,
    required this.shares,
    required this.favorites,
    this.lastInteraction,
  });

  factory Metrics.fromJson(Map<String, dynamic> json) => 
    _$MetricsFromJson(json);
  
  Map<String, dynamic> toJson() => _$MetricsToJson(this);
}
