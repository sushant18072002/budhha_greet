import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'layout_size.g.dart';

@HiveType(typeId: 36)
@JsonSerializable()
class LayoutSize {
  @HiveField(0)
  @JsonKey(name: 'width')
  final double width;
  
  @HiveField(1)
  @JsonKey(name: 'height')
  final double height;

  LayoutSize({
    required this.width,
    required this.height,
  });

  factory LayoutSize.fromJson(Map<String, dynamic> json) => _$LayoutSizeFromJson(json);
  Map<String, dynamic> toJson() => _$LayoutSizeToJson(this);
}
