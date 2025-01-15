import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shared/models/entities/background_collection/background_collection.dart';
import '../../../../shared/models/entities/qoute_collection/quote/quote.dart';
import '../../../../shared/models/entities/template_collection/template_collection.dart';
import '../controllers/home_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';

class IntelligentTemplateGrid extends GetView<HomeController> {
  const IntelligentTemplateGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            Obx(() => _buildAdaptiveContent(constraints)),
          ],
        );
      },
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Obx(() {
              final template = controller.selectedTemplate.value;
              final translation =
                  template?.translations[controller.currentLanguage.value];
              return Text(
                translation?.title ?? 'Templates',
                style: Get.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.brown[800],
                  letterSpacing: 0.2,
                ),
              );
            }),
          ),
          _buildViewModeToggle(),
        ],
      ),
    );
  }

  Widget _buildViewModeToggle() {
    return Obx(() {
      final isGridView = controller.isGridView.value;
      final template = controller.selectedTemplate.value;
      final styleConfig = template?.styleConfig;
      final actionStyle = styleConfig?.actionButtons;

      return Material(
        color: Colors.amber.shade50,
        borderRadius: BorderRadius.circular(
          actionStyle?.background?.opacity ?? 8,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: controller.toggleViewMode,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(
              isGridView ? Icons.grid_view : Icons.view_list,
              color: Colors.amber[600],
              size: actionStyle?.size ?? 24,
            ),
          ),
        ),
      );
    });
  }

  Widget _buildAdaptiveContent(BoxConstraints constraints) {
    if (controller.isLoading.value) {
      return _buildLoadingState();
    }

    final template = controller.selectedTemplate.value;
    final transitionDuration =
        template?.styleConfig.common?.animations?.transitionDuration ?? 300;

    return AnimatedSwitcher(
      duration: Duration(milliseconds: transitionDuration),
      child: controller.isGridView.value
          ? _buildIntelligentGrid(constraints)
          : _buildIntelligentList(constraints),
    );
  }

  Widget _buildIntelligentList(BoxConstraints constraints) {
    final template = controller.selectedTemplate.value;
    final layoutConfig = template?.layoutConfig;
    final breakpoints = layoutConfig?.breakpoints;
    final spacing = _calculateDynamicSpacing(constraints.maxWidth, breakpoints);
    final itemHeight = constraints.maxWidth * 0.8;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(spacing),
      itemCount: controller.morningTemplates.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(bottom: spacing),
        child: _buildTemplateCard(
          template: controller.morningTemplates[index],
          constraints: BoxConstraints(
            maxWidth: constraints.maxWidth - (spacing * 2),
            maxHeight: itemHeight,
          ),
          isGridView: false,
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.amber[600]!),
        ),
      ),
    );
  }

  Widget _buildIntelligentGrid(BoxConstraints constraints) {
    final template = controller.selectedTemplate.value;
    final layoutConfig = template?.layoutConfig;
    final breakpoints = layoutConfig?.breakpoints;

    final spacing = _calculateDynamicSpacing(
      constraints.maxWidth,
      breakpoints,
    );

    final columns = _calculateOptimalColumns(
      constraints.maxWidth,
      breakpoints,
    );

    final itemWidth = _calculateItemWidth(
      constraints.maxWidth,
      columns,
      spacing,
    );

    final aspectRatio = template?.composition.aspectRatio ?? "16:9";
    final aspectRatioParts = aspectRatio.split(":");
    final aspectRatioValue =
        double.parse(aspectRatioParts[0]) / double.parse(aspectRatioParts[1]);
    final itemHeight = itemWidth / aspectRatioValue;

    return Padding(
      padding: EdgeInsets.all(spacing),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns,
          mainAxisSpacing: spacing,
          crossAxisSpacing: spacing,
          childAspectRatio: aspectRatioValue,
        ),
        itemCount: controller.morningTemplates.length,
        itemBuilder: (context, index) => _buildTemplateCard(
          template: controller.morningTemplates[index],
          constraints: BoxConstraints(
            maxWidth: itemWidth,
            maxHeight: itemHeight,
          ),
          isGridView: true,
        ),
      ),
    );
  }

  Widget _buildTemplateCard({
    required Template template,
    required BoxConstraints constraints,
    required bool isGridView,
  }) {
    final styleConfig = template.styleConfig;
    final commonStyle = styleConfig.common;
    final animations = commonStyle?.animations;
    final transitionDuration = animations?.transitionDuration ?? 300;
    final typography = styleConfig.quote?.typography;
    final fontSize = typography?.fontSize;
    final borderRadius = fontSize?.base.clamp(8.0, 16.0) ?? 8.0;

    return Hero(
      tag: 'template_${template.uuid}',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => controller.onTemplateSelected(template),
          child: AnimatedContainer(
            duration: Duration(milliseconds: transitionDuration),
            height: constraints.maxHeight,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  _buildBackgroundWithEffects(template),
                  if (commonStyle?.gradientOverlay?.enabled ?? false)
                    _buildGradientOverlay(template, isGridView),
                  _buildTemplateContent(
                    template,
                    isGridView,
                    constraints,
                  ),
                  _buildInteractiveElements(template),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackgroundWithEffects(Template template) {
    //final visualEffects = template.layoutConfig.portrait.quote.visualEffects;
    //final blur = visualEffects.blur;

    return FutureBuilder<Background?>(
      future: controller.getBackgroundById(template.composition.backgroundId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const ColoredBox(
            color: Colors.black12,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        Widget imageWidget = Image.asset(
          snapshot.data!.visualData.image?.original ?? '',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            color: Colors.grey[300],
            child: const Icon(Icons.broken_image, color: Colors.white70),
          ),
        );

        // if (blur.enabled) {
        //   imageWidget = ImageFiltered(
        //     imageFilter: ImageFilter.blur(
        //       sigmaX: blur.sigma.x.base.clamp(
        //         blur.sigma.x.min,
        //         blur.sigma.x.max,
        //       ),
        //       sigmaY: blur.sigma.y.base.clamp(
        //         blur.sigma.y.min,
        //         blur.sigma.y.max,
        //       ),
        //     ),
        //     child: imageWidget,
        //   );
        // }

        return imageWidget;
      },
    );
  }

  Widget _buildGradientOverlay(Template template, bool isGridView) {
    final gradientOverlay = template.styleConfig.common?.gradientOverlay;
    if (gradientOverlay == null) return const SizedBox.shrink();

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: gradientOverlay.stops.map((stop) {
            return _parseColorSafely(stop.color);
          }).toList(),
          stops: gradientOverlay.stops.map((stop) => stop.position).toList(),
        ),
      ),
    );
  }

  Widget _buildTemplateContent(
    Template template,
    bool isGridView,
    BoxConstraints constraints,
  ) {
    final currentLanguage = controller.currentLanguage.value;
    final translation = template.translations[currentLanguage];
    if (translation == null) return const SizedBox.shrink();

    final titleStyle = template.styleConfig.title;
    final quoteStyle = template.styleConfig.quote;

    if (titleStyle == null || quoteStyle == null) {
      return const SizedBox.shrink();
    }

    final titleFontSize = _calculateDynamicFontSize(
      translation.title,
      constraints.maxWidth,
      titleStyle.typography?.fontSize?.base ?? 16.0,
      titleStyle.typography?.fontSize?.min ?? 12.0,
      titleStyle.typography?.fontSize?.max ?? 24.0,
    );

    final spacing = template.layoutConfig.portrait?.layoutAdjustments?.spacing
            .betweenElements ??
        8.0;

    return Padding(
      padding: EdgeInsets.all(isGridView ? 12 : 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Center(
              child: _buildAdaptiveTitle(
                title: translation.title,
                template: template,
                constraints: constraints,
                fontSize: titleFontSize,
                maxHeight: constraints.maxHeight * 0.4,
              ),
            ),
          ),
          SizedBox(height: spacing),
          Flexible(
            flex: 6,
            fit: FlexFit.tight,
            child: _buildAdaptiveQuote(
              template,
              quoteStyle,
              isGridView,
              constraints,
              constraints.maxHeight * 0.6,
            ),
          ),
        ],
      ),
    );
  }

  // Helper methods for calculating dynamic values
  double _calculateDynamicSpacing(
      double width, LayoutBreakpoints? breakpoints) {
    if (breakpoints == null) return 12;

    if (width <= breakpoints.small) return 12;
    if (width <= breakpoints.medium) return 16;
    return 20;
  }

  int _calculateOptimalColumns(double width, LayoutBreakpoints? breakpoints) {
    if (breakpoints == null) return 2;

    if (width <= breakpoints.small) return 2;
    if (width <= breakpoints.medium) return 3;
    if (width <= breakpoints.large) return 4;
    return 5;
  }

  double _calculateItemWidth(double totalWidth, int columns, double spacing) {
    return (totalWidth - (spacing * (columns + 1))) / columns;
  }

  double _calculateDynamicFontSize(
    String text,
    double maxWidth,
    double baseSize,
    double minSize,
    double maxSize,
  ) {
    final approxCharWidth = baseSize * 0.6;
    final maxChars = maxWidth / approxCharWidth;

    if (text.length <= maxChars) {
      return baseSize.clamp(minSize, maxSize);
    }

    final reduction = (text.length / maxChars) * 0.5;
    return (baseSize / reduction).clamp(minSize, maxSize);
  }

  Widget _buildAdaptiveTitle({
    required String title,
    required Template template,
    required BoxConstraints constraints,
    required double fontSize,
    required double maxHeight,
  }) {
    // Default style configurations
    final defaultTypography = ElementTypography(
      fontFamily: 'Roboto',
      fontSize: ElementFontSize(
        base: 16.0,
        min: 12.0,
        max: 24.0,
        scale: 1.0,
      ),
      fontWeight: 'normal',
      letterSpacing: 0.0,
      lineHeight: 1.2,
      textAlign: 'center',
      textTransform: 'none',
    );

    final defaultColors = ElementStyleColors(
      text: '#FFFFFF',
      shadow: ElementShadow(
        color: '#000000',
        offset: ShadowOffset(x: 0, y: 1),
        blurRadius: 2.0,
        opacity: 0.5,
      ),
    );

    final defaultElementStyle = ElementStyle(
      typography: defaultTypography,
      colors: defaultColors,
    );

    // Extract and verify style configurations
    final titleStyle = template.styleConfig.title ?? defaultElementStyle;
    final typography = titleStyle.typography ?? defaultTypography;
    final colors = titleStyle.colors ?? defaultColors;

    // Layout configuration defaults
    final defaultLayoutSafeArea = LayoutSafeArea(
      top: 0,
      bottom: 0,
    );

    final defaultVisualEffects = LayoutVisualEffects(
      blur: LayoutBlur(
        enabled: false,
        sigma: LayoutBlurSigma(
          x: LayoutSigmaValue(base: 0, min: 0, max: 0),
          y: LayoutSigmaValue(base: 0, min: 0, max: 0),
        ),
        quality: 'none',
      ),
      borderRadius: LayoutBorderRadius(
        base: 8,
        min: 4,
        max: 16,
        scaleFactor: 1,
      ),
      background: LayoutBackground(
        opacity: LayoutOpacityConfig(
          base: 0.5,
          min: 0.0,
          max: 1.0,
        ),
        color: '#000000',
      ),
    );

    final defaultElementLayout = ElementLayout(
      layoutPosition: LayoutPosition(x: 0, y: 0),
      size: LayoutSize(width: 0, height: 0),
      padding: 8.0,
      safeArea: defaultLayoutSafeArea,
      visualEffects: defaultVisualEffects,
    );

    // Extract and verify layout configurations
    final layoutConfig =
        template.layoutConfig.portrait?.title ?? defaultElementLayout;
    final visualEffects = layoutConfig.visualEffects ?? defaultVisualEffects;
    final blur = visualEffects.blur;
    final borderRadius = visualEffects.borderRadius;
    final background = visualEffects.background;

    // Calculate dynamic border radius
    final dynamicBorderRadius = (borderRadius.base.clamp(
          borderRadius.min,
          borderRadius.max,
        ) *
        borderRadius.scaleFactor);

    // Create shadow if defined
    final shadows = <Shadow>[];
    if (colors.shadow != null) {
      shadows.add(Shadow(
        color: _parseColorSafely(colors.shadow.color)
            .withOpacity(colors.shadow.opacity),
        offset: Offset(
          colors.shadow.offset.x,
          colors.shadow.offset.y,
        ),
        blurRadius: colors.shadow.blurRadius,
      ));
    }

    // Create text style with verified values
    final textStyle = TextStyle(
      fontFamily: typography.fontFamily,
      fontSize: fontSize.clamp(
        typography.fontSize.min,
        typography.fontSize.max,
      ),
      fontWeight: _parseFontWeight(typography.fontWeight),
      letterSpacing: typography.letterSpacing,
      color: _parseColorSafely(colors.text),
      height: typography.lineHeight,
      shadows: shadows,
    );

    // Text measurement and line calculation
    final textSpan = TextSpan(
      text: title,
      style: textStyle,
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      maxLines: 3,
    );
    textPainter.layout(maxWidth: constraints.maxWidth);

    final lineMetrics = textPainter.computeLineMetrics();
    final lineHeight = lineMetrics.isNotEmpty
        ? textPainter.height / lineMetrics.length
        : (typography.lineHeight * fontSize);
    final maxLines = (maxHeight / lineHeight).floor().clamp(1, 3);

    // Build the widget
    return ClipRRect(
      borderRadius: BorderRadius.circular(dynamicBorderRadius),
      child: BackdropFilter(
        filter: blur?.enabled == true
            ? ImageFilter.blur(
                sigmaX: blur?.sigma.x.base.clamp(
                      blur?.sigma.x.min ?? 0,
                      blur?.sigma.x.max ?? 0,
                    ) ??
                    0,
                sigmaY: blur?.sigma.y.base.clamp(
                      blur?.sigma.y.min ?? 0,
                      blur?.sigma.y.max ?? 0,
                    ) ??
                    0,
              )
            : ImageFilter.blur(sigmaX: 0, sigmaY: 0),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: layoutConfig.padding??0.0,
            vertical:((layoutConfig.padding??0.0) *(0.67)),
          ),
          decoration: BoxDecoration(
            color: _parseColorSafely(background.color).withOpacity(
              background.opacity.base.clamp(
                background.opacity.min,
                background.opacity.max,
              ),
            ),
            borderRadius: BorderRadius.circular(dynamicBorderRadius),
          ),
          child: AutoSizeText(
            title,
            style: textStyle,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            textAlign: _parseTextAlign(typography.textAlign),
          ),
        ),
      ),
    );
  }

  Color _parseColorSafely(String? colorString) {
    if (colorString == null) return Colors.black;

    try {
      final formattedColor = colorString.startsWith('0x')
          ? colorString.substring(2)
          : (colorString.startsWith('#')
              ? colorString.substring(1)
              : colorString);

      final normalizedColor =
          formattedColor.length == 6 ? 'FF$formattedColor' : formattedColor;

      return Color(int.parse(normalizedColor, radix: 16));
    } catch (e) {
      return Colors.black; // Return a default color on error
    }
  }

