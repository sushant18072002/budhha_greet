// // audit.dart
// import 'package:hive/hive.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'audit.g.dart';

// @HiveType(typeId: 17)
// @JsonSerializable()
// class Audit {
//   @HiveField(0)
//   @JsonKey(name: 'created_at')
//   final DateTime createdAt;
  
//   @HiveField(1)
//   @JsonKey(name: 'created_by')
//   final String createdBy;
  
//   @HiveField(2)
//   @JsonKey(name: 'modified_at')
//   final DateTime modifiedAt;
  
//   @HiveField(3)
//   @JsonKey(name: 'modified_by')
//   final String modifiedBy;
  
//   @HiveField(4)
//   @JsonKey(name: 'version')
//   final int version;

//   Audit({
//     required this.createdAt,
//     required this.createdBy,
//     required this.modifiedAt,
//     required this.modifiedBy,
//     required this.version,
//   });

//   factory Audit.fromJson(Map<String, dynamic> json) => _$AuditFromJson(json);
//   Map<String, dynamic> toJson() => _$AuditToJson(this);
// }

// // metrics.dart
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
//   @JsonKey(name: 'last_used')
//   final DateTime? lastUsed;

//   Metrics({
//     required this.views,
//     required this.shares,
//     required this.favorites,
//     this.lastUsed,
//   });

//   factory Metrics.fromJson(Map<String, dynamic> json) => _$MetricsFromJson(json);
//   Map<String, dynamic> toJson() => _$MetricsToJson(this);
// }

// // layout/safe_area.dart
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

//   factory SafeArea.fromJson(Map<String, dynamic> json) => _$SafeAreaFromJson(json);
//   Map<String, dynamic> toJson() => _$SafeAreaToJson(this);
// }

// // layout/size.dart
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

//   factory Size.fromJson(Map<String, dynamic> json) => _$SizeFromJson(json);
//   Map<String, dynamic> toJson() => _$SizeToJson(this);
// }

// // layout/position.dart
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

//   factory Position.fromJson(Map<String, dynamic> json) => _$PositionFromJson(json);
//   Map<String, dynamic> toJson() => _$PositionToJson(this);
// }

// // New Models Starting from ID 80

// // visual_effects/blur.dart
// @HiveType(typeId: 80)
// @JsonSerializable()
// class Blur {
//   @HiveField(0)
//   @JsonKey(name: 'enabled')
//   final bool enabled;
  
//   @HiveField(1)
//   @JsonKey(name: 'sigma')
//   final BlurSigma sigma;
  
//   @HiveField(2)
//   @JsonKey(name: 'quality')
//   final String quality;

//   Blur({
//     required this.enabled,
//     required this.sigma,
//     required this.quality,
//   });

//   factory Blur.fromJson(Map<String, dynamic> json) => _$BlurFromJson(json);
//   Map<String, dynamic> toJson() => _$BlurToJson(this);
// }

// // visual_effects/blur_sigma.dart
// @HiveType(typeId: 81)
// @JsonSerializable()
// class BlurSigma {
//   @HiveField(0)
//   @JsonKey(name: 'x')
//   final SigmaValue x;
  
//   @HiveField(1)
//   @JsonKey(name: 'y')
//   final SigmaValue y;

//   BlurSigma({
//     required this.x,
//     required this.y,
//   });

//   factory BlurSigma.fromJson(Map<String, dynamic> json) => _$BlurSigmaFromJson(json);
//   Map<String, dynamic> toJson() => _$BlurSigmaToJson(this);
// }

// // visual_effects/sigma_value.dart
// @HiveType(typeId: 82)
// @JsonSerializable()
// class SigmaValue {
//   @HiveField(0)
//   @JsonKey(name: 'base')
//   final double base;
  
//   @HiveField(1)
//   @JsonKey(name: 'min')
//   final double min;
  
//   @HiveField(2)
//   @JsonKey(name: 'max')
//   final double max;

//   SigmaValue({
//     required this.base,
//     required this.min,
//     required this.max,
//   });

//   factory SigmaValue.fromJson(Map<String, dynamic> json) => _$SigmaValueFromJson(json);
//   Map<String, dynamic> toJson() => _$SigmaValueToJson(this);
// }

