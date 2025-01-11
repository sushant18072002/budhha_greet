// import 'package:hive/hive.dart';
// import 'package:json_annotation/json_annotation.dart';

// import 'models/analytics/audit.dart';
// import 'package:hive/hive.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'audit.g.dart';

// @HiveType(typeId: 17)
// @JsonSerializable()
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

// import 'models/analytics/metrics.dart';
// import 'package:hive/hive.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'metrics.g.dart';

// @HiveType(typeId: 16)
// @JsonSerializable()
// class Metrics {
//   @HiveField(0)
//   @JsonKey(name: 'views')
//   final int views;
  
//   @HiveField(1)
//   @JsonKey(name: 'shares')
//   final int shares;
  
//   @HiveField(2)
//   @JsonKey(name: 'favorites')
//   final int favorites;
  
//   @HiveField(3)
//   @JsonKey(name: 'last_interaction')
//   final DateTime? lastInteraction;

//   Metrics({
//     required this.views,
//     required this.shares,
//     required this.favorites,
//     this.lastInteraction,
//   });

//   factory Metrics.fromJson(Map<String, dynamic> json) => 
//     _$MetricsFromJson(json);
  
//   Map<String, dynamic> toJson() => _$MetricsToJson(this);
// }

// import 'models/layout/layout_config.dart';

// import 'package:hive/hive.dart';
// import 'package:json_annotation/json_annotation.dart';

// import 'orientation_layout.dart';
// import 'package:hive/hive.dart';
// import 'package:json_annotation/json_annotation.dart';

// import 'element_layout.dart';
// import 'package:buddha_greet/shared/models/layout/safe_area.dart';

// import 'package:hive/hive.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'safe_area.g.dart';

// @HiveType(typeId: 37)
// @JsonSerializable()
// class SafeArea {
//   @HiveField(0)
//   @JsonKey(name: 'top')
//   final double top;
  
//   @HiveField(1)
//   @JsonKey(name: 'bottom')
//   final double bottom;

//   SafeArea({
//     required this.top,
//     required this.bottom,
//   });

//   factory SafeArea.fromJson(Map<String, dynamic> json) => 
//     _$SafeAreaFromJson(json);
  
//   Map<String, dynamic> toJson() => _$SafeAreaToJson(this);
// }

// import 'package:buddha_greet/shared/models/layout/size.dart';
// import 'package:hive/hive.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'size.g.dart';

// @HiveType(typeId: 36)
// @JsonSerializable()
// class Size {
//   @HiveField(0)
//   @JsonKey(name: 'width')
//   final double width;
  
//   @HiveField(1)
//   @JsonKey(name: 'height')
//   final double height;

//   Size({
//     required this.width,
//     required this.height,
//   });

//   factory Size.fromJson(Map<String, dynamic> json) => 
//     _$SizeFromJson(json);
  
//   Map<String, dynamic> toJson() => _$SizeToJson(this);
// }



// import 'package:hive/hive.dart';
// import 'package:json_annotation/json_annotation.dart';

// import 'position.dart';
// import 'package:hive/hive.dart';
// import 'package:json_annotation/json_annotation.dart';


// part 'position.g.dart';

// @HiveType(typeId: 35)
// @JsonSerializable()
// class Position {
//   @HiveField(0)
//   @JsonKey(name: 'x')
//   final double x;
  
//   @HiveField(1)
//   @JsonKey(name: 'y')
//   final double y;

//   Position({
//     required this.x,
//     required this.y,
//   });

//   factory Position.fromJson(Map<String, dynamic> json) => 
//     _$PositionFromJson(json);
  
//   Map<String, dynamic> toJson() => _$PositionToJson(this);
// }


// part 'element_layout.g.dart';

// @HiveType(typeId: 34)
// @JsonSerializable()
// class ElementLayout {
//   @HiveField(0)
//   @JsonKey(name: 'position')
//   final Position position;
  
//   @HiveField(1)
//   @JsonKey(name: 'size')
//   final Size size;
  
