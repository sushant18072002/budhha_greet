// // // audit.dart
// // import 'package:hive/hive.dart';
// // import 'package:json_annotation/json_annotation.dart';

// // part 'audit.g.dart';

// // @HiveType(typeId: 17)
// // @JsonSerializable()
// // class Audit {
// //   @HiveField(0)
// //   @JsonKey(name: 'created_at')
// //   final DateTime createdAt;
  
// //   @HiveField(1)
// //   @JsonKey(name: 'created_by')
// //   final String createdBy;
  
// //   @HiveField(2)
// //   @JsonKey(name: 'modified_at')
// //   final DateTime modifiedAt;
  
// //   @HiveField(3)
// //   @JsonKey(name: 'modified_by')
// //   final String modifiedBy;
  
// //   @HiveField(4)
// //   @JsonKey(name: 'version')
// //   final int version;

// //   Audit({
// //     required this.createdAt,
// //     required this.createdBy,
// //     required this.modifiedAt,
// //     required this.modifiedBy,
// //     required this.version,
// //   });

// //   factory Audit.fromJson(Map<String, dynamic> json) => _$AuditFromJson(json);
// //   Map<String, dynamic> toJson() => _$AuditToJson(this);
// // }

// // metrics.dart


// // layout/safe_area.dart

// // layout/size.dart

// // layout/position.dart

// // New Models Starting from ID 80

// // visual_effects/blur.dart

// // visual_effects/blur_sigma.dart

// // visual_effects/sigma_value.dart

// // visual_effects/border_radius.dart


// // visual_effects/background.dart

// // visual_effects/opacity_config.dart

// // style/visual_effects.dart

// // style/element_layout.dart

// // style/layout_config.dart


// // style/common_style.dart


// // style/gradient_overlay.dart


// // style/gradient_stop.dart


// // style/animations.dart

// // style/hover_animation.dart



// // style/typography.dart

// // style/font_size.dart

// // style/style_colors.dart


// // style/shadow.dart
// @HiveType(typeId: 96)
// @JsonSerializable()
// class Shadow {
//   @HiveField(0)
//   @JsonKey(name: 'color')
//   final String color;
  
//   @HiveField(1)
//   @JsonKey(name: 'offset')
//   final Position offset;
  
//   @HiveField(2)
//   @JsonKey(name: 'blur_radius')
//   final double blurRadius;
  
//   @HiveField(3)
//   @JsonKey(name: 'opacity')
//   final double opacity;

//   Shadow({
//     required this.color,
//     required this.offset,
//     required this.blurRadius,
//     required this.opacity,
//   });

//   factory Shadow.fromJson(Map<String, dynamic> json) => _$ShadowFromJson(json);
//   Map<String, dynamic> toJson() => _$ShadowToJson(this);
// }

// // style/action_buttons.dart

// // Updated StyleConfig to include all components from JSON

// // layout/layout_adjustments.dart

// // layout/layout_spacing.dart

// // layout/layout_alignment.dart


// // layout/layout_constraints.dart


// // layout/max_width.dart


// // layout/min_height.dart

// // Updated LayoutConfig to include all components from JSON

// // responsive/grid_config.dart
// @HiveType(typeId: 104)
// @JsonSerializable()
// class GridConfig {
//   @HiveField(0)
//   @JsonKey(name: 'spacing')
//   final GridSpacing spacing;
  
//   @HiveField(1)
//   @JsonKey(name: 'columns')
//   final GridColumns columns;

//   GridConfig({
//     required this.spacing,
//     required this.columns,
//   });

//   factory GridConfig.fromJson(Map<String, dynamic> json) => _$GridConfigFromJson(json);
//   Map<String, dynamic> toJson() => _$GridConfigToJson(this);
// }

// // responsive/grid_spacing.dart
// @HiveType(typeId: 105)
// @JsonSerializable()
// class GridSpacing {
//   @HiveField(0)
//   @JsonKey(name: 'small')
//   final double small;
  
//   @HiveField(1)
//   @JsonKey(name: 'medium')
//   final double medium;
  
//   @HiveField(2)
//   @JsonKey(name: 'large')
//   final double large;

//   GridSpacing({
//     required this.small,
//     required this.medium,
//     required this.large,
//   });

//   factory GridSpacing.fromJson(Map<String, dynamic> json) => _$GridSpacingFromJson(json);
//   Map<String, dynamic> toJson() => _$GridSpacingToJson(this);
// }

// // responsive/grid_columns.dart
// @HiveType(typeId: 106)
// @JsonSerializable()
// class GridColumns {
//   @HiveField(0)
//   @JsonKey(name: 'small')
//   final int small;
  
//   @HiveField(1)
//   @JsonKey(name: 'medium')
//   final int medium;
  
//   @HiveField(2)
//   @JsonKey(name: 'large')
//   final int large;
  
//   @HiveField(3)
//   @JsonKey(name: 'xlarge')
//   final int xlarge;

//   GridColumns({
//     required this.small,
//     required this.medium,
//     required this.large,
//     required this.xlarge,
//   });

//   factory GridColumns.fromJson(Map<String, dynamic> json) => _$GridColumnsFromJson(json);
//   Map<String, dynamic> toJson() => _$GridColumnsToJson(this);
// }





// // Root collection class
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

// // Responsive breakpoint configuration


