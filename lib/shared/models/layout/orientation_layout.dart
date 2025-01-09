import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'element_layout.dart';


part 'orientation_layout.g.dart';

@HiveType(typeId: 33)
@JsonSerializable()
class OrientationLayout {
  @HiveField(0)
  @JsonKey(name: 'greeting')
  final ElementLayout greeting;
  
  @HiveField(1)
  @JsonKey(name: 'quote')
  final ElementLayout quote;

  OrientationLayout({
    required this.greeting,
    required this.quote,
  });

  factory OrientationLayout.fromJson(Map<String, dynamic> json) => 
    _$OrientationLayoutFromJson(json);
  
  Map<String, dynamic> toJson() => _$OrientationLayoutToJson(this);
}
