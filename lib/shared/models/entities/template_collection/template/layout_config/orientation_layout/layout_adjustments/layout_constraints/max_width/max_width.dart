import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'max_width.g.dart';

@HiveType(typeId: 102)
@JsonSerializable()
class MaxWidth {
  @HiveField(0)
  @JsonKey(name: 'title')
  final double title;
  
  @HiveField(1)
  @JsonKey(name: 'quote')
  final double quote;

  MaxWidth({
    required this.title,
    required this.quote,
  });

  factory MaxWidth.fromJson(Map<String, dynamic> json) => _$MaxWidthFromJson(json);
  Map<String, dynamic> toJson() => _$MaxWidthToJson(this);
}