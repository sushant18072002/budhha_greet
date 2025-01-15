import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'background_optimization.g.dart';

@HiveType(typeId: 27)
@JsonSerializable()
class BackgroundOptimization {
  @HiveField(0)
   @JsonKey(name: 'formats')
  final List<String> formats;
  
  @HiveField(1)
   @JsonKey(name: 'quality')
  final int quality;
  
  @HiveField(2)
   @JsonKey(name: 'placeholder')
  final String placeholder;

  BackgroundOptimization({
    required this.formats,
    required this.quality,
    required this.placeholder,
  });

  factory BackgroundOptimization.fromJson(Map<String, dynamic> json) => 
    _$BackgroundOptimizationFromJson(json);
  
  Map<String, dynamic> toJson() => _$BackgroundOptimizationToJson(this);
}