// // visual_effects/border_radius.dart
// @HiveType(typeId: 83)
// @JsonSerializable()
// class BorderRadius {
//   @HiveField(0)
//   @JsonKey(name: 'base')
//   final double base;
  
//   @HiveField(1)
//   @JsonKey(name: 'min')
//   final double min;
  
//   @HiveField(2)
//   @JsonKey(name: 'max')
//   final double max;
  
//   @HiveField(3)
//   @JsonKey(name: 'scale_factor')
//   final double scaleFactor;

//   BorderRadius({
//     required this.base,
//     required this.min,
//     required this.max,
//     required this.scaleFactor,
//   });

//   factory BorderRadius.fromJson(Map<String, dynamic> json) => _$BorderRadiusFromJson(json);
//   Map<String, dynamic> toJson() => _$BorderRadiusToJson(this);
// }

// // visual_effects/background.dart
// @HiveType(typeId: 84)
// @JsonSerializable()
// class Background {
//   @HiveField(0)
//   @JsonKey(name: 'opacity')
//   final OpacityConfig opacity;
  
//   @HiveField(1)
//   @JsonKey(name: 'color')
//   final String color;

//   Background({
//     required this.opacity,
//     required this.color,
//   });

//   factory Background.fromJson(Map<String, dynamic> json) => _$BackgroundFromJson(json);
//   Map<String, dynamic> toJson() => _$BackgroundToJson(this);
// }

// // visual_effects/opacity_config.dart
// @HiveType(typeId: 85)
// @JsonSerializable()
// class OpacityConfig {
//   @HiveField(0)
//   @JsonKey(name: 'base')
//   final double base;
  
//   @HiveField(1)
//   @JsonKey(name: 'min')
//   final double min;
  
//   @HiveField(2)
//   @JsonKey(name: 'max')
//   final double max;

//   OpacityConfig({
//     required this.base,
//     required this.min,
//     required this.max,
//   });

//   factory OpacityConfig.fromJson(Map<String, dynamic> json) => _$OpacityConfigFromJson(json);
//   Map<String, dynamic> toJson() => _$OpacityConfigToJson(this);
// }

// // style/visual_effects.dart
// @HiveType(typeId: 86)
// @JsonSerializable()
// class VisualEffects {
//   @HiveField(0)
//   @JsonKey(name: 'blur')
//   final Blur blur;
  
//   @HiveField(1)
//   @JsonKey(name: 'border_radius')
//   final BorderRadius borderRadius;
  
//   @HiveField(2)
//   @JsonKey(name: 'background')
//   final Background background;

//   VisualEffects({
//     required this.blur,
//     required this.borderRadius,
//     required this.background,
//   });

//   factory VisualEffects.fromJson(Map<String, dynamic> json) => _$VisualEffectsFromJson(json);
//   Map<String, dynamic> toJson() => _$VisualEffectsToJson(this);
// }

// // style/element_layout.dart
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
  
//   @HiveField(4)
//   @JsonKey(name: 'visual_effects')
//   final VisualEffects visualEffects;

//   ElementLayout({
//     required this.position,
//     required this.size,
//     required this.padding,
//     this.safeArea,
//     required this.visualEffects,
//   });

//   factory ElementLayout.fromJson(Map<String, dynamic> json) => _$ElementLayoutFromJson(json);
//   Map<String, dynamic> toJson() => _$ElementLayoutToJson(this);
// }

// // style/layout_config.dart
// @HiveType(typeId: 87)
// @JsonSerializable()
// class LayoutBreakpoints {
//   @HiveField(0)
//   @JsonKey(name: 'small')
//   final int small;
  
//   @HiveField(1)
//   @JsonKey(name: 'medium')
//   final int medium;
  
//   @HiveField(2)
//   @JsonKey(name: 'large')
//   final int large;

//   LayoutBreakpoints({
//     required this.small,
//     required this.medium,
//     required this.large,
//   });

//   factory LayoutBreakpoints.fromJson(Map<String, dynamic> json) => _$LayoutBreakpointsFromJson(json);
//   Map<String, dynamic> toJson() => _$LayoutBreakpointsToJson(this);
// }

