import 'package:buddha_greet/shared/models/layout/safe_area.dart';
import 'package:buddha_greet/shared/models/layout/size.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'position.dart';

part 'element_layout.g.dart';

@HiveType(typeId: 34)
@JsonSerializable()
class ElementLayout {
  @HiveField(0)
  final Position position;
  
  @HiveField(1)
  final Size size;
  
  @HiveField(2)
  final double padding;
  
  @HiveField(3)
  final SafeArea? safeArea;

  ElementLayout({
    required this.position,
    required this.size,
    required this.padding,
    this.safeArea,
  });

  factory ElementLayout.fromJson(Map<String, dynamic> json) => 
    _$ElementLayoutFromJson(json);
  
  Map<String, dynamic> toJson() => _$ElementLayoutToJson(this);
}
