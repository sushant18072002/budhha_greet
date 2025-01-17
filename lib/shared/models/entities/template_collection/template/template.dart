import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../analytics/audit.dart';
import 'layout_config/layout_config.dart';
import 'template_metrics/template_metrics.dart';
import 'responsive_config/responsive_config.dart';
import 'style_config/style_config.dart';
import 'template_composition/template_composition.dart';
import 'template_metadata/template_metadata.dart';
import 'template_translation/template_translation.dart';

export '../../../analytics/audit.dart';
export 'layout_config/layout_config.dart';
export 'template_metrics/template_metrics.dart';
export 'responsive_config/responsive_config.dart';
export 'style_config/style_config.dart';
export 'template_composition/template_composition.dart';
export 'template_metadata/template_metadata.dart';
export 'template_translation/template_translation.dart';

part 'template.g.dart';

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
  final TemplateComposition composition;

  @HiveField(3)
  @JsonKey(name: 'layout_config')
  final LayoutConfig? layoutConfig;

  @HiveField(4)
  @JsonKey(name: 'style_config')
  final StyleConfig? styleConfig;

  @HiveField(5)
  @JsonKey(name: 'responsive_config')
  final ResponsiveConfig? responsiveConfig;

  @HiveField(6)
  @JsonKey(name: 'category_ids')
  final List<String> categoryIds;

  @HiveField(7)
  @JsonKey(name: 'tag_ids')
  final List<String> tagIds;

  @HiveField(8)
  @JsonKey(name: 'metadata')
  final TemplateMetadata metadata;

  @HiveField(9)
  @JsonKey(name: 'metrics')
  final TemplateMetrics? metrics;

  @HiveField(10)
  @JsonKey(name: 'audit')
  final Audit? audit;

  Template({
    required this.uuid,
    required this.translations,
    required this.composition,
    required this.layoutConfig,
    required this.styleConfig,
    required this.responsiveConfig,
    required this.categoryIds,
    required this.tagIds,
    required this.metadata,
    required this.metrics,
    required this.audit,
  });

  // Factory constructor for creating a Template object from JSON
  factory Template.fromJson(Map<String, dynamic> json) => _$TemplateFromJson(json);

  // Method to convert a Template object to JSON
  Map<String, dynamic> toJson() => _$TemplateToJson(this);

}