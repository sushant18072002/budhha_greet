import 'package:buddha_greet/shared/models/entities/translation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../analytics/audit.dart';
import '../app_config/cache_config.dart';
import '../style/visual_data.dart';
import '../style/visual_effects.dart';

part 'background.g.dart';

@HiveType(typeId: 9)
@JsonSerializable()
class Background {
  @HiveField(0)
  final String uuid;
  
  @HiveField(1)
  final String id;
  
  @HiveField(2)
  final String type;
  
  @HiveField(3)
  final Map<String, Translation> translations;
  
  @HiveField(4)
  final VisualData visualData;
  
  @HiveField(5)
  final VisualEffects visualEffects;
  
  @HiveField(6)
  final List<String> categoryIds;
  
  @HiveField(7)
  final List<String> tagIds;
  
  @HiveField(8)
  final Attribution attribution;
  
  @HiveField(9)
  final Optimization optimization;
  
  @HiveField(10)
  final CacheConfig cacheConfig;
  
  @HiveField(11)
  final Audit audit;

  Background({
    required this.uuid,
    required this.id,
    required this.type,
    required this.translations,
    required this.visualData,
    required this.visualEffects,
    required this.categoryIds,
    required this.tagIds,
    required this.attribution,
    required this.optimization,
    required this.cacheConfig,
    required this.audit,
  });

  factory Background.fromJson(Map<String, dynamic> json) => 
    _$BackgroundFromJson(json);
  
  Map<String, dynamic> toJson() => _$BackgroundToJson(this);
}

@HiveType(typeId: 19)
@JsonSerializable()
class ImageData {
  @HiveField(0)
  final String original;
  
  @HiveField(1)
  final String thumbnail;
  
  @HiveField(2)
  final String placeholder;
  
  @HiveField(3)
  final List<ImageVariant> variants;

  ImageData({
    required this.original,
    required this.thumbnail,
    required this.placeholder,
    required this.variants,
  });

  factory ImageData.fromJson(Map<String, dynamic> json) => 
    _$ImageDataFromJson(json);
  
  Map<String, dynamic> toJson() => _$ImageDataToJson(this);
}

@HiveType(typeId: 20)
@JsonSerializable()
class ImageVariant {
  @HiveField(0)
  final int width;
  
  @HiveField(1)
  final int height;
  
  @HiveField(2)
  final String path;

  ImageVariant({
    required this.width,
    required this.height,
    required this.path,
  });

  factory ImageVariant.fromJson(Map<String, dynamic> json) => 
    _$ImageVariantFromJson(json);
  
  Map<String, dynamic> toJson() => _$ImageVariantToJson(this);
}

@HiveType(typeId: 21)
@JsonSerializable()
class GradientData {
  @HiveField(0)
  final List<String> colors;
  
  @HiveField(1)
  final String type;
  
  @HiveField(2)
  final double angle;
  
  @HiveField(3)
  final List<GradientStop> stops;

  GradientData({
    required this.colors,
    required this.type,
    required this.angle,
    required this.stops,
  });

  factory GradientData.fromJson(Map<String, dynamic> json) => 
    _$GradientDataFromJson(json);
  
  Map<String, dynamic> toJson() => _$GradientDataToJson(this);
}

@HiveType(typeId: 22)
@JsonSerializable()
class GradientStop {
  @HiveField(0)
  final double position;
  
  @HiveField(1)
  final String color;

  GradientStop({
    required this.position,
    required this.color,
  });

  factory GradientStop.fromJson(Map<String, dynamic> json) => 
    _$GradientStopFromJson(json);
  
  Map<String, dynamic> toJson() => _$GradientStopToJson(this);
}

@HiveType(typeId: 23)
@JsonSerializable()
class ColorData {
  @HiveField(0)
  final String color;
  
  @HiveField(1)
  final ColorPalette palette;

  ColorData({
    required this.color,
    required this.palette,
  });

  factory ColorData.fromJson(Map<String, dynamic> json) => 
    _$ColorDataFromJson(json);
  
  Map<String, dynamic> toJson() => _$ColorDataToJson(this);
}

@HiveType(typeId: 24)
@JsonSerializable()
class ColorPalette {
  @HiveField(0)
  final String light;
  
  @HiveField(1)
  final String dark;

  ColorPalette({
    required this.light,
    required this.dark,
  });

  factory ColorPalette.fromJson(Map<String, dynamic> json) => 
    _$ColorPaletteFromJson(json);
  
  Map<String, dynamic> toJson() => _$ColorPaletteToJson(this);
}


@HiveType(typeId: 26)
@JsonSerializable()
class Attribution {
  @HiveField(0)
  final String? photographer;
  
  @HiveField(1)
  final String license;
  
  @HiveField(2)
  final String url;

  Attribution({
    this.photographer,
    required this.license,
    required this.url,
  });

  factory Attribution.fromJson(Map<String, dynamic> json) => 
    _$AttributionFromJson(json);
  
  Map<String, dynamic> toJson() => _$AttributionToJson(this);
}

@HiveType(typeId: 27)
@JsonSerializable()
class Optimization {
  @HiveField(0)
  final List<String> formats;
  
  @HiveField(1)
  final int quality;
  
  @HiveField(2)
  final String placeholder;

  Optimization({
    required this.formats,
    required this.quality,
    required this.placeholder,
  });

  factory Optimization.fromJson(Map<String, dynamic> json) => 
    _$OptimizationFromJson(json);
  
  Map<String, dynamic> toJson() => _$OptimizationToJson(this);
}

@HiveType(typeId: 63)
@JsonSerializable()
class BackgroundCollection {
  @HiveField(0)
  final BackgroundSchema schema;
  
  @HiveField(1)
  final List<Background> data;

  BackgroundCollection({
    required this.schema,
    required this.data,
  });

  factory BackgroundCollection.fromJson(Map<String, dynamic> json) => 
    _$BackgroundCollectionFromJson(json);
  
  Map<String, dynamic> toJson() => _$BackgroundCollectionToJson(this);
}

@HiveType(typeId: 64)
@JsonSerializable()
class BackgroundSchema {
  @HiveField(0)
  final String type;
  
  @HiveField(1)
  final List<String> indexes;
  
  @HiveField(2)
  final List<String> required;
  
  @HiveField(3)
  final List<String> unique;

  BackgroundSchema({
    required this.type,
    required this.indexes,
    required this.required,
    required this.unique,
  });

  factory BackgroundSchema.fromJson(Map<String, dynamic> json) => 
    _$BackgroundSchemaFromJson(json);
  
  Map<String, dynamic> toJson() => _$BackgroundSchemaToJson(this);
}
