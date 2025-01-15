// import 'package:hive/hive.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'template_all_extra.g.dart';

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
//   final TemplateComposition composition;

//   @HiveField(3)
//   @JsonKey(name: 'layout_config')
//   final LayoutConfig layoutConfig;

//   @HiveField(4)
//   @JsonKey(name: 'style_config')
//   final StyleConfig styleConfig;

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
// class TemplateComposition {
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

//   TemplateComposition({
//     required this.backgroundId,
//     required this.quoteId,
//     required this.layout,
//     required this.aspectRatio,
//   });

//   factory TemplateComposition.fromJson(Map<String, dynamic> json) => _$TemplateCompositionFromJson(json);
//   Map<String, dynamic> toJson() => _$TemplateCompositionToJson(this);
// }
// @HiveType(typeId: 32)
// @JsonSerializable()
// class LayoutConfig {
//   @HiveField(0)
//   @JsonKey(name: 'responsive')
//   final bool responsive;
  
//   @HiveField(1)
//   @JsonKey(name: 'breakpoints')
//   final LayoutBreakpoints? breakpoints;
  
//   @HiveField(2)
//   @JsonKey(name: 'portrait')
//   final OrientationLayout? portrait;
  
//   @HiveField(3)
//   @JsonKey(name: 'landscape')
//   final OrientationLayout? landscape;

//   LayoutConfig({
//     required this.responsive,
//     required this.breakpoints,
//     required this.portrait,
//     required this.landscape,
//   });

//   factory LayoutConfig.fromJson(Map<String, dynamic> json) => _$LayoutConfigFromJson(json);
//   Map<String, dynamic> toJson() => _$LayoutConfigToJson(this);
// }

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

// @HiveType(typeId: 33)
// @JsonSerializable()
// class OrientationLayout {
//   @HiveField(0)
//   @JsonKey(name: 'title')
//   final ElementLayout? title;
  
//   @HiveField(1)
//   @JsonKey(name: 'quote')
//   final ElementLayout? quote;
  
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

// @HiveType(typeId: 35)
// @JsonSerializable()
// class LayoutPosition {
//   @HiveField(0)
//   @JsonKey(name: 'x')
//   final double x;
  
//   @HiveField(1)
//   @JsonKey(name: 'y')
//   final double y;

//   LayoutPosition({
//     required this.x,
//     required this.y,
//   });

//   factory LayoutPosition.fromJson(Map<String, dynamic> json) => _$LayoutPositionFromJson(json);
//   Map<String, dynamic> toJson() => _$LayoutPositionToJson(this);
// }

// @HiveType(typeId: 37)
// @JsonSerializable()
// class LayoutSafeArea {
//   @HiveField(0)
//   @JsonKey(name: 'top')
//   final double top;
  
//   @HiveField(1)
//   @JsonKey(name: 'bottom')
//   final double bottom;

//   LayoutSafeArea({
//     required this.top,
//     required this.bottom,
//   });

//   factory LayoutSafeArea.fromJson(Map<String, dynamic> json) => _$LayoutSafeAreaFromJson(json);
//   Map<String, dynamic> toJson() => _$LayoutSafeAreaToJson(this);
// }

// @HiveType(typeId: 36)
// @JsonSerializable()
// class LayoutSize {
//   @HiveField(0)
//   @JsonKey(name: 'width')
//   final double width;
  
//   @HiveField(1)
//   @JsonKey(name: 'height')
//   final double height;

//   LayoutSize({
//     required this.width,
//     required this.height,
//   });

//   factory LayoutSize.fromJson(Map<String, dynamic> json) => _$LayoutSizeFromJson(json);
//   Map<String, dynamic> toJson() => _$LayoutSizeToJson(this);
// }

// @HiveType(typeId: 86)
// @JsonSerializable()
// class LayoutVisualEffects {
//   @HiveField(0)
//   @JsonKey(name: 'blur')
//   final LayoutBlur? blur;
  
//   @HiveField(1)
//   @JsonKey(name: 'border_radius')
//   final LayoutBorderRadius borderRadius;
  
//   @HiveField(2)
//   @JsonKey(name: 'background')
//   final LayoutBackground background;

//   LayoutVisualEffects({
//     required this.blur,
//     required this.borderRadius,
//     required this.background,
//   });

