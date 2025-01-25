import 'dart:math';
import 'dart:ui';
import 'package:buddha_greet/shared/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../shared/models/entities/background_collection/background_collection.dart';
import '../../../../shared/models/entities/qoute_collection/quote/quote.dart';
import '../../../../shared/models/entities/template_collection/template_collection.dart';
import '../../../../shared/theme/app_colors.dart';
import '../controllers/home_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';

class EnhancedHeader extends GetView<HomeController> {
  final VoidCallback onViewModeToggle;

  const EnhancedHeader({
    Key? key,
    required this.onViewModeToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeaderContent(),
          _buildBottomDivider(),
        ],
      ),
    );
  }

  Widget _buildHeaderContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      child: Row(
        children: [
          _buildTitle(),
          const Spacer(),
          _buildViewModeToggle(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: AppColors.amber50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.wb_sunny_rounded,
            color: AppColors.amber600,
            size: 24,
          ),
        ),
        
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Morning Blessing',
              style: AppTextStyles.headlineSmall,
            ),
            const SizedBox(height: 4),
            Text(
              'Start your day with inspiration',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.amber600.withOpacity(0.8),
                letterSpacing: 0.1,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildViewModeToggle() {
    return Material(
      color: AppColors.amber50,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          HapticFeedback.lightImpact();
          onViewModeToggle();
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
            child: Obx(
              () => Icon(
                controller.isGridView.value
                    ? Icons.grid_view
                    : Icons.view_agenda_outlined,
                key: ValueKey<bool>(controller.isGridView.value),
                color: AppColors.amber600,
                size: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }

Widget _buildBottomDivider() {
  return Obx(() {
    if (controller.isGridView.value) {
      return Row(
        children: [
          const Spacer(flex: 1), // Spacer for better readability
          Expanded(
            flex: 3,
            child: Container(
              height: 4,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: AppColors.amber100,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const Spacer(flex: 2), // Spacer for better readability
          Expanded(
            flex: 3,
            child: Container(
              height: 4,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: AppColors.amber100,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const Spacer(flex: 1),
        ],
      );
    } else {
      return Container(
        height: 4,
        margin: const EdgeInsets.symmetric(horizontal: 120),
        decoration: BoxDecoration(
          color: AppColors.amber100,
          borderRadius: BorderRadius.circular(2),
        ),
      );
    }
  });
}
}

class LayoutConfig {
  // Grid configuration
  static const double maxGridItemWidth = 400.0; // Maximum width for grid items
  static const double minGridItemWidth = 300.0; // Minimum width for grid items
  static const gridRatio = "4:5"; // Aspect ratio for grid items

  // List configuration
  static const double maxListItemWidth = 500.0; // Maximum width for list items
  static const double listWidthPercentage =
      0.85; // List item width as percentage of screen
  static const listRatio = "4:5"; // Aspect ratio for list items

  static double getAspectRatioValue(bool isGridView) {
    final ratio = isGridView ? gridRatio : listRatio;
    final parts = ratio.split(":");
    return double.parse(parts[0]) / double.parse(parts[1]);
  }

  static double calculateItemHeight(double width, bool isGridView) {
    return width / getAspectRatioValue(isGridView);
  }

  static BoxConstraints getItemConstraints(
      BoxConstraints screenConstraints, bool isGridView) {
    if (isGridView) {
      final idealWidth =
          (screenConstraints.maxWidth - 32) / 2; // 2 columns with padding
      final width = idealWidth.clamp(minGridItemWidth, maxGridItemWidth);
      return BoxConstraints(
          maxWidth: width, maxHeight: calculateItemHeight(width, true));
    } else {
      final width = (screenConstraints.maxWidth * listWidthPercentage)
          .clamp(0.0, maxListItemWidth);
      return BoxConstraints(
          maxWidth: width, maxHeight: calculateItemHeight(width, false));
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
            EnhancedHeader(
              onViewModeToggle: controller.toggleViewMode,
            ),
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

    // Calculate optimal content height with safety margin
    final contentHeight = _calculateContentHeight(constraints) + 32.0;

    return LayoutBuilder(
      builder: (context, boxConstraints) {
        return Container(
          constraints: BoxConstraints(
            minHeight: 200, // Minimum height to prevent layout jumps
            maxHeight: contentHeight,
          ),
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: transitionDuration),
            child: _buildResponsiveLayout(boxConstraints),
          ),
        );
      },
    );
  }

  double _calculateContentHeight(BoxConstraints constraints) {
    final itemCount = controller.morningTemplates.length;
    final spacing = _calculateDynamicSpacing(constraints.maxWidth);

    if (controller.isGridView.value) {
      final columns = _calculateOptimalColumns(constraints.maxWidth);
      final rows = (itemCount / columns).ceil();
      final itemWidth =
          _calculateItemWidth(constraints.maxWidth, columns, spacing);
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

  Widget _buildResponsiveLayout(BoxConstraints constraints) {
  final isWideScreen = constraints.maxWidth > 900;
  //final padding = _calculateDynamicPadding(constraints.maxWidth);
  
  return Container(
   // padding: EdgeInsets.symmetric(horizontal: padding),
    child: controller.isGridView.value
        ? _buildEnhancedGrid(constraints)
        : _buildIntelligentList(constraints),
  );
}

Widget _buildEnhancedGrid(BoxConstraints constraints) {
  final spacing = _calculateDynamicSpacing(constraints.maxWidth);
  final columns = _calculateOptimalColumns(constraints.maxWidth);
  final itemConstraints = _getOptimizedItemConstraints(constraints, true);
  
  return ScrollConfiguration(
    behavior: ScrollBehavior(),
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
              (context, index) => _buildEnhancedTemplateCard(
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
  );
}

Widget _buildEnhancedTemplateCard({
  required Template template,
  required BoxConstraints constraints,
  required bool isGridView,
}) {
  return Hero(
    tag: 'template_${template.uuid}',
    child: Material(
      elevation: 8,
      shadowColor: Colors.black26,
      borderRadius: BorderRadius.circular(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: GestureDetector(
          onTap: (){
             Get.toNamed(AppRoutes.template, arguments: template);
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              _buildOptimizedBackground(template, constraints),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                child: _buildEnhancedContent(template, isGridView, constraints),
              ),
              //_buildAccessibleControls(template),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _buildOptimizedBackground(Template template, BoxConstraints constraints) {
  return ShaderMask(
    shaderCallback: (bounds) => LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.transparent,
        Colors.black.withOpacity(0.3),
      ],
    ).createShader(bounds),
    blendMode: BlendMode.darken,
    child: _buildBackgroundWithEffects(template, constraints),
  );
}

Widget _buildEnhancedContent(
  Template template,
  bool isGridView,
  BoxConstraints constraints,
) {
  final currentLanguage = controller.currentLanguage.value;
    final translation = template.translations[currentLanguage];
    print(
        "_buildTemplateContent translation ${translation} template.translations ${template.translations.entries.toList()} ");
    if (translation == null) return const SizedBox.shrink();

  return SafeArea(
    minimum: EdgeInsets.all(isGridView ? 16 : 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: AdaptiveTitleWidget(title: translation.title, template: template, isGridView: isGridView,maxHeight: constraints.maxHeight * 0.4,),
        ),
        const SizedBox(height: 8),
        Expanded(
          flex: 6,
          child: _buildAdaptiveQuote(template, isGridView, constraints,
              constraints.maxHeight * 0.6),
        ),
      ],
    ),
  );
}

BoxConstraints _getOptimizedItemConstraints(
  BoxConstraints screenConstraints,
  bool isGridView,
) {
  final minWidth = isGridView ? 280.0 : 320.0;
  final maxWidth = isGridView ? 400.0 : 500.0;
  
  double width = isGridView
      ? ((screenConstraints.maxWidth - 48) / _calculateOptimalColumns(screenConstraints.maxWidth))
          .clamp(minWidth, maxWidth)
      : (screenConstraints.maxWidth * 0.85).clamp(minWidth, maxWidth);
  
  return BoxConstraints(
    minWidth: width,
    maxWidth: width,
    minHeight: width * LayoutConfig.getAspectRatioValue(isGridView),
    maxHeight: width * LayoutConfig.getAspectRatioValue(isGridView),
  );
}

  Widget _buildIntelligentList(BoxConstraints constraints) {
    final spacing = _calculateDynamicSpacing(constraints.maxWidth);
    final itemConstraints = LayoutConfig.getItemConstraints(constraints, false);

    return Center(
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: itemConstraints.maxWidth + spacing * 2),
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
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.template, arguments: template);

      },
      child: Container(
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

  static CommonGradientOverlay get defaultGradientOverlay =>
      CommonGradientOverlay(
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
      builder: (context, constraints) {
        // Get style configuration with fallbacks
        final titleStyle = template.styleConfig.orDefault.title.orDefault;
        final typography = titleStyle.typography.orDefault;
        final colors = titleStyle.colors.orDefault;

        // Calculate base font size based on view type
        final baseFontSize =28.0;
        final minFontSize = typography.fontSize.min.clamp(24.0, baseFontSize);
        final maxFontSize = typography.fontSize.max.clamp(baseFontSize, 32.0);

        // Calculate optimal font size based on available space
        final fontSize = _calculateOptimalFontSize(
          text: title,
          maxWidth: constraints.maxWidth * 0.85, // Account for padding
          maxHeight: maxHeight,
          baseSize: baseFontSize,
          minSize: minFontSize,
          maxSize: maxFontSize,
        );

        // Create text style with proper shadow handling
        final textStyle = _createTextStyle(
          typography: typography,
          colors: colors,
          fontSize: fontSize,
        );

        return Container(
          padding: _calculatePadding(isGridView),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: AutoSizeText(
              title,
              style: textStyle,
              maxLines: isGridView ? 2 : 3,
              overflow: TextOverflow.ellipsis,
              textScaleFactor: 1.5,
              textAlign: LayoutHelpers.parseTextAlign(typography.textAlign),
            ),
          ),
        );
      },
    );
  }

  double _calculateOptimalFontSize({
    required String text,
    required double maxWidth,
    required double maxHeight,
    required double baseSize,
    required double minSize,
    required double maxSize,
  }) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: baseSize,
          fontWeight: FontWeight.normal,
        ),
      ),
      textDirection: TextDirection.ltr,
      maxLines: isGridView ? 2 : 3,
    );

    textPainter.layout(maxWidth: maxWidth);

    // Calculate the scaling factor based on available space
    final widthScale = maxWidth / textPainter.width;
    final heightScale = maxHeight / textPainter.height;
    final scaleFactor = widthScale < heightScale ? widthScale : heightScale;

    // Adjust font size based on scaling factor
    final scaledFontSize = baseSize * scaleFactor;

    // Ensure the font size stays within the min and max limits
    return scaledFontSize.clamp(minSize, maxSize);
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

  EdgeInsets _calculatePadding(bool isGridView) {
    final basePadding = isGridView ? 8.0 : 16.0;
    return EdgeInsets.symmetric(
      horizontal: basePadding,
      vertical: basePadding * 0.5,
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
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth;
        final textScaleFactor = MediaQuery.of(context).textScaleFactor;
        
        return _buildOptimizedQuoteContainer(
          constraints: constraints,
          textScaleFactor: textScaleFactor,
          availableWidth: availableWidth,
        );
      },
    );
  }

  Widget _buildOptimizedQuoteContainer({
    required BoxConstraints constraints,
    required double textScaleFactor,
    required double availableWidth,
  }) {
    final quoteStyle = template.styleConfig.orDefault.quote.orDefault;
    final typography = quoteStyle.typography.orDefault;
    final colors = quoteStyle.colors.orDefault;

    // Dynamic sizing calculations
    final baseFontSize = _calculateBaseFontSize(isGridView);
    final scaledFontLimits = _calculateFontSizeLimits(
      typography: typography,
      baseFontSize: baseFontSize,
      textScaleFactor: textScaleFactor,
    );

    // Calculate optimal font size based on container constraints
    final fontSize = _calculateOptimalFontSize(
      text: quoteText,
      maxWidth: availableWidth * 0.85, // Account for padding
      baseSize: scaledFontLimits.baseSize,
      minSize: scaledFontLimits.minSize,
      maxSize: scaledFontLimits.maxSize,
    );

    final layoutConfig = (template.layoutConfig?.portrait?.quote).orDefault;
    final visualEffects = layoutConfig.visualEffects.orDefault;
    
    return ClipRRect(
      borderRadius: _calculateBorderRadius(visualEffects.borderRadius),
      child: BackdropFilter(
        filter: _createBlurEffect(visualEffects.blur.orDefault),
        child: Container(
          padding: _calculateDynamicPadding(layoutConfig, availableWidth),
          decoration: _createContainerDecoration(visualEffects),
          child: _buildAdaptiveTextContent(
            typography: typography,
            colors: colors,
            fontSize: fontSize,
            constraints: constraints,
          ),
        ),
      ),
    );
  }

  Widget _buildAdaptiveTextContent({
    required ElementTypography typography,
    required ElementStyleColors colors,
    required double fontSize,
    required BoxConstraints constraints,
  }) {
    return LayoutBuilder(
      builder: (context, textConstraints) {
        final textStyle = _createOptimizedTextStyle(
          typography: typography,
          colors: colors,
          fontSize: fontSize,
        );

        final maxLines = _calculateOptimalLines(
          textStyle: textStyle,
          maxHeight: maxHeight,
          text: quoteText,
        );

        return AutoSizeText(
          quoteText,
          style: textStyle,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          textAlign: LayoutHelpers.parseTextAlign(typography.textAlign),
         minFontSize: _roundToStepGranularity(fontSize * 0.8, 0.5), // Allow slight reduction if needed
          maxFontSize:  _roundToStepGranularity(fontSize , 0.5),
          stepGranularity: 0.5,
        );
      },
    );
  }

  double _roundToStepGranularity(double value, double stepGranularity) {
  return (value / stepGranularity).round() * stepGranularity;
}


  double _calculateBaseFontSize(bool isGridView) {
    // Base sizes adjusted for grid vs list view
    return isGridView ? 14.0 : 16.0;
  }

  ({double baseSize, double minSize, double maxSize}) _calculateFontSizeLimits({
    required ElementTypography typography,
    required double baseFontSize,
    required double textScaleFactor,
  }) {
    // Scale font sizes based on device text scaling
    final scaledBase = baseFontSize * textScaleFactor;
    final minSize = (typography.fontSize.min * textScaleFactor).clamp(10.0, scaledBase);
    final maxSize = (typography.fontSize.max * textScaleFactor).clamp(scaledBase, 24.0);

    return (
      baseSize: scaledBase,
      minSize: minSize,
      maxSize: maxSize,
    );
  }

  double _calculateOptimalFontSize({
    required String text,
    required double maxWidth,
    required double baseSize,
    required double minSize,
    required double maxSize,
  }) {
    // Calculate optimal font size based on text length and container width
    final approximateCharsPerLine = maxWidth / (baseSize * 0.6);
    final textLength = text.length;
    final targetLines = isGridView ? 3 : 4;
    
    if (textLength <= approximateCharsPerLine * targetLines) {
      return baseSize.clamp(minSize, maxSize);
    }

    final scaleFactor = (approximateCharsPerLine * targetLines) / textLength;
    return (baseSize * scaleFactor).clamp(minSize, maxSize);
  }

  int _calculateOptimalLines({
    required TextStyle textStyle,
    required double maxHeight,
    required String text,
  }) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: textStyle),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    )..layout();

    final lineHeight = textPainter.height;
    final maxPossibleLines = (maxHeight / lineHeight).floor();
    
    // Limit lines based on view mode
    return maxPossibleLines.clamp(1, isGridView ? 3 : 5);
  }

  TextStyle _createOptimizedTextStyle({
    required ElementTypography typography,
    required ElementStyleColors colors,
    required double fontSize,
  }) {
    final textColor = LayoutHelpers.parseColorSafely(colors.text);
    final shadows = _createTextShadows(colors.shadow);

    return TextStyle(
      fontFamily: typography.fontFamily,
      fontSize: fontSize,
      fontWeight: LayoutHelpers.parseFontWeight(typography.fontWeight),
      letterSpacing: typography.letterSpacing,
      height: typography.lineHeight,
      color: textColor,
      shadows: shadows,
    );
  }

  List<Shadow> _createTextShadows(ElementShadow? shadow) {
    if (shadow == null) return [];

    return [
      Shadow(
        color: LayoutHelpers.parseColorSafely(shadow.color)
            .withOpacity(shadow.opacity),
        offset: Offset(shadow.offset.x, shadow.offset.y),
        blurRadius: shadow.blurRadius,
      ),
    ];
  }

  BorderRadius _calculateBorderRadius(LayoutBorderRadius borderRadius) {
    final radius = (borderRadius.base * borderRadius.scaleFactor)
        .clamp(borderRadius.min, borderRadius.max);
    return BorderRadius.circular(radius);
  }

  EdgeInsets _calculateDynamicPadding(
    ElementLayout layout,
    double availableWidth,
  ) {
    final basePadding = layout.padding ?? 8.0;
    final horizontalScale = (availableWidth / 400).clamp(0.8, 1.2);
    
    return EdgeInsets.symmetric(
      horizontal: basePadding * horizontalScale,
      vertical: basePadding * horizontalScale * 0.75,
    );
  }

  BoxDecoration _createContainerDecoration(LayoutVisualEffects effects) {
    final background = effects.background.orDefault;
    
    return BoxDecoration(
      color: LayoutHelpers.parseColorSafely(background.color)
          .withOpacity(background.opacity.base),
      borderRadius: _calculateBorderRadius(effects.borderRadius),
    );
  }

  ImageFilter _createBlurEffect(LayoutBlur blur) {
    if (!blur.enabled) return ImageFilter.blur(sigmaX: 0, sigmaY: 0);

    return ImageFilter.blur(
      sigmaX: blur.sigma.x.base.clamp(blur.sigma.x.min, blur.sigma.x.max),
      sigmaY: blur.sigma.y.base.clamp(blur.sigma.y.min, blur.sigma.y.max),
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