// // style/common_style.dart
// @HiveType(typeId: 88)
// @JsonSerializable()
// class CommonStyle {
//   @HiveField(0)
//   @JsonKey(name: 'gradient_overlay')
//   final GradientOverlay gradientOverlay;
  
//   @HiveField(1)
//   @JsonKey(name: 'animations')
//   final Animations animations;

//   CommonStyle({
//     required this.gradientOverlay,
//     required this.animations,
//   });

//   factory CommonStyle.fromJson(Map<String, dynamic> json) => _$CommonStyleFromJson(json);
//   Map<String, dynamic> toJson() => _$CommonStyleToJson(this);
// }

// // style/gradient_overlay.dart
// @HiveType(typeId: 89)
// @JsonSerializable()
// class GradientOverlay {
//   @HiveField(0)
//   @JsonKey(name: 'enabled')
//   final bool enabled;
  
//   @HiveField(1)
//   @JsonKey(name: 'stops')
//   final List<GradientStop> stops;
  
//   @HiveField(2)
//   @JsonKey(name: 'angle')
//   final int angle;

//   GradientOverlay({
//     required this.enabled,
//     required this.stops,
//     required this.angle,
//   });

//   factory GradientOverlay.fromJson(Map<String, dynamic> json) => _$GradientOverlayFromJson(json);
//   Map<String, dynamic> toJson() => _$GradientOverlayToJson(this);
// }

// // style/gradient_stop.dart
// @HiveType(typeId: 90)
// @JsonSerializable()
// class GradientStop {
//   @HiveField(0)
//   @JsonKey(name: 'color')
//   final String color;
  
//   @HiveField(1)
//   @JsonKey(name: 'position')
//   final double position;

//   GradientStop({
//     required this.color,
//     required this.position,
//   });

//   factory GradientStop.fromJson(Map<String, dynamic> json) => _$GradientStopFromJson(json);
//   Map<String, dynamic> toJson() => _$GradientStopToJson(this);
// }

// // style/animations.dart
// @HiveType(typeId: 91)
// @JsonSerializable()
// class Animations {
//   @HiveField(0)
//   @JsonKey(name: 'transition_duration')
//   final int transitionDuration;
  
//   @HiveField(1)
//   @JsonKey(name: 'hover')
//   final HoverAnimation hover;

//   Animations({
//     required this.transitionDuration,
//     required this.hover,
//   });

//   factory Animations.fromJson(Map<String, dynamic> json) => _$AnimationsFromJson(json);
//   Map<String, dynamic> toJson() => _$AnimationsToJson(this);
// }

// // style/hover_animation.dart
// import 'package:hive/hive.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'hover_animation.g.dart'; // Required for JSON serialization code generation

// @HiveType(typeId: 92)
// @JsonSerializable()
// class HoverAnimation {
//   @HiveField(0)
//   @JsonKey(name: 'scale')
//   final double scale;
  
//   @HiveField(1)
//   @JsonKey(name: 'duration')
//   final int duration;

//   HoverAnimation({
//     required this.scale,
//     required this.duration,
//   });

//   // Factory constructor for creating a HoverAnimation object from a JSON map
//   factory HoverAnimation.fromJson(Map<String, dynamic> json) => _$HoverAnimationFromJson(json);

//   // Method to convert a HoverAnimation object to a JSON map
//   Map<String, dynamic> toJson() => _$HoverAnimationToJson(this);
// }

// // style/typography.dart
// @HiveType(typeId: 93)
// @JsonSerializable()
// class Typography {
//   @HiveField(0)
//   @JsonKey(name: 'font_family')
//   final String fontFamily;
  
//   @HiveField(1)
//   @JsonKey(name: 'font_size')
//   final FontSize fontSize;
  
//   @HiveField(2)
//   @JsonKey(name: 'font_weight')
//   final String fontWeight;
  
//   @HiveField(3)
//   @JsonKey(name: 'letter_spacing')
//   final double letterSpacing;
  
//   @HiveField(4)
//   @JsonKey(name: 'line_height')
//   final double lineHeight;
  