//   factory LayoutVisualEffects.fromJson(Map<String, dynamic> json) => _$LayoutVisualEffectsFromJson(json);
//   Map<String, dynamic> toJson() => _$LayoutVisualEffectsToJson(this);
// }

// @HiveType(typeId: 84)
// @JsonSerializable()
// class LayoutBackground {
//   @HiveField(0)
//   @JsonKey(name: 'opacity')
//   final LayoutOpacityConfig opacity;
  
//   @HiveField(1)
//   @JsonKey(name: 'color')
//   final String color;

//   LayoutBackground({
//     required this.opacity,
//     required this.color,
//   });

//   factory LayoutBackground.fromJson(Map<String, dynamic> json) => _$LayoutBackgroundFromJson(json);
//   Map<String, dynamic> toJson() => _$LayoutBackgroundToJson(this);
// }

// @HiveType(typeId: 85)
// @JsonSerializable()
// class LayoutOpacityConfig {
//   @HiveField(0)
//   @JsonKey(name: 'base')
//   final double base;
  
//   @HiveField(1)
//   @JsonKey(name: 'min')
//   final double min;
  
//   @HiveField(2)
//   @JsonKey(name: 'max')
//   final double max;

//   LayoutOpacityConfig({
//     required this.base,
//     required this.min,
//     required this.max,
//   });

//   factory LayoutOpacityConfig.fromJson(Map<String, dynamic> json) => _$LayoutOpacityConfigFromJson(json);
//   Map<String, dynamic> toJson() => _$LayoutOpacityConfigToJson(this);
// }

// @HiveType(typeId: 82)
// @JsonSerializable()
// class LayoutSigmaValue {
//   @HiveField(0)
//   @JsonKey(name: 'base')
//   final double base;
  
//   @HiveField(1)
//   @JsonKey(name: 'min')
//   final double min;
  
//   @HiveField(2)
//   @JsonKey(name: 'max')
//   final double max;

//   LayoutSigmaValue({
//     required this.base,
//     required this.min,
//     required this.max,
//   });

//   factory LayoutSigmaValue.fromJson(Map<String, dynamic> json) => _$LayoutSigmaValueFromJson(json);
//   Map<String, dynamic> toJson() => _$LayoutSigmaValueToJson(this);
// }

// @HiveType(typeId: 81)
// @JsonSerializable()
// class LayoutBlurSigma {
//   @HiveField(0)
//   @JsonKey(name: 'x')
//   final LayoutSigmaValue x;
  
//   @HiveField(1)
//   @JsonKey(name: 'y')
//   final LayoutSigmaValue y;

//   LayoutBlurSigma({
//     required this.x,
//     required this.y,
//   });

//   factory LayoutBlurSigma.fromJson(Map<String, dynamic> json) => _$LayoutBlurSigmaFromJson(json);
//   Map<String, dynamic> toJson() => _$LayoutBlurSigmaToJson(this);
// }

// @HiveType(typeId: 80)
// @JsonSerializable()
// class LayoutBlur {
//   @HiveField(0)
//   @JsonKey(name: 'enabled')
//   final bool enabled;
  
//   @HiveField(1)
//   @JsonKey(name: 'sigma')
//   final LayoutBlurSigma sigma;
  
//   @HiveField(2)
//   @JsonKey(name: 'quality')
//   final String quality;

//   LayoutBlur({
//     required this.enabled,
//     required this.sigma,
//     required this.quality,
//   });

//   factory LayoutBlur.fromJson(Map<String, dynamic> json) => _$LayoutBlurFromJson(json);
//   Map<String, dynamic> toJson() => _$LayoutBlurToJson(this);
// }

// @HiveType(typeId: 83)
// @JsonSerializable()
// class LayoutBorderRadius {
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

//   LayoutBorderRadius({
//     required this.base,
//     required this.min,
//     required this.max,
//     required this.scaleFactor,
//   });

//   factory LayoutBorderRadius.fromJson(Map<String, dynamic> json) => _$LayoutBorderRadiusFromJson(json);
//   Map<String, dynamic> toJson() => _$LayoutBorderRadiusToJson(this);
// }

// @HiveType(typeId: 34)
// @JsonSerializable()
// class ElementLayout {
//   @HiveField(0)
//   @JsonKey(name: 'position')
//   final LayoutPosition layoutPosition;
  
//   @HiveField(1)
//   @JsonKey(name: 'size')
//   final LayoutSize size;
  
//   @HiveField(2)
//   @JsonKey(name: 'padding')
//   final double padding;
  