// Helper function to parse font weight
  FontWeight _parseFontWeight(String weight) {
    final Map<String, FontWeight> weights = {
      'normal': FontWeight.normal,
      'bold': FontWeight.bold,
      'w100': FontWeight.w100,
      'w200': FontWeight.w200,
      'w300': FontWeight.w300,
      'w400': FontWeight.w400,
      'w500': FontWeight.w500,
      'w600': FontWeight.w600,
      'w700': FontWeight.w700,
      'w800': FontWeight.w800,
      'w900': FontWeight.w900,
    };
    return weights[weight.toLowerCase()] ?? FontWeight.normal;
  }

// Helper function to parse text alignment
  TextAlign _parseTextAlign(String align) {
    final Map<String, TextAlign> alignments = {
      'left': TextAlign.left,
      'right': TextAlign.right,
      'center': TextAlign.center,
      'justify': TextAlign.justify,
      'start': TextAlign.start,
      'end': TextAlign.end,
    };
    return alignments[align.toLowerCase()] ?? TextAlign.center;
  }

  Color parseColor(String colorString) {
    try {
      // Normalize the input to ensure it's in the correct format
      final formattedColor = colorString.startsWith('0x')
          ? colorString.substring(2) // Remove '0x' prefix
          : (colorString.startsWith('#')
              ? colorString.substring(1)
              : colorString);

      // Ensure the string is exactly 8 characters long for ARGB
      final normalizedColor = formattedColor.length == 6
          ? 'FF$formattedColor' // Add alpha channel if missing
          : formattedColor;

      // Parse and return a Color object
      return Color(int.parse(normalizedColor, radix: 16));
    } catch (e) {
      // Log or throw a meaningful error
      throw FormatException('Invalid color format: $colorString');
    }
  }

  Widget _buildAdaptiveQuote(Template template, ElementStyle elementStyle,
      bool isGridView, BoxConstraints constraints, double maxHeight) {
    return FutureBuilder<Quote?>(
      future: controller.getQuoteById(template.composition.quoteId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox.shrink();

        final quoteText =
            snapshot.data?.translations[controller.currentLanguage.value]?.text;
        if (quoteText == null) return const SizedBox.shrink();

        final quoteFontSize = _calculateDynamicFontSize(
            quoteText,
            constraints.maxWidth * 0.85,
            isGridView ? 16 : 18,
            elementStyle.typography.fontSize.min,
            elementStyle.typography.fontSize.max);
        final textSpan = TextSpan(
          text: quoteText,
          style: TextStyle(
            fontSize: quoteFontSize,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        );
        final textPainter = TextPainter(
          text: textSpan,
          textDirection: TextDirection.ltr,
          maxLines: 3,
        );
        textPainter.layout(maxWidth: constraints.maxWidth);
        final lineHeight =
            textPainter.height / textPainter.computeLineMetrics().length;
        final maxLines = (maxHeight / lineHeight).floor();

        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: AutoSizeText(
                quoteText,
                style: TextStyle(
                  fontSize: quoteFontSize,
                  color: Colors.white,
                  height: 1.5,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(0, 1),
                      blurRadius: 2,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
                maxLines: maxLines,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildInteractiveElements(Template template) {
    return Positioned(
      top: 8,
      right: 8,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildActionButton(
            Icons.share_rounded,
            () => controller.shareTemplate(template),
          ),
          const SizedBox(width: 8),
          _buildActionButton(
            Icons.favorite_border_rounded,
            () => controller.toggleFavorite(template),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, VoidCallback onTap) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Material(
          color: Colors.black.withOpacity(0.3),
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 20,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(0, 1),
                    blurRadius: 2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
