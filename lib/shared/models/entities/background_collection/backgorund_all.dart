// import 'package:hive/hive.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'background.g.dart';

// @HiveType(typeId: 9)
// @JsonSerializable()
// class Background {
//   @HiveField(0)
//   @JsonKey(name: 'uuid')
//   final String uuid;

//   @HiveField(1)
//   @JsonKey(name: 'id')
//   final String id;

//   @HiveField(2)
//   @JsonKey(name: 'type')
//   final String type;

//   @HiveField(3)
//   @JsonKey(name: 'translations')
//   final Map<String, BackGroundTranslation> translations;

//   @HiveField(4)
//   @JsonKey(name: 'visual_data')
//   final BackgroundVisualData visualData;

//   @HiveField(5)
//   @JsonKey(name: 'visual_effects')
//   final BackgroundVisualEffects visualEffects;

//   @HiveField(6)
//   @JsonKey(name: 'category_ids')
//   final List<String> categoryIds;

//   @HiveField(7)
//   @JsonKey(name: 'tag_ids')
//   final List<String> tagIds;

//   @HiveField(8)
//   @JsonKey(name: 'attribution')
//   final BackgroundAttribution attribution;

//   @HiveField(9)
//   @JsonKey(name: 'optimization')
//   final BackgroundOptimization optimization;

//   @HiveField(10)
//   @JsonKey(name: 'cache_config')
//   final CacheConfig cacheConfig;

//   @HiveField(11)
//   @JsonKey(name: 'audit')
//   final Audit audit;

//   Background({
//     required this.uuid,
//     required this.id,
//     required this.type,
//     required this.translations,
//     required this.visualData,
//     required this.visualEffects,
//     required this.categoryIds,
//     required this.tagIds,
//     required this.attribution,
//     required this.optimization,
//     required this.cacheConfig,
//     required this.audit,
//   });

//   factory Background.fromJson(Map<String, dynamic> json) =>
//       _$BackgroundFromJson(json);

//   Map<String, dynamic> toJson() => _$BackgroundToJson(this);
// }


// @HiveType(typeId: 80)
// @JsonSerializable()
// class BackGroundTranslation {
//   @HiveField(0)
//   @JsonKey(name: 'title')
//   final String title;
  
//   @HiveField(1)
//   @JsonKey(name: 'description')
//   final String? description;
  
//   @HiveField(2)
//   @JsonKey(name: 'semantic_label')
//   final String? semanticLabel;
  
//   BackGroundTranslation({
//     required this.title,
//     this.description,
//     this.semanticLabel,
//   });

//   factory BackGroundTranslation.fromJson(Map<String, dynamic> json) => 
//     _$BackGroundTranslationFromJson(json);
  
//   Map<String, dynamic> toJson() => _$BackGroundTranslationToJson(this);
// }

// @HiveType(typeId: 18)
// @JsonSerializable()
// class BackgroundVisualData {
//   @HiveField(0)
//    @JsonKey(name: 'image')
//   final BackgroundImageData? image;
  
//   @HiveField(1)
//    @JsonKey(name: 'gradient')
//   final BackgroundGradientData? gradient;
  
//   @HiveField(2)
//    @JsonKey(name: 'color')
//   final BackgroundColorData? color;

//   BackgroundVisualData({
//     this.image,
//     this.gradient,
//     this.color,
//   });

//   factory BackgroundVisualData.fromJson(Map<String, dynamic> json) => 
//     _$BackgroundVisualDataFromJson(json);
  
//   Map<String, dynamic> toJson() => _$BackgroundVisualDataToJson(this);
// }

// class BackgroundImageData {
//   @HiveField(0)
//    @JsonKey(name: 'original')
//   final String original;
  
//   @HiveField(1)
//    @JsonKey(name: 'thumbnail')
//   final String thumbnail;
  
//   @HiveField(2)
//    @JsonKey(name: 'placeholder')
//   final String placeholder;
  