//   @HiveField(5)
//   @JsonKey(name: 'text_align')
//   final String textAlign;
  
//   @HiveField(6)
//   @JsonKey(name: 'text_transform')
//   final String textTransform;

//   Typography({
//     required this.fontFamily,
//     required this.fontSize,
//     required this.fontWeight,
//     required this.letterSpacing,
//     required this.lineHeight,
//     required this.textAlign,
//     required this.textTransform,
//   });

//   factory Typography.fromJson(Map<String, dynamic> json) => _$TypographyFromJson(json);
//   Map<String, dynamic> toJson() => _$TypographyToJson(this);
// }

// // style/font_size.dart
// @HiveType(typeId: 94)
// @JsonSerializable()
// class FontSize {
//   @HiveField(0)
//   @JsonKey(name: 'base')
//   final double base;
  
//   @HiveField(1)
//   @JsonKey(name: 'min')
//   final double min;
  
//   @HiveField(2)
//   @JsonKey(name: 'max')
//   final double max;
  
//   @HiveField(3)
//   @JsonKey(name: 'scale')
//   final double scale;

//   FontSize({
//     required this.base,
//     required this.min,
//     required this.max,
//     required this.scale,
//   });

//   factory FontSize.fromJson(Map<String, dynamic> json) => _$FontSizeFromJson(json);
//   Map<String, dynamic> toJson() => _$FontSizeToJson(this);
// }

// // style/style_colors.dart
// @HiveType(typeId: 95)
// @JsonSerializable()
// class StyleColors {
//   @HiveField(0)
//   @JsonKey(name: 'text')
//   final String text;
  
//   @HiveField(1)
//   @JsonKey(name: 'shadow')
//   final Shadow shadow;

//   StyleColors({
//     required this.text,
//     required this.shadow,
//   });

//   factory StyleColors.fromJson(Map<String, dynamic> json) => _$StyleColorsFromJson(json);
//   Map<String, dynamic> toJson() => _$StyleColorsToJson(this);
// }

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
// @HiveType(typeId: 97)
// @JsonSerializable()
// class ActionButtons {
//   @HiveField(0)
//   @JsonKey(name: 'size')
//   final double size;
  
//   @HiveField(1)
//   @JsonKey(name: 'background')
//   final Background background;
  
//   @HiveField(2)
//   @JsonKey(name: 'blur')
//   final Blur blur;
  
//   @HiveField(3)
//   @JsonKey(name: 'shadow')
//   final Shadow shadow;

//   ActionButtons({
//     required this.size,
//     required this.background,
//     required this.blur,
//     required this.shadow,
//   });

//   factory ActionButtons.fromJson(Map<String, dynamic> json) => _$ActionButtonsFromJson(json);
//   Map<String, dynamic> toJson() => _$ActionButtonsToJson(this);
// }

// // Updated StyleConfig to include all components from JSON
// @HiveType(typeId: 38)
// @JsonSerializable()
// class StyleConfig {
//   @HiveField(0)
//   @JsonKey(name: 'common')
//   final CommonStyle common;
  
//   @HiveField(1)
//   @JsonKey(name: 'title')
//   final ElementStyle title;
  
//   @HiveField(2)
//   @JsonKey(name: 'quote')
//   final ElementStyle quote;
  
//   @HiveField(3)
//   @JsonKey(name: 'action_buttons')
//   final ActionButtons actionButtons;

//   StyleConfig({
//     required this.common,
//     required this.title,
//     required this.quote,
//     required this.actionButtons,
//   });

//   factory StyleConfig.fromJson(Map<String, dynamic> json) => _$StyleConfigFromJson(json);
//   Map<String, dynamic> toJson() => _$StyleConfigToJson(this);
// }

// // layout/layout_adjustments.dart
// @HiveType(typeId: 98)
// @JsonSerializable()
// class LayoutAdjustments {
//   @HiveField(0)
//   @JsonKey(name: 'spacing')
//   final LayoutSpacing spacing;
  
//   @HiveField(1)
//   @JsonKey(name: 'alignment')
//   final LayoutAlignment alignment;
  
//   @HiveField(2)
//   @JsonKey(name: 'constraints')
//   final LayoutConstraints constraints;

