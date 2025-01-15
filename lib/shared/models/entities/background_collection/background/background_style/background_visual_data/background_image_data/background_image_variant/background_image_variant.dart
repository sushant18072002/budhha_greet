
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'background_image_variant.g.dart';

@HiveType(typeId: 20)
@JsonSerializable()
class BackgroundImageVariant {
  @HiveField(0)
   @JsonKey(name: 'width')
  final int width;
  
  @HiveField(1)
   @JsonKey(name: 'height')
  final int height;
  
  @HiveField(2)
   @JsonKey(name: 'path')
  final String path;

  BackgroundImageVariant({
    required this.width,
    required this.height,
    required this.path,
  });

  factory BackgroundImageVariant.fromJson(Map<String, dynamic> json) => 
    _$BackgroundImageVariantFromJson(json);
  
  Map<String, dynamic> toJson() => _$BackgroundImageVariantToJson(this);
}