//   @HiveField(3)
//    @JsonKey(name: 'variants')
//   final List<BackgroundImageVariant> variants;

//   BackgroundImageData({
//     required this.original,
//     required this.thumbnail,
//     required this.placeholder,
//     required this.variants,
//   });

//   factory BackgroundImageData.fromJson(Map<String, dynamic> json) => 
//     _$BackgroundImageDataFromJson(json);
  
//   Map<String, dynamic> toJson() => _$BackgroundImageDataToJson(this);
// }

// @HiveType(typeId: 20)
// @JsonSerializable()
// class BackgroundImageVariant {
//   @HiveField(0)
//    @JsonKey(name: 'width')
//   final int width;
  
//   @HiveField(1)
//    @JsonKey(name: 'height')
//   final int height;
  
//   @HiveField(2)
//    @JsonKey(name: 'path')
//   final String path;

//   BackgroundImageVariant({
//     required this.width,
//     required this.height,
//     required this.path,
//   });

//   factory BackgroundImageVariant.fromJson(Map<String, dynamic> json) => 
//     _$BackgroundImageVariantFromJson(json);
  
//   Map<String, dynamic> toJson() => _$BackgroundImageVariantToJson(this);
// }

// @HiveType(typeId: 21)
// @JsonSerializable()
// class BackgroundGradientData {
//   @HiveField(0)
//    @JsonKey(name: 'colors')
//   final List<String> colors;
  
//   @HiveField(1)
//    @JsonKey(name: 'type')
//   final String type;
  
//   @HiveField(2)
//    @JsonKey(name: 'angle')
//   final double angle;
  
//   @HiveField(3)
//   @JsonKey(name: 'stops')
//   final List<BackgroundGradientStop> stops;

//   BackgroundGradientData({
//     required this.colors,
//     required this.type,
//     required this.angle,
//     required this.stops,
//   });

//   factory BackgroundGradientData.fromJson(Map<String, dynamic> json) => 
//     _$BackgroundGradientDataFromJson(json);
  
//   Map<String, dynamic> toJson() => _$BackgroundGradientDataToJson(this);
// }

// @HiveType(typeId: 22)
// @JsonSerializable()
// class BackgroundGradientStop {
//   @HiveField(0)
//    @JsonKey(name: 'position')
//   final double position;
  
//   @HiveField(1)
//    @JsonKey(name: 'color')
//   final String color;

//   BackgroundGradientStop({
//     required this.position,
//     required this.color,
//   });

//   factory BackgroundGradientStop.fromJson(Map<String, dynamic> json) => 
//     _$BackgroundGradientStopFromJson(json);
  
//   Map<String, dynamic> toJson() => _$BackgroundGradientStopToJson(this);
// }


// @HiveType(typeId: 23)
// @JsonSerializable()
// class BackgroundColorData {
//   @HiveField(0)
//    @JsonKey(name: 'color')
//   final String color;
  
//   @HiveField(1)
//    @JsonKey(name: 'palette')
//   final BackgroundColorPalette palette;

//   BackgroundColorData({
//     required this.color,
//     required this.palette,
//   });

//   factory BackgroundColorData.fromJson(Map<String, dynamic> json) => 
//     _$BackgroundColorDataFromJson(json);
  
//   Map<String, dynamic> toJson() => _$BackgroundColorDataToJson(this);
// }

// @HiveType(typeId: 24)
// @JsonSerializable()
// class BackgroundColorPalette {
//   @HiveField(0)
//    @JsonKey(name: 'light')
//   final String light;
  
//   @HiveField(1)
//    @JsonKey(name: 'dark')
//   final String dark;

//   BackgroundColorPalette({
//     required this.light,
//     required this.dark,
//   });

//   factory BackgroundColorPalette.fromJson(Map<String, dynamic> json) => 
//     _$BackgroundColorPaletteFromJson(json);
  
//   Map<String, dynamic> toJson() => _$BackgroundColorPaletteToJson(this);
// }

