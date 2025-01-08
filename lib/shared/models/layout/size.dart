import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'size.g.dart';

@HiveType(typeId: 36)
@JsonSerializable()
class Size {
  @HiveField(0)
  final double width;
  
  @HiveField(1)
  final double height;

  Size({
    required this.width,
    required this.height,
  });

  factory Size.fromJson(Map<String, dynamic> json) => 
    _$SizeFromJson(json);
  
  Map<String, dynamic> toJson() => _$SizeToJson(this);
}

