
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'background_color_palette.g.dart';

@HiveType(typeId: 24)
@JsonSerializable()
class BackgroundColorPalette {
  @HiveField(0)
   @JsonKey(name: 'light')
  final String light;
  
  @HiveField(1)
   @JsonKey(name: 'dark')
  final String dark;

  BackgroundColorPalette({
    required this.light,
    required this.dark,
  });

  factory BackgroundColorPalette.fromJson(Map<String, dynamic> json) => 
    _$BackgroundColorPaletteFromJson(json);
  
  Map<String, dynamic> toJson() => _$BackgroundColorPaletteToJson(this);
}
