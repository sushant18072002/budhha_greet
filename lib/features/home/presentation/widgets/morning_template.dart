import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/models/entities/background.dart';
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
            child: Text(
              'Good Morning Images',
              style: Get.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.brown[800],
                letterSpacing: 0.2,
              ),
            ),
          ),
          _buildViewModeToggle(),
        ],
      ),
    );
  }

  Widget _buildViewModeToggle() {
    return Obx(() {
      final isGridView = controller.isGridView.value;
      return Material(
        color: Colors.amber.shade50,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: controller.toggleViewMode,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(
              isGridView ? Icons.grid_view : Icons.view_list,
              color: Colors.amber[600],
              size: 24,
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

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: controller.isGridView.value
          ? _buildIntelligentGrid(constraints)
          : _buildIntelligentList(constraints),
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
    final spacing = _calculateDynamicSpacing(constraints.maxWidth);
    final columns = _calculateOptimalColumns(constraints.maxWidth);
    final itemWidth =
        _calculateItemWidth(constraints.maxWidth, columns, spacing);
    final itemHeight = itemWidth * (16 / 9);

    return Padding(
      padding: EdgeInsets.all(spacing),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns,
          mainAxisSpacing: spacing,
          crossAxisSpacing: spacing,
          childAspectRatio: 9 / 16,
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

  Widget _buildIntelligentList(BoxConstraints constraints) {
    final spacing = _calculateDynamicSpacing(constraints.maxWidth);
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

  Widget _buildTemplateCard({
    required Template template,
    required BoxConstraints constraints,
    required bool isGridView,
  }) {
    final double = isGridView
        ? constraints.maxWidth * (16 / 9) // Grid view aspect ratio
        : constraints.maxWidth * 0.8;
    return Hero(
      tag: 'template_${template.uuid}',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => controller.onTemplateSelected(template),
          child: SizedBox(
            height: double,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  _buildBackgroundWithEffects(template),
                  _buildGradientOverlay(isGridView),
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
    return FutureBuilder<Background?>(
      future: controller.getBackgroundById(template.composition.backgroundId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const ColoredBox(
            color: Colors.black12,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        return ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.7),
              ],
              stops: const [0.5, 1.0],
            ).createShader(bounds);
          },
          blendMode: BlendMode.darken,
          child: Image.asset(
            snapshot.data!.visualData.image?.original ?? '',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              color: Colors.grey[300],
              child: const Icon(Icons.broken_image, color: Colors.white70),
            ),
          ),
        );
      },
    );
  }

  Widget _buildGradientOverlay(bool isGridView) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(isGridView ? 0.7 : 0.5),
          ],
          stops: const [0.4, 1.0],
        ),
      ),
    );
  }

  Widget _buildTemplateContent(
    Template template,
    bool isGridView,
    BoxConstraints constraints,
  ) {
    final translation = template.translations[controller.currentLanguage.value];
    if (translation == null) return const SizedBox.shrink();

    final availableWidth = constraints.maxWidth * 0.9;
    final titleFontSize = _calculateDynamicFontSize(
      translation.title,
      availableWidth,
      isGridView ? 24 : 28,
    );

    return Padding(
      padding: EdgeInsets.all(isGridView ? 12 : 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 4, // 40% of space
            fit: FlexFit.tight,
            child: Center(
              child: _buildAdaptiveTitle(
                translation.title,
                constraints,
                titleFontSize,
                constraints.maxHeight * 0.4, // Explicit height constraint
              ),
            ),
          ),
          const SizedBox(height: 16), // Fixed spacing
          Flexible(
            flex: 6, // 60% of space
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

  Widget _buildAdaptiveTitle(String title,BoxConstraints constraints , double fontSize, double maxHeight) {
    final textSpan = TextSpan(
          text: title,
          style: TextStyle(
            fontSize: fontSize,
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
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: AutoSizeText(
            title,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: 0.3,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: const Offset(0, 1),
                  blurRadius: 2,
                ),
              ],
            ),
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
          ),
        ),
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

        final quoteFontSize = _calculateDynamicFontSize(
          quoteText,
          constraints.maxWidth * 0.85,
          isGridView ? 16 : 18,
        );
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

  // Intelligent Layout Algorithms
  double _calculateDynamicSpacing(double width) {
    if (width <= 600) return 12;
    if (width <= 900) return 16;
    return 20;
  }

  int _calculateOptimalColumns(double width) {
    if (width <= 600) return 2;
    if (width <= 900) return 3;
    if (width <= 1200) return 4;
    return 5;
  }

  double _calculateItemWidth(double totalWidth, int columns, double spacing) {
    return (totalWidth - (spacing * (columns + 1))) / columns;
  }

  double _calculateDynamicFontSize(
    String text,
    double maxWidth,
    double baseSize,
  ) {
    const minSize = 14.0;
    const maxSize = 32.0;

    // Approximate characters that can fit in the given width
    final approxCharWidth = baseSize * 0.6;
    final maxChars = maxWidth / approxCharWidth;

    if (text.length <= maxChars) {
      return baseSize.clamp(minSize, maxSize);
    }

    // Reduce font size based on text length
    final reduction = (text.length / maxChars) * 0.5;
    return (baseSize / reduction).clamp(minSize, maxSize);
  }
}
