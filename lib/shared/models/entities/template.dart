import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../analytics/audit.dart';
import '../analytics/metrics.dart';
import '../layout/layout_config.dart';
import '../style/style_colors.dart';
import '../style/typography.dart';

part 'template.g.dart';

@HiveType(typeId: 77)
@JsonSerializable()
class TemplateCollection {
  @HiveField(0)
   @JsonKey(name: 'data')
  final List<Template> data;

  TemplateCollection({
    required this.data,
  });

  factory TemplateCollection.fromJson(Map<String, dynamic> json) => 
    _$TemplateCollectionFromJson(json);
  
  Map<String, dynamic> toJson() => _$TemplateCollectionToJson(this);
}

@HiveType(typeId: 29)
@JsonSerializable()
class Template {
  @HiveField(0)
   @JsonKey(name: 'uuid')
  final String uuid;
  
  @HiveField(1)
   @JsonKey(name: 'translations')
  final Map<String, TemplateTranslation> translations;
  
  @HiveField(2)
   @JsonKey(name: 'composition')
  final Composition composition;
  
  @HiveField(3)
   @JsonKey(name: 'layout_config')
  final LayoutConfig layoutConfig;
  
  @HiveField(4)
   @JsonKey(name: 'style_config')
  final StyleConfig styleConfig;
  
  @HiveField(5)
   @JsonKey(name: 'category_ids')
  final List<String> categoryIds;
  
  @HiveField(6)
   @JsonKey(name: 'tag_ids')
  final List<String> tagIds;
  
  @HiveField(7)
   @JsonKey(name: 'metadata')
  final TemplateMetadata metadata;
  
  @HiveField(8)
   @JsonKey(name: 'metrics')
  final Metrics metrics;
  
  @HiveField(9)
  @JsonKey(name: 'audit')
  final Audit audit;

  Template({
    required this.uuid,
    required this.translations,
    required this.composition,
    required this.layoutConfig,
    required this.styleConfig,
    required this.categoryIds,
    required this.tagIds,
    required this.metadata,
    required this.metrics,
    required this.audit,
  });

  factory Template.fromJson(Map<String, dynamic> json) => 
    _$TemplateFromJson(json);
  
  Map<String, dynamic> toJson() => _$TemplateToJson(this);
}

@HiveType(typeId: 30)
@JsonSerializable()
class TemplateTranslation {
  @HiveField(0)
   @JsonKey(name: 'title')
  final String title;
  
  @HiveField(1)
   @JsonKey(name: 'description')
  final String description;
  
  @HiveField(2)
   @JsonKey(name: 'greeting')
  final String greeting;
  
  @HiveField(3)
   @JsonKey(name: 'semantic_label')
  final String semanticLabel;

  TemplateTranslation({
    required this.title,
    required this.description,
    required this.greeting,
    required this.semanticLabel,
  });

  factory TemplateTranslation.fromJson(Map<String, dynamic> json) => 
    _$TemplateTranslationFromJson(json);
  
  Map<String, dynamic> toJson() => _$TemplateTranslationToJson(this);
}

@HiveType(typeId: 31)
@JsonSerializable()
class Composition {
  @HiveField(0)
   @JsonKey(name: 'background_id')
  final String backgroundId;
  
  @HiveField(1)
   @JsonKey(name: 'quote_id')
  final String quoteId;
  
  @HiveField(2)
   @JsonKey(name: 'layout')
  final String layout;
  
  @HiveField(3)
   @JsonKey(name: 'aspect_ratio')
  final String aspectRatio;

  Composition({
    required this.backgroundId,
    required this.quoteId,
    required this.layout,
    required this.aspectRatio,
  });

  factory Composition.fromJson(Map<String, dynamic> json) => 
      _$CompositionFromJson(json);
  
  Map<String, dynamic> toJson() => _$CompositionToJson(this);
}

@HiveType(typeId: 38)
@JsonSerializable()
class StyleConfig {
  @HiveField(0)
  @JsonKey(name: 'greeting')
  final ElementStyle greeting;

  @HiveField(1)
  @JsonKey(name: 'quote')
  final ElementStyle? quote;

  StyleConfig({
    required this.greeting,
    this.quote
  });

  factory StyleConfig.fromJson(Map<String, dynamic> json) => 
    _$StyleConfigFromJson(json);
  
  Map<String, dynamic> toJson() => _$StyleConfigToJson(this);
}

@HiveType(typeId: 39)
@JsonSerializable()
class ElementStyle {
  @HiveField(0)
   @JsonKey(name: 'typography')
  final Typography typography;
  
  @HiveField(1)
   @JsonKey(name: 'colors')
  final StyleColors colors;

  ElementStyle({
    required this.typography,
    required this.colors,
  });

  factory ElementStyle.fromJson(Map<String, dynamic> json) => 
    _$ElementStyleFromJson(json);
  
  Map<String, dynamic> toJson() => _$ElementStyleToJson(this);
}

@HiveType(typeId: 40)
@JsonSerializable()
class TemplateMetadata {
  @HiveField(0)
   @JsonKey(name: 'is_premium')
  final bool isPremium;
  
  @HiveField(1)
   @JsonKey(name: 'status')
  final String status;
  
  @HiveField(2)
  @JsonKey(name: 'version')
  final int version;

  TemplateMetadata({
    required this.isPremium,
    required this.status,
    required this.version,
  });

  factory TemplateMetadata.fromJson(Map<String, dynamic> json) => 
    _$TemplateMetadataFromJson(json);
  
  Map<String, dynamic> toJson() => _$TemplateMetadataToJson(this);
}