//   @HiveField(3)
//   @JsonKey(name: 'safe_area')
//   final LayoutSafeArea? safeArea;
  
//   @HiveField(4)
//   @JsonKey(name: 'visual_effects')
//   final LayoutVisualEffects? visualEffects;

//   ElementLayout({
//     required this.layoutPosition,
//     required this.size,
//     required this.padding,
//     this.safeArea,
//     required this.visualEffects,
//   });

//   factory ElementLayout.fromJson(Map<String, dynamic> json) => _$ElementLayoutFromJson(json);
//   Map<String, dynamic> toJson() => _$ElementLayoutToJson(this);
// }

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
// @HiveType(typeId: 108)
// @JsonSerializable()
// class ResponsiveBehavior {
//   @HiveField(0)
//   @JsonKey(name: 'breakpoints')
//   final Breakpoints breakpoints;

//   ResponsiveBehavior({required this.breakpoints});

//   factory ResponsiveBehavior.fromJson(Map<String, dynamic> json) =>
//       _$ResponsiveBehaviorFromJson(json);

//   Map<String, dynamic> toJson() => _$ResponsiveBehaviorToJson(this);
// }


// @HiveType(typeId: 108)
// @HiveType(typeId: 309)
// @JsonSerializable()
// class Breakpoints {
//   @HiveField(0)
//    @JsonKey(name: 'small')
//   final ResponsiveBreakpoint small;

//   @HiveField(1)
//    @JsonKey(name: 'medium')
//   final ResponsiveBreakpoint medium;

//   @HiveField(2)
//   @JsonKey(name: 'large')
//   final ResponsiveBreakpoint large;

//   Breakpoints({
//     required this.small,
//     required this.medium,
//     required this.large,
//   });

//   factory Breakpoints.fromJson(Map<String, dynamic> json) =>
//       _$BreakpointsFromJson(json);

//   Map<String, dynamic> toJson() => _$BreakpointsToJson(this);
// }

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

// @HiveType(typeId: 38)
// @JsonSerializable()
// class StyleConfig {
//   @HiveField(0)
//   @JsonKey(name: 'common')
//   final CommonStyle? common;
  
//   @HiveField(1)
//   @JsonKey(name: 'title')
//   final ElementStyle? title;
  
//   @HiveField(2)
//   @JsonKey(name: 'quote')
//   final ElementStyle? quote;
  
//   @HiveField(3)
//   @JsonKey(name: 'action_buttons')
//   final ActionButtons? actionButtons;

//   StyleConfig({
//     required this.common,
//     required this.title,
//     required this.quote,
//     required this.actionButtons,
//   });

//   factory StyleConfig.fromJson(Map<String, dynamic> json) => _$StyleConfigFromJson(json);
//   Map<String, dynamic> toJson() => _$StyleConfigToJson(this);
// }

// @HiveType(typeId: 97)
// @JsonSerializable()
// class ActionButtons {
//   @HiveField(0)
//   @JsonKey(name: 'size')
//   final double size;
  
//   @HiveField(1)
//   @JsonKey(name: 'background')
//   final ActionBackground background;
  
//   @HiveField(2)
//   @JsonKey(name: 'blur')
//   final ActionBlur blur;
  
//   @HiveField(3)
//   @JsonKey(name: 'shadow')
//   final ActionShadow shadow;

//   ActionButtons({
//     required this.size,
//     required this.background,
//     required this.blur,
//     required this.shadow,
//   });

//   factory ActionButtons.fromJson(Map<String, dynamic> json) => _$ActionButtonsFromJson(json);
//   Map<String, dynamic> toJson() => _$ActionButtonsToJson(this);
// }


// @HiveType(typeId: 202)
// @JsonSerializable()
// class ActionBackground {
//   @HiveField(0)
//   final double opacity;

//   @HiveField(1)
//   final String color;

//   ActionBackground({
//     required this.opacity,
//     required this.color,
//   });

//   factory ActionBackground.fromJson(Map<String, dynamic> json) =>
//       _$ActionBackgroundFromJson(json);

//   Map<String, dynamic> toJson() => _$ActionBackgroundToJson(this);
// }


// @HiveType(typeId: 203)
// @JsonSerializable()
// class ActionBlur {
//   @HiveField(0)
//   final bool enabled;

//   @HiveField(1)
//   final ActionSigma sigma;

