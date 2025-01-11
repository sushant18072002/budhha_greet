import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'size.g.dart';

@HiveType(typeId: 36)
@JsonSerializable()
class CustomSize {
  @HiveField(0)
  @JsonKey(name: 'width')
  final double width;
  
  @HiveField(1)
  @JsonKey(name: 'height')
  final double height;

  CustomSize({
    required this.width,
    required this.height,
  });

  factory CustomSize.fromJson(Map<String, dynamic> json) => 
    _$SizeFromJson(json);
  
  Map<String, dynamic> toJson() => _$SizeToJson(this);
}

