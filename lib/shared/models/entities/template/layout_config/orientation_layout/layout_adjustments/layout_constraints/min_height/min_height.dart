import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'min_height.g.dart';

@HiveType(typeId: 103)
@JsonSerializable()
class MinHeight {
  @HiveField(0)
  @JsonKey(name: 'title')
  final double title;
  
  @HiveField(1)
  @JsonKey(name: 'quote')
  final double quote;

  MinHeight({
    required this.title,
    required this.quote,
  });

  factory MinHeight.fromJson(Map<String, dynamic> json) => _$MinHeightFromJson(json);
  Map<String, dynamic> toJson() => _$MinHeightToJson(this);
}