// @HiveType(typeId: 25)
// @JsonSerializable()
// class BackgroundVisualEffects {
//   @HiveField(0)
//    @JsonKey(name: 'opacity')
//   final double opacity;
  
//   @HiveField(1)
//    @JsonKey(name: 'blur')
//   final double blur;
  
//   @HiveField(2)
//    @JsonKey(name: 'blend_mode')
//   final String blendMode;

//   BackgroundVisualEffects({
//     required this.opacity,
//     required this.blur,
//     required this.blendMode,
//   });

//   factory BackgroundVisualEffects.fromJson(Map<String, dynamic> json) => 
//     _$BackgroundVisualEffectsFromJson(json);
  
//   Map<String, dynamic> toJson() => _$BackgroundVisualEffectsToJson(this);
// }

// @HiveType(typeId: 26)
// @JsonSerializable()
// class BackgroundAttribution {
//   @HiveField(0)
//    @JsonKey(name: 'photographer')
//   final String? photographer;
  
//   @HiveField(1)
//    @JsonKey(name: 'license')
//   final String license;
  
//   @HiveField(2)
//    @JsonKey(name: 'url')
//   final String url;

//   BackgroundAttribution({
//     this.photographer,

//     required this.license,
//     required this.url,
//   });

//   factory BackgroundAttribution.fromJson(Map<String, dynamic> json) => 
//     _$BackgroundAttributionFromJson(json);
  
//   Map<String, dynamic> toJson() => _$BackgroundAttributionToJson(this);
// }

// @HiveType(typeId: 27)
// @JsonSerializable()
// class BackgroundOptimization {
//   @HiveField(0)
//    @JsonKey(name: 'formats')
//   final List<String> formats;
  
//   @HiveField(1)
//    @JsonKey(name: 'quality')
//   final int quality;
  
//   @HiveField(2)
//    @JsonKey(name: 'placeholder')
//   final String placeholder;

//   BackgroundOptimization({
//     required this.formats,
//     required this.quality,
//     required this.placeholder,
//   });

//   factory BackgroundOptimization.fromJson(Map<String, dynamic> json) => 
//     _$BackgroundOptimizationFromJson(json);
  
//   Map<String, dynamic> toJson() => _$BackgroundOptimizationToJson(this);
// }

// @HiveType(typeId: 28)
// @JsonSerializable()
// class CacheConfig {
//   @HiveField(0)
//   @JsonKey(name: 'ttl_seconds')
//   final int ttlSeconds;
  
//   @HiveField(1)
//   @JsonKey(name: 'priority')
//   final String priority;
  
//   @HiveField(2)
//   @JsonKey(name: 'preload')
//   final bool preload;

//   CacheConfig({
//     required this.ttlSeconds,
//     required this.priority,
//     required this.preload,
//   });

//   factory CacheConfig.fromJson(Map<String, dynamic> json) => 
//     _$CacheConfigFromJson(json);
  
//   Map<String, dynamic> toJson() => _$CacheConfigToJson(this);
// }

// class Audit {
//   @HiveField(0)
//    @JsonKey(name: 'created_at')
//   final DateTime createdAt;
  
//   @HiveField(1)
//    @JsonKey(name: 'created_by')
//   final String createdBy;
  
//   @HiveField(2)
//    @JsonKey(name: 'modified_at')
//   final DateTime modifiedAt;
  
//   @HiveField(3)
//    @JsonKey(name: 'modified_by')
//   final String modifiedBy;
  
//   @HiveField(4)
//    @JsonKey(name: 'version')
//   final int version;

//   Audit({
//     required this.createdAt,
//     required this.createdBy,
//     required this.modifiedAt,
//     required this.modifiedBy,
//     required this.version,
//   });

//   factory Audit.fromJson(Map<String, dynamic> json) => 
//     _$AuditFromJson(json);
  
//   Map<String, dynamic> toJson() => _$AuditToJson(this);
// }
