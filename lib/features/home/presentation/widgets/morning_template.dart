import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shared/models/entities/background_collection/background_collection.dart';
import '../../../../shared/models/entities/qoute_collection/quote/quote.dart';
import '../../../../shared/models/entities/template_collection/template_collection.dart';
import '../controllers/home_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';



class LayoutConfig {
  // Grid configuration
  static const double maxGridItemWidth = 400.0; // Maximum width for grid items
  static const double minGridItemWidth = 300.0; // Minimum width for grid items
  static const gridRatio = "4:5";  // Aspect ratio for grid items
  
  // List configuration
  static const double maxListItemWidth = 500.0; // Maximum width for list items
  static const double listWidthPercentage = 0.85; // List item width as percentage of screen
  static const listRatio = "4:5";  // Aspect ratio for list items
  
  static double getAspectRatioValue(bool isGridView) {
    final ratio = isGridView ? gridRatio : listRatio;
    final parts = ratio.split(":");
    return double.parse(parts[0]) / double.parse(parts[1]);
  }
  
  static double calculateItemHeight(double width, bool isGridView) {
    return width / getAspectRatioValue(isGridView);
  }

  static BoxConstraints getItemConstraints(BoxConstraints screenConstraints, bool isGridView) {
    if (isGridView) {
      final idealWidth = (screenConstraints.maxWidth - 32) / 2; // 2 columns with padding
      final width = idealWidth.clamp(minGridItemWidth, maxGridItemWidth);
      return BoxConstraints(
        maxWidth: width,
        maxHeight: calculateItemHeight(width, true)
      );
    } else {
      final width = (screenConstraints.maxWidth * listWidthPercentage)
          .clamp(0.0, maxListItemWidth);
      return BoxConstraints(
        maxWidth: width,
        maxHeight: calculateItemHeight(width, false)
      );
    }
  }
}

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

  Widget _buildAdaptiveContent(BoxConstraints constraints) {
    if (controller.isLoading.value) {
      return _buildLoadingState();
    }

    final template = controller.selectedTemplate.value;
    final transitionDuration = 
        template?.styleConfig?.common?.animations?.transitionDuration ?? 300;

    return SizedBox(
      height: _calculateContentHeight(constraints),
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: transitionDuration),
        child: _buildAdaptiveContentH(constraints),
      ),
    );
  }

    double _calculateContentHeight(BoxConstraints constraints) {
    final itemCount = controller.morningTemplates.length;
    final spacing = _calculateDynamicSpacing(
      constraints.maxWidth
    );
    
    if (controller.isGridView.value) {
      final columns = _calculateOptimalColumns(
        constraints.maxWidth
      );
      final rows = (itemCount / columns).ceil();
      final itemWidth = _calculateItemWidth(constraints.maxWidth, columns, spacing);
      final itemHeight = LayoutConfig.calculateItemHeight(itemWidth, true);
      
      return (rows * (itemHeight + spacing)) + spacing;
    } else {
      final itemWidth = constraints.maxWidth - (spacing * 2);
      final itemHeight = LayoutConfig.calculateItemHeight(itemWidth, false);
      return (itemCount * (itemHeight + spacing)) + spacing;
    }
  }
   double _calculateItemWidth(double totalWidth, int columns, double spacing) {
    return (totalWidth - (spacing * (columns + 1))) / columns;
  }




  Widget _buildAdaptiveContentH(BoxConstraints constraints) {
    if (controller.isLoading.value) {
      return _buildLoadingState();
    }

    final template = controller.selectedTemplate.value;
    final transitionDuration = 
        template?.styleConfig?.common?.animations?.transitionDuration ?? 300;

    return AnimatedSwitcher(
      duration: Duration(milliseconds: transitionDuration),
      child: controller.isGridView.value
          ? _buildIntelligentGrid(constraints)
          : _buildIntelligentList(constraints),
    );
  }

  Widget _buildIntelligentGrid(BoxConstraints constraints) {
    final spacing = _calculateDynamicSpacing(constraints.maxWidth);
    final columns = _calculateOptimalColumns(constraints.maxWidth);
    final itemConstraints = LayoutConfig.getItemConstraints(constraints, true);
    
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: (itemConstraints.maxWidth * columns) + (spacing * (columns + 1))
        ),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: EdgeInsets.all(spacing),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  mainAxisSpacing: spacing,
                  crossAxisSpacing: spacing,
                  childAspectRatio: LayoutConfig.getAspectRatioValue(true),
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => _buildTemplateCard(
                    template: controller.morningTemplates[index],
                    constraints: itemConstraints,
                    isGridView: true,
                  ),
                  childCount: controller.morningTemplates.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIntelligentList(BoxConstraints constraints) {
    final spacing = _calculateDynamicSpacing(constraints.maxWidth);
    final itemConstraints = LayoutConfig.getItemConstraints(constraints, false);

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: itemConstraints.maxWidth + spacing * 2),
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(spacing),
          itemCount: controller.morningTemplates.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(bottom: spacing),
            child: Center(
              child: _buildTemplateCard(
                template: controller.morningTemplates[index],
                constraints: itemConstraints,
                isGridView: false,
              ),
            ),
          ),
        ),
      ),
    );
  }

  double _calculateDynamicSpacing(double width) {
    if (width <= 600) return 8;
    if (width <= 1200) return 16;
    return 24;
  }

  int _calculateOptimalColumns(double width) {
    if (width <= 600) return 2;
    if (width <= 900) return 3;
    if (width <= 1200) return 4;
    return 5;
  }

  Widget _buildTemplateCard({
    required Template template,
    required BoxConstraints constraints,
    required bool isGridView,
  }) {
    // ... existing _buildTemplateCard implementation ...
    return Container(
      constraints: constraints,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              _buildBackgroundWithEffects(template, constraints),
              _buildTemplateContent(template, isGridView, constraints),
              _buildInteractiveElements(template),
            ],
          ),
        ),
      ),
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


  // Widget _buildIntelligentList(BoxConstraints constraints) {
  //   final template = controller.selectedTemplate.value;
  //   final layoutConfig = template?.layoutConfig;
  //   final breakpoints = layoutConfig?.breakpoints;
  //   final spacing = _calculateDynamicSpacing(constraints.maxWidth, breakpoints);
  //   final itemHeight = constraints.maxWidth * 0.8;

  //   return ListView.builder(
  //     shrinkWrap: true,
  //     physics: const NeverScrollableScrollPhysics(),
  //     padding: EdgeInsets.all(spacing),
  //     itemCount: controller.morningTemplates.length,
  //     itemBuilder: (context, index) => Padding(
  //       padding: EdgeInsets.only(bottom: spacing),
  //       child: _buildTemplateCard(
  //         template: controller.morningTemplates[index],
  //         constraints: BoxConstraints(
  //           maxWidth: constraints.maxWidth - (spacing * 2),
  //           maxHeight: itemHeight,
  //         ),
  //         isGridView: false,
  //       ),
  //     ),
  //   );
  // }

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

  Widget _buildBackgroundWithEffects(
      Template template, BoxConstraints constraints) {
    return SizedBox.expand(
      child: FutureBuilder<Background?>(
        future: controller.getBackgroundById(template.composition.backgroundId),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const ColoredBox(
              color: Colors.black12,
              child: Center(child: CircularProgressIndicator()),
            );
          }

          final background = snapshot.data!;
          print(
              "_buildBackgroundWithEffects template uuid= ${template.uuid} background  uuid= ${background.uuid} , type= ${background.type} ,image= ${background.visualData.image?.original}");

          return AdaptiveBackgroundWidget(
              background: background,
              template: template,
              constraints: constraints);
        },
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
    print(
        "_buildTemplateContent translation ${translation} template.translations ${template.translations.entries.toList()} ");
    if (translation == null) return const SizedBox.shrink();

    final spacing = template.layoutConfig?.portrait?.layoutAdjustments?.spacing
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
                child: AdaptiveTitleWidget(
              title: translation.title,
              template: template,
              isGridView: isGridView,
              maxHeight: constraints.maxHeight * 0.4,
            )
                // _buildAdaptiveTitle(
                //   title: translation.title,
                //   template: template,
                //   isGridView: isGridView,
                //   constraints: constraints,
                //   maxHeight: constraints.maxHeight * 0.4,
                // ),
                ),
          ),
          SizedBox(height: spacing),
          Flexible(
            flex: 6,
            fit: FlexFit.tight,
            child: _buildAdaptiveQuote(
              template,
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
  // double _calculateDynamicSpacing(
  //     double width, LayoutBreakpoints? breakpoints) {
  //   if (breakpoints == null) return 12;

  //   if (width <= breakpoints.small) return 12;
  //   if (width <= breakpoints.medium) return 16;
  //   return 20;
  // }

  // int _calculateOptimalColumns(double width, LayoutBreakpoints? breakpoints) {
  //   if (breakpoints == null) return 2;

  //   if (width <= breakpoints.small) return 2;
  //   if (width <= breakpoints.medium) return 3;
  //   if (width <= breakpoints.large) return 4;
  //   return 5;
  // }

  // double _calculateItemWidth(double totalWidth, int columns, double spacing) {
  //   return (totalWidth - (spacing * (columns + 1))) / columns;
  // }

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

  Widget _buildAdaptiveQuote(Template template, bool isGridView,
      BoxConstraints constraints, double maxHeight) {
    return FutureBuilder<Quote?>(
      future: controller.getQuoteById(template.composition.quoteId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox.shrink();

        final quoteText =
            snapshot.data?.translations[controller.currentLanguage.value]?.text;
        if (quoteText == null) return const SizedBox.shrink();

        return AdaptiveQuoteWidget(
          quoteText: quoteText,
          template: template,
          isGridView: isGridView,
          maxHeight: maxHeight,
        );

        // final elementStyle = template.styleConfig.title.orDefault;
        // final typography = elementStyle.typography.orDefault;
        // final colors = elementStyle.colors.orDefault;

        // final quoteFontSize = _calculateDynamicFontSize(
        //     quoteText,
        //     constraints.maxWidth * 0.85,
        //     isGridView ? 16 : 18,
        //     elementStyle.typography.fontSize.min,
        //     elementStyle.typography.fontSize.max);
        // final textSpan = TextSpan(
        //   text: quoteText,
        //   style: TextStyle(
        //     fontSize: quoteFontSize,
        //     fontWeight: FontWeight.w600,
        //     color: Colors.white,
        //   ),
        // );
        // final textPainter = TextPainter(
        //   text: textSpan,
        //   textDirection: TextDirection.ltr,
        //   maxLines: 3,
        // );
        // textPainter.layout(maxWidth: constraints.maxWidth);
        // final lineHeight =
        //     textPainter.height / textPainter.computeLineMetrics().length;
        // final maxLines = (maxHeight / lineHeight).floor();

        // return ClipRRect(
        //   borderRadius: BorderRadius.circular(8),
        //   child: BackdropFilter(
        //     filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        //     child: Container(
        //       padding: const EdgeInsets.all(8),
        //       decoration: BoxDecoration(
        //         color: Colors.black.withOpacity(0.2),
        //         borderRadius: BorderRadius.circular(8),
        //       ),
        //       child: AutoSizeText(
        //         quoteText,
        //         style: TextStyle(
        //           fontSize: quoteFontSize,
        //           color: Colors.white,
        //           height: 1.5,
        //           shadows: [
        //             Shadow(
        //               color: Colors.black.withOpacity(0.5),
        //               offset: const Offset(0, 1),
        //               blurRadius: 2,
        //             ),
        //           ],
        //         ),
        //         textAlign: TextAlign.center,
        //         maxLines: maxLines,
        //         overflow: TextOverflow.ellipsis,
        //       ),
        //     ),
        //   ),
        // );
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

class DefaultStyles {
  static ElementStyle get defaultElementStyle => ElementStyle(
        typography: defaultTypography,
        colors: defaultColors,
      );

  static ElementTypography get defaultTypography => ElementTypography(
        fontFamily: 'Roboto',
        fontSize: defaultFontSize,
        fontWeight: 'normal',
        letterSpacing: 0.0,
        lineHeight: 1.2,
        textAlign: 'center',
        textTransform: 'none',
      );

  static ElementFontSize get defaultFontSize => ElementFontSize(
        base: 16.0,
        min: 12.0,
        max: 24.0,
        scale: 1.0,
      );

  static ElementStyleColors get defaultColors => ElementStyleColors(
        text: '#FFFFFF',
        shadow: defaultShadow,
      );

  static ElementShadow get defaultShadow => ElementShadow(
        color: '#000000',
        offset: defaultShadowOffset,
        blurRadius: 2.0,
        opacity: 0.5,
      );

  static ShadowOffset get defaultShadowOffset => ShadowOffset(
        x: 0,
        y: 1,
      );
}

// Extension method for nullable ElementStyle
extension ElementStyleExtension on ElementStyle? {
  ElementStyle get orDefault => this ?? DefaultStyles.defaultElementStyle;
}

extension ElementDefaultTypographyExtension on ElementTypography? {
  ElementTypography get orDefault =>
      this ?? DefaultStyles.defaultElementStyle.typography;
}

extension ElementDefaultElementStyleColorsExtension on ElementStyleColors? {
  ElementStyleColors get orDefault =>
      this ?? DefaultStyles.defaultElementStyle.colors;
}

class DefaultLayoutConfigs {
  static LayoutSafeArea get defaultSafeArea => LayoutSafeArea(
        top: 0,
        bottom: 0,
      );

  static LayoutBlurSigma get defaultBlurSigma => LayoutBlurSigma(
        x: LayoutSigmaValue(base: 0, min: 0, max: 0),
        y: LayoutSigmaValue(base: 0, min: 0, max: 0),
      );

  static LayoutBlur get defaultBlur => LayoutBlur(
        enabled: false,
        sigma: defaultBlurSigma,
        quality: 'none',
      );

  static LayoutBorderRadius get defaultBorderRadius => LayoutBorderRadius(
        base: 8,
        min: 4,
        max: 16,
        scaleFactor: 1,
      );

  static LayoutOpacityConfig get defaultOpacity => LayoutOpacityConfig(
        base: 0.5,
        min: 0.0,
        max: 1.0,
      );

  static LayoutBackground get defaultBackground => LayoutBackground(
        opacity: defaultOpacity,
        color: '#000000',
      );

  static LayoutVisualEffects get defaultVisualEffects => LayoutVisualEffects(
        blur: defaultBlur,
        borderRadius: defaultBorderRadius,
        background: defaultBackground,
      );

  static ElementLayout get defaultElementLayout => ElementLayout(
        layoutPosition: LayoutPosition(x: 0, y: 0),
        size: LayoutSize(width: 0, height: 0),
        padding: 8.0,
        safeArea: defaultSafeArea,
        visualEffects: defaultVisualEffects,
      );
}

// Extension methods for layout components
extension LayoutSafeAreaExtension on LayoutSafeArea? {
  LayoutSafeArea get orDefault => this ?? DefaultLayoutConfigs.defaultSafeArea;
}

extension LayoutBlurExtension on LayoutBlur? {
  LayoutBlur get orDefault => this ?? DefaultLayoutConfigs.defaultBlur;
}

extension LayoutBorderRadiusExtension on LayoutBorderRadius? {
  LayoutBorderRadius get orDefault =>
      this ?? DefaultLayoutConfigs.defaultBorderRadius;
}

extension LayoutBackgroundExtension on LayoutBackground? {
  LayoutBackground get orDefault =>
      this ?? DefaultLayoutConfigs.defaultBackground;
}

extension LayoutVisualEffectsExtension on LayoutVisualEffects? {
  LayoutVisualEffects get orDefault =>
      this ?? DefaultLayoutConfigs.defaultVisualEffects;
}

extension ElementLayoutExtension on ElementLayout? {
  ElementLayout get orDefault =>
      this ?? DefaultLayoutConfigs.defaultElementLayout;
}

class DefaultStyleConfig {
  static StyleConfig get defaultStyleConfig => StyleConfig(
        common: defaultCommonStyle,
        title: DefaultStyles.defaultElementStyle,
        quote: DefaultStyles.defaultElementStyle,
        actionButtons: defaultActionButtons,
      );

  static CommonStyle get defaultCommonStyle => CommonStyle(
        gradientOverlay: defaultGradientOverlay,
        animations: defaultAnimations,
      );

  static CommonGradientOverlay get defaultGradientOverlay => CommonGradientOverlay(
        enabled: false,
        stops: [
          CommonGradientStop(
            color: '#000000',
            position: 0.0,
          ),
          CommonGradientStop(
            color: '#FFFFFF',
            position: 1.0,
          ),
        ],
        angle: 0,
      );

  static CommonAnimations get defaultAnimations => CommonAnimations(
        transitionDuration: 300,
        hover: defaultHoverAnimation,
      );

  static CommonHoverAnimation get defaultHoverAnimation => CommonHoverAnimation(
        scale: 1.05,
        duration: 200,
      );

  static ActionButtons get defaultActionButtons => ActionButtons(
        size: 44.0,
        background: defaultActionBackground,
        blur: defaultActionBlur,
        shadow: defaultActionShadow,
      );

  static ActionBackground get defaultActionBackground => ActionBackground(
        opacity: 0.8,
        color: '#000000',
      );

  static ActionBlur get defaultActionBlur => ActionBlur(
        enabled: true,
        sigma: defaultActionSigma,
      );

  static ActionSigma get defaultActionSigma => ActionSigma(
        x: 2.0,
        y: 2.0,
      );

  static ActionShadow get defaultActionShadow => ActionShadow(
        color: '#000000',
        offset: defaultActionOffset,
        blurRadius: 4.0,
      );

  static ActionOffset get defaultActionOffset => ActionOffset(
        x: 0.0,
        y: 2.0,
      );
}

// Extension method for StyleConfig
extension StyleConfigExtension on StyleConfig? {
  StyleConfig get orDefault => this ?? DefaultStyleConfig.defaultStyleConfig;
}

// Helper methods
class LayoutHelpers {
  static Color parseColorSafely(String? colorString) {
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
      return Colors.black;
    }
  }

  static FontWeight parseFontWeight(String weight) {
    const weights = {
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

  static TextAlign parseTextAlign(String align) {
    const alignments = {
      'left': TextAlign.left,
      'right': TextAlign.right,
      'center': TextAlign.center,
      'justify': TextAlign.justify,
      'start': TextAlign.start,
      'end': TextAlign.end,
    };
    return alignments[align.toLowerCase()] ?? TextAlign.center;
  }

  static double calculateDynamicFontSize(
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
}

class AdaptiveTitleWidget extends StatelessWidget {
  final String title;
  final Template template;
  final bool isGridView;
  final double maxHeight;

  const AdaptiveTitleWidget({
    Key? key,
    required this.title,
    required this.template,
    required this.isGridView,
    required this.maxHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => _buildAdaptiveTitle(
        constraints: constraints,
      ),
    );
  }

  Widget _buildAdaptiveTitle({
    required BoxConstraints constraints,
  }) {
    // Get style configuration with fallbacks
    final titleStyle = template.styleConfig.orDefault.title.orDefault;
    final typography = titleStyle.typography.orDefault;
    final colors = titleStyle.colors.orDefault;

    // Calculate base font size with proper bounds
    final baseFontSize = isGridView ? 16.0 : 18.0;
    final minFontSize = typography.fontSize.min.clamp(12.0, baseFontSize);
    final maxFontSize = typography.fontSize.max.clamp(baseFontSize, 32.0);

    // Calculate dynamic font size based on available width and text length
    final fontSize = _calculateOptimalFontSize(
      text: title,
      maxWidth: constraints.maxWidth * 0.85,
      baseSize: baseFontSize,
      minSize: minFontSize,
      maxSize: maxFontSize,
      maxLines: 3,
    );

    // Get layout configuration
    final layoutConfig = (template.layoutConfig?.portrait?.title).orDefault;
    final visualEffects = layoutConfig.visualEffects.orDefault;
    final blur = visualEffects.blur.orDefault;
    final borderRadius = visualEffects.borderRadius.orDefault;
    
    // Create text style with proper shadow handling
    final textStyle = _createTextStyle(
      typography: typography,
      colors: colors,
      fontSize: fontSize,
    );

    // Calculate optimal line height and max lines
    final textMetrics = _calculateTextMetrics(
      text: title,
      style: textStyle,
      maxWidth: constraints.maxWidth,
      maxHeight: maxHeight,
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(_calculateDynamicBorderRadius(borderRadius)),
      child: BackdropFilter(
        filter: _createBlurEffect(blur),
        child: Container(
          padding: _calculatePadding(layoutConfig),
          child: AutoSizeText(
            title,
            style: textStyle,
            maxLines: textMetrics.maxLines,
            overflow: TextOverflow.ellipsis,
            textAlign: LayoutHelpers.parseTextAlign(typography.textAlign),
            minFontSize: minFontSize,
            maxFontSize: maxFontSize,
            stepGranularity: 0.5,
          ),
        ),
      ),
    );
  }

  double _calculateOptimalFontSize({
    required String text,
    required double maxWidth,
    required double baseSize,
    required double minSize,
    required double maxSize,
    required int maxLines,
  }) {
    final approximateCharsPerLine = maxWidth / (baseSize * 0.6);
    final totalChars = text.length;
    final averageCharsPerLine = totalChars / maxLines;

    if (averageCharsPerLine <= approximateCharsPerLine) {
      return baseSize;
    }

    final scaleFactor = approximateCharsPerLine / averageCharsPerLine;
    return (baseSize * scaleFactor).clamp(minSize, maxSize);
  }

  TextStyle _createTextStyle({
    required ElementTypography typography,
    required ElementStyleColors colors,
    required double fontSize,
  }) {
    final shadows = <Shadow>[];
    if (colors.shadow != null) {
      shadows.add(Shadow(
        color: LayoutHelpers.parseColorSafely(colors.shadow.color)
            .withOpacity(colors.shadow.opacity),
        offset: Offset(
          colors.shadow.offset.x,
          colors.shadow.offset.y,
        ),
        blurRadius: colors.shadow.blurRadius,
      ));
    }

    return TextStyle(
      fontFamily: typography.fontFamily,
      fontSize: fontSize,
      fontWeight: LayoutHelpers.parseFontWeight(typography.fontWeight),
      letterSpacing: typography.letterSpacing,
      color: LayoutHelpers.parseColorSafely(colors.text),
      height: typography.lineHeight,
      shadows: shadows,
    );
  }

  ({int maxLines, double lineHeight}) _calculateTextMetrics({
    required String text,
    required TextStyle style,
    required double maxWidth,
    required double maxHeight,
  }) {
    try {
      final textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        textDirection: TextDirection.ltr,
        maxLines: 3,
      );
      textPainter.layout(maxWidth: maxWidth);

      final metrics = textPainter.computeLineMetrics();
      double lineHeight;
      
      if (metrics.isNotEmpty) {
        lineHeight = metrics.first.height;
      } else {
        lineHeight = style.fontSize! * (style.height ?? 1.2);
      }

      final availableLines = (maxHeight / lineHeight).floor();
      final maxLines = availableLines.clamp(1, 3);

      return (maxLines: maxLines, lineHeight: lineHeight);
    } catch (e) {
      // Fallback values if calculation fails
      return (maxLines: 2, lineHeight: style.fontSize! * 1.2);
    }
  }

  double _calculateDynamicBorderRadius(LayoutBorderRadius borderRadius) {
    return (borderRadius.base.clamp(
      borderRadius.min,
      borderRadius.max,
    ) * borderRadius.scaleFactor).clamp(4.0, 16.0);
  }

  EdgeInsets _calculatePadding(ElementLayout layout) {
    final basePadding = layout.padding ?? 8.0;
    return EdgeInsets.symmetric(
      horizontal: basePadding,
      vertical: basePadding * 0.67,
    );
  }

  ImageFilter _createBlurEffect(LayoutBlur blur) {
    if (!blur.enabled) {
      return ImageFilter.blur(sigmaX: 0, sigmaY: 0);
    }

    return ImageFilter.blur(
      sigmaX: blur.sigma.x.base.clamp(
        blur.sigma.x.min,
        blur.sigma.x.max,
      ),
      sigmaY: blur.sigma.y.base.clamp(
        blur.sigma.y.min,
        blur.sigma.y.max,
      ),
    );
  }
}


class AdaptiveQuoteWidget extends StatelessWidget {
  final String quoteText;
  final Template template;
  final bool isGridView;
  final double maxHeight;

  const AdaptiveQuoteWidget({
    Key? key,
    required this.quoteText,
    required this.template,
    required this.isGridView,
    required this.maxHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => _buildAdaptiveQuote(
        constraints: constraints,
      ),
    );
  }

  Widget _buildAdaptiveQuote({
    required BoxConstraints constraints,
  }) {
    // Get style configuration with fallbacks
    final quoteStyle = template.styleConfig.orDefault.quote.orDefault;
    final typography = quoteStyle.typography.orDefault;
    final colors = quoteStyle.colors.orDefault;

    // Calculate base font size with proper bounds
    final baseFontSize = isGridView ? 14.0 : 16.0;
    final minFontSize = typography.fontSize.min.clamp(10.0, baseFontSize);
    final maxFontSize = typography.fontSize.max.clamp(baseFontSize, 28.0);

    // Calculate dynamic font size based on available width and text length
    final fontSize = _calculateOptimalFontSize(
      text: quoteText,
      maxWidth: constraints.maxWidth * 0.85,
      baseSize: baseFontSize,
      minSize: minFontSize,
      maxSize: maxFontSize,
      maxLines: 5,
    );

    // Get layout configuration
    final layoutConfig = (template.layoutConfig?.portrait?.quote).orDefault;
    final visualEffects = layoutConfig.visualEffects.orDefault;
    final blur = visualEffects.blur.orDefault;
    final borderRadius = visualEffects.borderRadius.orDefault;
    final background = visualEffects.background.orDefault;

    // Create text style with proper shadow handling
    final textStyle = _createTextStyle(
      typography: typography,
      colors: colors,
      fontSize: fontSize,
    );

    // Calculate optimal line height and max lines
    final textMetrics = _calculateTextMetrics(
      text: quoteText,
      style: textStyle,
      maxWidth: constraints.maxWidth,
      maxHeight: maxHeight,
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(_calculateDynamicBorderRadius(borderRadius)),
      child: BackdropFilter(
        filter: _createBlurEffect(blur),
        child: Container(
          padding: _calculatePadding(layoutConfig),
          decoration: BoxDecoration(
            color: _createBackgroundColor(background),
            borderRadius: BorderRadius.circular(_calculateDynamicBorderRadius(borderRadius)),
          ),
          child: AutoSizeText(
            quoteText,
            style: textStyle,
            maxLines: textMetrics.maxLines,
            overflow: TextOverflow.ellipsis,
            textAlign: LayoutHelpers.parseTextAlign(typography.textAlign),
            minFontSize: minFontSize,
            maxFontSize: maxFontSize,
            stepGranularity: 0.5,
          ),
        ),
      ),
    );
  }

  double _calculateOptimalFontSize({
    required String text,
    required double maxWidth,
    required double baseSize,
    required double minSize,
    required double maxSize,
    required int maxLines,
  }) {
    final approximateCharsPerLine = maxWidth / (baseSize * 0.6);
    final totalChars = text.length;
    final averageCharsPerLine = totalChars / maxLines;

    if (averageCharsPerLine <= approximateCharsPerLine) {
      return baseSize;
    }

    final scaleFactor = approximateCharsPerLine / averageCharsPerLine;
    return (baseSize * scaleFactor).clamp(minSize, maxSize);
  }

  TextStyle _createTextStyle({
    required ElementTypography typography,
    required ElementStyleColors colors,
    required double fontSize,
  }) {
    final shadows = <Shadow>[];
    if (colors.shadow != null) {
      shadows.add(Shadow(
        color: LayoutHelpers.parseColorSafely(colors.shadow.color)
            .withOpacity(colors.shadow.opacity),
        offset: Offset(
          colors.shadow.offset.x,
          colors.shadow.offset.y,
        ),
        blurRadius: colors.shadow.blurRadius,
      ));
    }

    return TextStyle(
      fontFamily: typography.fontFamily,
      fontSize: fontSize,
      fontWeight: LayoutHelpers.parseFontWeight(typography.fontWeight),
      letterSpacing: typography.letterSpacing,
      color: LayoutHelpers.parseColorSafely(colors.text),
      height: typography.lineHeight,
      shadows: shadows,
    );
  }

  ({int maxLines, double lineHeight}) _calculateTextMetrics({
    required String text,
    required TextStyle style,
    required double maxWidth,
    required double maxHeight,
  }) {
    try {
      final textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        textDirection: TextDirection.ltr,
        maxLines: 5,
      );
      textPainter.layout(maxWidth: maxWidth);

      final metrics = textPainter.computeLineMetrics();
      double lineHeight;
      
      if (metrics.isNotEmpty) {
        lineHeight = metrics.first.height;
      } else {
        lineHeight = style.fontSize! * (style.height ?? 1.2);
      }

      // Ensure lineHeight is valid
      if (lineHeight <= 0 || lineHeight.isInfinite || lineHeight.isNaN) {
        lineHeight = style.fontSize! * 1.2;
      }

      final availableLines = (maxHeight / lineHeight).floor();
      final maxLines = availableLines.clamp(1, 5);

      return (maxLines: maxLines, lineHeight: lineHeight);
    } catch (e) {
      // Fallback values if calculation fails
      return (maxLines: 3, lineHeight: style.fontSize! * 1.2);
    }
  }

  double _calculateDynamicBorderRadius(LayoutBorderRadius borderRadius) {
    return (borderRadius.base.clamp(
      borderRadius.min,
      borderRadius.max,
    ) * borderRadius.scaleFactor).clamp(4.0, 16.0);
  }

  EdgeInsets _calculatePadding(ElementLayout layout) {
    final basePadding = layout.padding ?? 8.0;
    return EdgeInsets.symmetric(
      horizontal: basePadding,
      vertical: basePadding * 0.75, // Slightly larger vertical padding for quotes
    );
  }

  ImageFilter _createBlurEffect(LayoutBlur blur) {
    if (!blur.enabled) {
      return ImageFilter.blur(sigmaX: 0, sigmaY: 0);
    }

    return ImageFilter.blur(
      sigmaX: blur.sigma.x.base.clamp(
        blur.sigma.x.min,
        blur.sigma.x.max,
      ),
      sigmaY: blur.sigma.y.base.clamp(
        blur.sigma.y.min,
        blur.sigma.y.max,
      ),
    );
  }

  Color _createBackgroundColor(LayoutBackground background) {
    return LayoutHelpers.parseColorSafely(background.color).withOpacity(
      background.opacity.base.clamp(
        background.opacity.min,
        background.opacity.max,
      ),
    );
  }
}

class AdaptiveBackgroundWidget extends StatelessWidget {
  final Background background;
  final Template template;
  final BoxConstraints constraints;

  const AdaptiveBackgroundWidget({
    Key? key,
    required this.background,
    required this.template,
    required this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBackgroundWithEffects();
  }

  Widget _buildBackgroundWithEffects() {
    switch (background.type) {
      case 'image':
        return _buildImageBackground();
      case 'gradient':
        return _buildGradientBackground();
      case 'color':
        return _buildColorBackground();
      default:
        return _buildFallbackBackground();
    }
  }

  Widget _buildImageBackground() {
    final imageData = background.visualData.image;
    if (imageData == null) return _buildFallbackBackground();

    final variant = _chooseBestImageVariant(imageData.variants);
    final imagePath = variant?.path ?? imageData.original;

    Widget imageWidget = Image.asset(
      imagePath,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      errorBuilder: (context, error, stackTrace) => _buildFallbackBackground(),
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) return child;
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: frame != null
              ? child
              : Image.asset(imageData.placeholder, fit: BoxFit.cover),
        );
      },
    );

    // Apply visual effects
    final effects = background.visualEffects;
    if (effects != null) {
      if (effects.opacity != 1.0) {
        imageWidget = Opacity(
          opacity: effects.opacity.clamp(0.0, 1.0),
          child: imageWidget,
        );
      }

      if (effects.blur > 0) {
        imageWidget = ImageFiltered(
          imageFilter: ImageFilter.blur(
            sigmaX: effects.blur.clamp(0.0, 20.0),
            sigmaY: effects.blur.clamp(0.0, 20.0),
          ),
          child: imageWidget,
        );
      }

      if (effects.blendMode != 'normal') {
        imageWidget = ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            _parseBlendMode(effects.blendMode),
          ),
          child: imageWidget,
        );
      }
    }

    return SizedBox.expand(child: imageWidget);
  }

  Widget _buildGradientBackground() {
    final gradientData = background.visualData.gradient;
    if (gradientData == null) return _buildFallbackBackground();

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientData.colors
              .map((color) => LayoutHelpers.parseColorSafely(color))
              .toList(),
          stops: gradientData.stops
              .map((stop) => stop.position.clamp(0.0, 1.0))
              .toList(),
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          transform: GradientRotation(gradientData.angle * pi / 180),
        ),
      ),
    );
  }

  Widget _buildColorBackground() {
    final colorData = background.visualData.color;
    if (colorData == null) return _buildFallbackBackground();

    return Container(
      color: LayoutHelpers.parseColorSafely(colorData.color),
    );
  }

  Widget _buildFallbackBackground() {
    return Container(
      color: Colors.grey[300],
      child: const Icon(Icons.image_not_supported, color: Colors.white70),
    );
  }

  BackgroundImageVariant? _chooseBestImageVariant(
      List<BackgroundImageVariant> variants) {
    if (variants.isEmpty) return null;

    final targetWidth =
        constraints.maxWidth * WidgetsBinding.instance.window.devicePixelRatio;

    final sortedVariants = List<BackgroundImageVariant>.from(variants)
      ..sort((a, b) => a.width.compareTo(b.width));

    for (final variant in sortedVariants) {
      if (variant.width >= targetWidth) return variant;
    }

    return sortedVariants.last;
  }

  BlendMode _parseBlendMode(String blendMode) {
    switch (blendMode.toLowerCase()) {
      case 'multiply':
        return BlendMode.multiply;
      case 'screen':
        return BlendMode.screen;
      case 'overlay':
        return BlendMode.overlay;
      default:
        return BlendMode.srcOver;
    }
  }
}