//   ActionBlur({
//     required this.enabled,
//     required this.sigma,
//   });

//   factory ActionBlur.fromJson(Map<String, dynamic> json) => _$ActionBlurFromJson(json);

//   Map<String, dynamic> toJson() => _$ActionBlurToJson(this);
// }

// @HiveType(typeId: 204)
// @JsonSerializable()
// class ActionSigma {
//   @HiveField(0)
//   final double x;

//   @HiveField(1)
//   final double y;

//   ActionSigma({
//     required this.x,
//     required this.y,
//   });

//   factory ActionSigma.fromJson(Map<String, dynamic> json) => _$ActionSigmaFromJson(json);

//   Map<String, dynamic> toJson() => _$ActionSigmaToJson(this);
// }

// @HiveType(typeId: 205)
// @JsonSerializable()
// class ActionShadow {
//   @HiveField(0)
//   final String color;

//   @HiveField(1)
//   final ActionOffset offset;

//   @HiveField(2)
//   final double blurRadius;

//   ActionShadow({
//     required this.color,
//     required this.offset,
//     required this.blurRadius,
//   });

//   factory ActionShadow.fromJson(Map<String, dynamic> json) => _$ActionShadowFromJson(json);

//   Map<String, dynamic> toJson() => _$ActionShadowToJson(this);
// }

// @HiveType(typeId: 206)
// @JsonSerializable()
// class ActionOffset {
//   @HiveField(0)
//   final double x;

//   @HiveField(1)
//   final double y;

//   ActionOffset({
//     required this.x,
//     required this.y,
//   });

//   factory ActionOffset.fromJson(Map<String, dynamic> json) => _$ActionOffsetFromJson(json);

//   Map<String, dynamic> toJson() => _$ActionOffsetToJson(this);
// }

// @HiveType(typeId: 92)
// @JsonSerializable()
// class CommonHoverAnimation {
//   @HiveField(0)
//   @JsonKey(name: 'scale')
//   final double scale;
  
//   @HiveField(1)
//   @JsonKey(name: 'duration')
//   final int duration;

//   CommonHoverAnimation({
//     required this.scale,
//     required this.duration,
//   });

//   factory CommonHoverAnimation.fromJson(Map<String, dynamic> json) => _$CommonHoverAnimationFromJson(json);

//   Map<String, dynamic> toJson() => _$CommonHoverAnimationToJson(this);
// }

// @HiveType(typeId: 91)
// @JsonSerializable()
// class CommonAnimations {
//   @HiveField(0)
//   @JsonKey(name: 'transition_duration')
//   final int transitionDuration;
  
//   @HiveField(1)
//   @JsonKey(name: 'hover')
//   final CommonHoverAnimation hover;

//   CommonAnimations({
//     required this.transitionDuration,
//     required this.hover,
//   });

//   factory CommonAnimations.fromJson(Map<String, dynamic> json) => _$CommonAnimationsFromJson(json);
//   Map<String, dynamic> toJson() => _$CommonAnimationsToJson(this);
// }

// @HiveType(typeId: 90)
// @JsonSerializable()
// class CommonGradientStop {
//   @HiveField(0)
//   @JsonKey(name: 'color')
//   final String color;
  
//   @HiveField(1)
//   @JsonKey(name: 'position')
//   final double position;

//   CommonGradientStop({
//     required this.color,
//     required this.position,
//   });

//   factory CommonGradientStop.fromJson(Map<String, dynamic> json) => _$CommonGradientStopFromJson(json);
//   Map<String, dynamic> toJson() => _$CommonGradientStopToJson(this);
// }

// @HiveType(typeId: 89)
// @JsonSerializable()
// class CommonGradientOverlay {
//   @HiveField(0)
//   @JsonKey(name: 'enabled')
//   final bool enabled;
  
//   @HiveField(1)
//   @JsonKey(name: 'stops')
//   final List<CommonGradientStop> stops;
  
//   @HiveField(2)
//   @JsonKey(name: 'angle')
//   final int angle;

//   CommonGradientOverlay({
//     required this.enabled,
//     required this.stops,
//     required this.angle,
//   });

//   factory CommonGradientOverlay.fromJson(Map<String, dynamic> json) => _$CommonGradientOverlayFromJson(json);
//   Map<String, dynamic> toJson() => _$CommonGradientOverlayToJson(this);
// }

