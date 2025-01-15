
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'background_image_variant/background_image_variant.dart';

export 'background_image_variant/background_image_variant.dart';

part 'background_image_data.g.dart';

@HiveType(typeId: 19)
@JsonSerializable()
class BackgroundImageData {
  @HiveField(0)
   @JsonKey(name: 'original')
  final String original;
  
  @HiveField(1)
   @JsonKey(name: 'thumbnail')
  final String thumbnail;
  
  @HiveField(2)
   @JsonKey(name: 'placeholder')
  final String placeholder;
  
  @HiveField(3)
   @JsonKey(name: 'variants')
  final List<BackgroundImageVariant> variants;

  BackgroundImageData({
    required this.original,
    required this.thumbnail,
    required this.placeholder,
    required this.variants,
  });

  factory BackgroundImageData.fromJson(Map<String, dynamic> json) => 
    _$BackgroundImageDataFromJson(json);
  
  Map<String, dynamic> toJson() => _$BackgroundImageDataToJson(this);
}