//   LayoutAdjustments({
//     required this.spacing,
//     required this.alignment,
//     required this.constraints,
//   });

//   factory LayoutAdjustments.fromJson(Map<String, dynamic> json) => _$LayoutAdjustmentsFromJson(json);
//   Map<String, dynamic> toJson() => _$LayoutAdjustmentsToJson(this);
// }

// // layout/layout_spacing.dart
// @HiveType(typeId: 99)
// @JsonSerializable()
// class LayoutSpacing {
//   @HiveField(0)
//   @JsonKey(name: 'between_elements')
//   final double betweenElements;
  
//   @HiveField(1)
//   @JsonKey(name: 'horizontal_margin')
//   final double horizontalMargin;
  
//   @HiveField(2)
//   @JsonKey(name: 'vertical_margin')
//   final double verticalMargin;

//   LayoutSpacing({
//     required this.betweenElements,
//     required this.horizontalMargin,
//     required this.verticalMargin,
//   });

//   factory LayoutSpacing.fromJson(Map<String, dynamic> json) => _$LayoutSpacingFromJson(json);
//   Map<String, dynamic> toJson() => _$LayoutSpacingToJson(this);
// }

// // layout/layout_alignment.dart
// @HiveType(typeId: 100)
// @JsonSerializable()
// class LayoutAlignment {
//   @HiveField(0)
//   @JsonKey(name: 'title')
//   final String title;
  
//   @HiveField(1)
//   @JsonKey(name: 'quote')
//   final String quote;

//   LayoutAlignment({
//     required this.title,
//     required this.quote,
//   });

//   factory LayoutAlignment.fromJson(Map<String, dynamic> json) => _$LayoutAlignmentFromJson(json);
//   Map<String, dynamic> toJson() => _$LayoutAlignmentToJson(this);
// }

// // layout/layout_constraints.dart
// @HiveType(typeId: 101)
// @JsonSerializable()
// class LayoutConstraints {
//   @HiveField(0)
//   @JsonKey(name: 'max_width')
//   final MaxWidth maxWidth;
  
//   @HiveField(1)
//   @JsonKey(name: 'min_height')
//   final MinHeight minHeight;

//   LayoutConstraints({
//     required this.maxWidth,
//     required this.minHeight,
//   });

//   factory LayoutConstraints.fromJson(Map<String, dynamic> json) => _$LayoutConstraintsFromJson(json);
//   Map<String, dynamic> toJson() => _$LayoutConstraintsToJson(this);
// }

// // layout/max_width.dart
// @HiveType(typeId: 102)
// @JsonSerializable()
// class MaxWidth {
//   @HiveField(0)
//   @JsonKey(name: 'title')
//   final double title;
  
//   @HiveField(1)
//   @JsonKey(name: 'quote')
//   final double quote;

//   MaxWidth({
//     required this.title,
//     required this.quote,
//   });

//   factory MaxWidth.fromJson(Map<String, dynamic> json) => _$MaxWidthFromJson(json);
//   Map<String, dynamic> toJson() => _$MaxWidthToJson(this);
// }

// // layout/min_height.dart
// @HiveType(typeId: 103)
// @JsonSerializable()
// class MinHeight {
//   @HiveField(0)
//   @JsonKey(name: 'title')
//   final double title;
  
//   @HiveField(1)
//   @JsonKey(name: 'quote')
//   final double quote;

//   MinHeight({
//     required this.title,
//     required this.quote,
//   });

//   factory MinHeight.fromJson(Map<String, dynamic> json) => _$MinHeightFromJson(json);
//   Map<String, dynamic> toJson() => _$MinHeightToJson(this);
// }

// // Updated LayoutConfig to include all components from JSON
// @HiveType(typeId: 32)
// @JsonSerializable()
// class LayoutConfig {
//   @HiveField(0)
//   @JsonKey(name: 'responsive')
//   final bool responsive;
  
//   @HiveField(1)
//   @JsonKey(name: 'breakpoints')
//   final LayoutBreakpoints breakpoints;
  
//   @HiveField(2)
//   @JsonKey(name: 'portrait')
//   final OrientationLayout portrait;
  