// @HiveType(typeId: 88)
// @JsonSerializable()
// class CommonStyle {
//   @HiveField(0)
//   @JsonKey(name: 'gradient_overlay')
//   final CommonGradientOverlay gradientOverlay;
  
//   @HiveField(1)
//   @JsonKey(name: 'animations')
//   final CommonAnimations animations;

//   CommonStyle({
//     required this.gradientOverlay,
//     required this.animations,
//   });

//   factory CommonStyle.fromJson(Map<String, dynamic> json) => _$CommonStyleFromJson(json);
//   Map<String, dynamic> toJson() => _$CommonStyleToJson(this);
// }

// @HiveType(typeId: 30)
// @JsonSerializable()
// class ElementStyle {
//   @HiveField(0)
//   @JsonKey(name: 'typography')
//   final ElementTypography typography;

//   @HiveField(1)
//   @JsonKey(name: 'colors')
//   final ElementStyleColors colors;

//   ElementStyle({
//     required this.typography,
//     required this.colors,
//   });

//   factory ElementStyle.fromJson(Map<String, dynamic> json) => _$ElementStyleFromJson(json);

//   Map<String, dynamic> toJson() => _$ElementStyleToJson(this);
// }

// @HiveType(typeId: 95)
// @JsonSerializable()
// class ElementStyleColors {
//   @HiveField(0)
//   @JsonKey(name: 'text')
//   final String text;
  
//   @HiveField(1)
//   @JsonKey(name: 'shadow')
//   final ElementShadow shadow;

//   ElementStyleColors({
//     required this.text,
//     required this.shadow,
//   });

//   factory ElementStyleColors.fromJson(Map<String, dynamic> json) => _$ElementStyleColorsFromJson(json);
//   Map<String, dynamic> toJson() => _$ElementStyleColorsToJson(this);
// }

// @HiveType(typeId: 96)
// @JsonSerializable()
// class ElementShadow {
//   @HiveField(0)
//   @JsonKey(name: 'color')
//   final String color;
  
//   @HiveField(1)
//   @JsonKey(name: 'offset')
//   final ShadowOffset offset;
  
//   @HiveField(2)
//   @JsonKey(name: 'blur_radius')
//   final double blurRadius;
  
//   @HiveField(3)
//   @JsonKey(name: 'opacity')
//   final double opacity;

//   ElementShadow({
//     required this.color,
//     required this.offset,
//     required this.blurRadius,
//     required this.opacity,
//   });

//   factory ElementShadow.fromJson(Map<String, dynamic> json) => _$ElementShadowFromJson(json);
//   Map<String, dynamic> toJson() => _$ElementShadowToJson(this);
// } 

// @HiveType(typeId: 35)
// @JsonSerializable()
// class ShadowOffset {
//   @HiveField(0)
//   @JsonKey(name: 'x')
//   final double x;
  
//   @HiveField(1)
//   @JsonKey(name: 'y')
//   final double y;

//   ShadowOffset({
//     required this.x,
//     required this.y,
//   });

//   factory ShadowOffset.fromJson(Map<String, dynamic> json) => 
//     _$ShadowOffsetFromJson(json);
  
//   Map<String, dynamic> toJson() => _$ShadowOffsetToJson(this);
// }

// @HiveType(typeId: 93)
// @JsonSerializable()
// class ElementTypography {
//   @HiveField(0)
//   @JsonKey(name: 'font_family')
//   final String fontFamily;
  
//   @HiveField(1)
//   @JsonKey(name: 'font_size')
//   final ElementFontSize fontSize;
  
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

//   ElementTypography({
//     required this.fontFamily,
//     required this.fontSize,
//     required this.fontWeight,
//     required this.letterSpacing,
//     required this.lineHeight,
//     required this.textAlign,
//     required this.textTransform,
//   });

//   factory ElementTypography.fromJson(Map<String, dynamic> json) => _$ElementTypographyFromJson(json);
//   Map<String, dynamic> toJson() => _$ElementTypographyToJson(this);
// }

// @HiveType(typeId: 94)
// @JsonSerializable()
// class ElementFontSize {
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

//   ElementFontSize({
//     required this.base,
//     required this.min,
//     required this.max,
//     required this.scale,
//   });

//   factory ElementFontSize.fromJson(Map<String, dynamic> json) => _$ElementFontSizeFromJson(json);
//   Map<String, dynamic> toJson() => _$ElementFontSizeToJson(this);
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