//   @HiveField(2)
//   @JsonKey(name: 'padding')
//   final double padding;
  
//   @HiveField(3)
//   @JsonKey(name: 'safe_area')
//   final SafeArea? safeArea;

//   ElementLayout({
//     required this.position,
//     required this.size,
//     required this.padding,
//     this.safeArea,
//   });

//   factory ElementLayout.fromJson(Map<String, dynamic> json) => 
//     _$ElementLayoutFromJson(json);
  
//   Map<String, dynamic> toJson() => _$ElementLayoutToJson(this);
// }



// part 'orientation_layout.g.dart';

// @HiveType(typeId: 33)
// @JsonSerializable()
// class OrientationLayout {
//   @HiveField(0)
//   @JsonKey(name: 'title')
//   final ElementLayout title;
  
//   @HiveField(1)
//   @JsonKey(name: 'quote')
//   final ElementLayout quote;

//   OrientationLayout({
//     required this.title,
//     required this.quote,
//   });

//   factory OrientationLayout.fromJson(Map<String, dynamic> json) => 
//     _$OrientationLayoutFromJson(json);
  
//   Map<String, dynamic> toJson() => _$OrientationLayoutToJson(this);
// }



// part 'layout_config.g.dart';

// @HiveType(typeId: 32)
// @JsonSerializable()
// class LayoutConfig {
//   @HiveField(0)
//   @JsonKey(name: 'responsive')
//   final bool responsive;
  
//   @HiveField(1)
//   @JsonKey(name: 'portrait')
//   final OrientationLayout portrait;
  
//   @HiveField(2)
//   @JsonKey(name: 'landscape')
//   final OrientationLayout landscape;

//   LayoutConfig({
//     required this.responsive,
//     required this.portrait,
//     required this.landscape,
//   });

//   factory LayoutConfig.fromJson(Map<String, dynamic> json) => 
//     _$LayoutConfigFromJson(json);
  
//   Map<String, dynamic> toJson() => _$LayoutConfigToJson(this);
// }


// import 'models/style/style_colors.dart';
// import 'models/style/typography.dart';

// part 'template.g.dart';

// @HiveType(typeId: 79)
// @JsonSerializable()
// class TemplateCollection {
//   @HiveField(0)
//    @JsonKey(name: 'data')
//   final List<Template> data;

//   TemplateCollection({
//     required this.data,
//   });

//   factory TemplateCollection.fromJson(Map<String, dynamic> json) => 
//     _$TemplateCollectionFromJson(json);
  
//   Map<String, dynamic> toJson() => _$TemplateCollectionToJson(this);
// }

// @HiveType(typeId: 29)
// @JsonSerializable()
// class Template {
//   @HiveField(0)
//    @JsonKey(name: 'uuid')
//   final String uuid;
  
//   @HiveField(1)
//    @JsonKey(name: 'translations')
//   final Map<String, TemplateTranslation> translations;
  
//   @HiveField(2)
//    @JsonKey(name: 'composition')
//   final Composition composition;
  
//   @HiveField(3)
//    @JsonKey(name: 'layout_config')
//   final LayoutConfig layoutConfig;
  
//   @HiveField(4)
//    @JsonKey(name: 'style_config')
//   final StyleConfig styleConfig;
  
//   @HiveField(5)
//    @JsonKey(name: 'category_ids')
//   final List<String> categoryIds;
  
//   @HiveField(6)
//    @JsonKey(name: 'tag_ids')
//   final List<String> tagIds;
  
//   @HiveField(7)
//    @JsonKey(name: 'metadata')
//   final TemplateMetadata metadata;
  
//   @HiveField(8)
//    @JsonKey(name: 'metrics')
//   final Metrics metrics;
  
//   @HiveField(9)
//   @JsonKey(name: 'audit')
//   final Audit audit;