//   @HiveField(3)
//   @JsonKey(name: 'landscape')
//   final OrientationLayout landscape;

//   LayoutConfig({
//     required this.responsive,
//     required this.breakpoints,
//     required this.portrait,
//     required this.landscape,
//   });

//   factory LayoutConfig.fromJson(Map<String, dynamic> json) => _$LayoutConfigFromJson(json);
//   Map<String, dynamic> toJson() => _$LayoutConfigToJson(this);
// }

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

// // Main template.dart (Updated)
// // Main template.dart (Updated)
// import 'package:hive/hive.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'template.g.dart'; // Required for JSON serialization and code generation

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
//   final GridConfig responsiveConfig;

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

//   // Factory constructor for creating a Template object from JSON
//   factory Template.fromJson(Map<String, dynamic> json) => _$TemplateFromJson(json);

//   // Method to convert a Template object to JSON
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

// @HiveType(typeId: 40)
// @JsonSerializable()
// class TemplateMetadata {
//   @HiveField(0)
//   @JsonKey(name: 'is_premium')
//   final bool isPremium;
  
//   @HiveField(1)
//   @JsonKey(name: 'status')
//   final String status;
  
//   @HiveField(2)
//   @JsonKey(name: 'version')
//   final int version;

//   TemplateMetadata({
//     required this.isPremium,
//     required this.status,
//     required this.version,
//   });

//   factory TemplateMetadata.fromJson(Map<String, dynamic> json) => _$TemplateMetadataFromJson(json);
//   Map<String, dynamic> toJson() => _$TemplateMetadataToJson(this);
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
// @HiveType(typeId: 107)
// @JsonSerializable()
// class ResponsiveBreakpoint {
//   @HiveField(0)
//   @JsonKey(name: 'max_width')
//   final double maxWidth;
  
//   @HiveField(1)
//   @JsonKey(name: 'title_scale')
//   final double titleScale;
  
//   @HiveField(2)
//   @JsonKey(name: 'quote_scale')
//   final double quoteScale;
  
//   @HiveField(3)
//   @JsonKey(name: 'spacing_scale')
//   final double spacingScale;

//   ResponsiveBreakpoint({
//     required this.maxWidth,
//     required this.titleScale,
//     required this.quoteScale,
//     required this.spacingScale,
//   });

//   factory ResponsiveBreakpoint.fromJson(Map<String, dynamic> json) => _$ResponsiveBreakpointFromJson(json);
//   Map<String, dynamic> toJson() => _$ResponsiveBreakpointToJson(this);
// }

// @HiveType(typeId: 108)
// @JsonSerializable()
// class ResponsiveBehavior {
//   @HiveField(0)
//   @JsonKey(name: 'breakpoints')
//   final Map<String, ResponsiveBreakpoint> breakpoints;

//   ResponsiveBehavior({
//     required this.breakpoints,
//   });

//   factory ResponsiveBehavior.fromJson(Map<String, dynamic> json) => _$ResponsiveBehaviorFromJson(json);
//   Map<String, dynamic> toJson() => _$ResponsiveBehaviorToJson(this);
// }

// // Update OrientationLayout to include the new responsive behavior
// @HiveType(typeId: 33)
// @JsonSerializable()
// class OrientationLayout {
//   @HiveField(0)
//   @JsonKey(name: 'title')
//   final ElementLayout title;
  
//   @HiveField(1)
//   @JsonKey(name: 'quote')
//   final ElementLayout quote;
  
//   @HiveField(2)
//   @JsonKey(name: 'layout_adjustments')
//   final LayoutAdjustments layoutAdjustments;
  
//   @HiveField(3)
//   @JsonKey(name: 'responsive_behavior')
//   final ResponsiveBehavior responsiveBehavior;

//   OrientationLayout({
//     required this.title,
//     required this.quote,
//     required this.layoutAdjustments,
//     required this.responsiveBehavior,
//   });

//   factory OrientationLayout.fromJson(Map<String, dynamic> json) => _$OrientationLayoutFromJson(json);
//   Map<String, dynamic> toJson() => _$OrientationLayoutToJson(this);
// }