import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'layout_safe_area.g.dart';

@HiveType(typeId: 37)
@JsonSerializable()
class LayoutSafeArea {
  @HiveField(0)
  @JsonKey(name: 'top')
  final double top;
  
  @HiveField(1)
  @JsonKey(name: 'bottom')
  final double bottom;

  LayoutSafeArea({
    required this.top,
    required this.bottom,
  });

  factory LayoutSafeArea.fromJson(Map<String, dynamic> json) => _$LayoutSafeAreaFromJson(json);
  Map<String, dynamic> toJson() => _$LayoutSafeAreaToJson(this);
}