//   Template({
//     required this.uuid,
//     required this.translations,
//     required this.composition,
//     required this.layoutConfig,
//     required this.styleConfig,
//     required this.categoryIds,
//     required this.tagIds,
//     required this.metadata,
//     required this.metrics,
//     required this.audit,
//   });

//   factory Template.fromJson(Map<String, dynamic> json) => 
//     _$TemplateFromJson(json);
  
//   Map<String, dynamic> toJson() => _$TemplateToJson(this);
// }

// @HiveType(typeId: 30)
// @JsonSerializable()
// class TemplateTranslation {
//   @HiveField(0)
//    @JsonKey(name: 'title')
//   final String title;
  
//   @HiveField(1)
//    @JsonKey(name: 'description')
//   final String description;
  
//   @HiveField(2)
//    @JsonKey(name: 'greeting')
//   final String greeting;
  
//   @HiveField(3)
//    @JsonKey(name: 'semantic_label')
//   final String semanticLabel;

//   TemplateTranslation({
//     required this.title,
//     required this.description,
//     required this.greeting,
//     required this.semanticLabel,
//   });

//   factory TemplateTranslation.fromJson(Map<String, dynamic> json) => 
//     _$TemplateTranslationFromJson(json);
  
//   Map<String, dynamic> toJson() => _$TemplateTranslationToJson(this);
// }

// @HiveType(typeId: 31)
// @JsonSerializable()
// class Composition {
//   @HiveField(0)
//    @JsonKey(name: 'background_id')
//   final String backgroundId;
  
//   @HiveField(1)
//    @JsonKey(name: 'quote_id')
//   final String quoteId;
  
//   @HiveField(2)
//    @JsonKey(name: 'layout')
//   final String layout;
  
//   @HiveField(3)
//    @JsonKey(name: 'aspect_ratio')
//   final String aspectRatio;

//   Composition({
//     required this.backgroundId,
//     required this.quoteId,
//     required this.layout,
//     required this.aspectRatio,
//   });

//   factory Composition.fromJson(Map<String, dynamic> json) => 
//       _$CompositionFromJson(json);
  
//   Map<String, dynamic> toJson() => _$CompositionToJson(this);
// }

// @HiveType(typeId: 38)
// @JsonSerializable()
// class StyleConfig {
//   @HiveField(0)
//   @JsonKey(name: 'title')
//   final ElementStyle title;

//   @HiveField(1)
//   @JsonKey(name: 'quote')
//   final ElementStyle? quote;

//   StyleConfig({
//     required this.title,
//     this.quote
//   });

//   factory StyleConfig.fromJson(Map<String, dynamic> json) => 
//     _$StyleConfigFromJson(json);
  
//   Map<String, dynamic> toJson() => _$StyleConfigToJson(this);
// }

// @HiveType(typeId: 39)
// @JsonSerializable()
// class ElementStyle {
//   @HiveField(0)
//    @JsonKey(name: 'typography')
//   final Typography typography;
  
//   @HiveField(1)
//    @JsonKey(name: 'colors')
//   final StyleColors colors;

//   ElementStyle({
//     required this.typography,
//     required this.colors,
//   });

//   factory ElementStyle.fromJson(Map<String, dynamic> json) => 
//     _$ElementStyleFromJson(json);
  
//   Map<String, dynamic> toJson() => _$ElementStyleToJson(this);
// }

// @HiveType(typeId: 40)
// @JsonSerializable()
// class TemplateMetadata {
//   @HiveField(0)
//    @JsonKey(name: 'is_premium')
//   final bool isPremium;
  
//   @HiveField(1)
//    @JsonKey(name: 'status')
//   final String status;
  
//   @HiveField(2)
//   @JsonKey(name: 'version')
//   final int version;

//   TemplateMetadata({
//     required this.isPremium,
//     required this.status,
//     required this.version,
//   });

//   factory TemplateMetadata.fromJson(Map<String, dynamic> json) => 
//     _$TemplateMetadataFromJson(json);
  
//   Map<String, dynamic> toJson() => _$TemplateMetadataToJson(this);
// }
