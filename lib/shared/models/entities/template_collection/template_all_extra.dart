// @HiveType(typeId: 79)
// @JsonSerializable()
// class TemplateCollection {
//   @HiveField(0)
//   @JsonKey(name: 'data')
//   final List<Template> data;

//   TemplateCollection({
//     required this.data,
//   });

//   factory TemplateCollection.fromJson(Map<String, dynamic> json) => _$TemplateCollectionFromJson(json);
//   Map<String, dynamic> toJson() => _$TemplateCollectionToJson(this);
// }

// @HiveType(typeId: 29)
// @JsonSerializable()
// class Template {
//   @HiveField(0)
//   @JsonKey(name: 'uuid')
//   final String uuid;

//   @HiveField(1)
//   @JsonKey(name: 'translations')
//   final Map<String, TemplateTranslation> translations;

//   @HiveField(2)
//   @JsonKey(name: 'composition')
//   final Composition composition;

//   @HiveField(3)
//   @JsonKey(name: 'layout_config')
//   final LayoutConfig layoutConfig;

//   @HiveField(4)
//   @JsonKey(name: 'style_config')
//   final StyleConfig styleConfig;

//   @HiveField(5)
//   @JsonKey(name: 'responsive_config')
//   final ResponsiveConfig responsiveConfig;

//   @HiveField(6)
//   @JsonKey(name: 'category_ids')
//   final List<String> categoryIds;

//   @HiveField(7)
//   @JsonKey(name: 'tag_ids')
//   final List<String> tagIds;

//   @HiveField(8)
//   @JsonKey(name: 'metadata')
//   final TemplateMetadata metadata;

//   @HiveField(9)
//   @JsonKey(name: 'metrics')
//   final Metrics metrics;

//   @HiveField(10)
//   @JsonKey(name: 'audit')
//   final Audit audit;

//   Template({
//     required this.uuid,
//     required this.translations,
//     required this.composition,
//     required this.layoutConfig,
//     required this.styleConfig,
//     required this.responsiveConfig,
//     required this.categoryIds,
//     required this.tagIds,
//     required this.metadata,
//     required this.metrics,
//     required this.audit,
//   });

//   factory Template.fromJson(Map<String, dynamic> json) => _$TemplateFromJson(json);

//   Map<String, dynamic> toJson() => _$TemplateToJson(this);

// }


// @HiveType(typeId: 30)
// @JsonSerializable()
// class TemplateTranslation {
//   @HiveField(0)
//   @JsonKey(name: 'title')
//   final String title;
  
//   @HiveField(1)
//   @JsonKey(name: 'description')
//   final String description;
  
//   @HiveField(2)
//   @JsonKey(name: 'greeting')
//   final String greeting;
  
//   @HiveField(3)
//   @JsonKey(name: 'semantic_label')
//   final String semanticLabel;

//   TemplateTranslation({
//     required this.title,
//     required this.description,
//     required this.greeting,
//     required this.semanticLabel,
//   });

//   factory TemplateTranslation.fromJson(Map<String, dynamic> json) => _$TemplateTranslationFromJson(json);
//   Map<String, dynamic> toJson() => _$TemplateTranslationToJson(this);
// }

// @HiveType(typeId: 31)
// @JsonSerializable()
// class Composition {
//   @HiveField(0)
//   @JsonKey(name: 'background_id')
//   final String backgroundId;
  
//   @HiveField(1)
//   @JsonKey(name: 'quote_id')
//   final String quoteId;
  
//   @HiveField(2)
//   @JsonKey(name: 'layout')
//   final String layout;
  
//   @HiveField(3)
//   @JsonKey(name: 'aspect_ratio')
//   final String aspectRatio;

//   Composition({
//     required this.backgroundId,
//     required this.quoteId,
//     required this.layout,
//     required this.aspectRatio,
//   });

//   factory Composition.fromJson(Map<String, dynamic> json) => _$CompositionFromJson(json);
//   Map<String, dynamic> toJson() => _$CompositionToJson(this);
// }
