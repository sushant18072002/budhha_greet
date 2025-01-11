import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/models/entities/background.dart';
import '../../../../shared/models/entities/category.dart';
import '../../../../shared/models/entities/quote.dart';
import '../../../../shared/models/entities/template.dart';
import '../controllers/home_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MorningTemplatesWidget extends GetView<HomeController> {
  const MorningTemplatesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          Obx(() => _buildContent(constraints)),
        ],
      );
    });
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
          Text(
            'Good Morning Images',
            style: Get.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.brown[800],
              letterSpacing: 0.2,
            ),
          ),
          _buildViewToggle(),
        ],
      ),
    );
  }

  Widget _buildViewToggle() {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: Colors.amber[50],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: controller.toggleViewMode,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(
                controller.isGridView.value ? Icons.grid_view : Icons.view_list,
                color: Colors.amber[600],
                size: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BoxConstraints constraints) {
    if (controller.isMorningTemplatesLoading.value) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.amber[600]!),
          ),
        ),
      );
    }

    return controller.isGridView.value
        ? _buildGridView(constraints)
        : _buildListView(constraints);
  }

  Widget _buildGridView(BoxConstraints constraints) {
    final crossAxisCount = _calculateGridCrossAxisCount(constraints.maxWidth);
    final spacing = _calculateSpacing(constraints.maxWidth);
    final horizontalPadding = spacing;
    final availableWidth = constraints.maxWidth - (horizontalPadding * 2);
    final itemWidth =
        (availableWidth - (spacing * (crossAxisCount - 1))) / crossAxisCount;
    final itemHeight = itemWidth * (16 / 9);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: spacing,
          crossAxisSpacing: spacing,
          childAspectRatio: 9 / 16,
        ),
        itemCount: controller.morningTemplates.length,
        itemBuilder: (context, index) => _buildTemplateCard(
          template: controller.morningTemplates[index],
          isGridView: true,
          maxWidth: itemWidth,
          maxHeight: itemHeight,
          constraints: constraints,
        ),
      ),
    );
  }

  Widget _buildListView(BoxConstraints constraints) {
    final spacing = _calculateSpacing(constraints.maxWidth);
    final horizontalPadding = spacing;
    final availableWidth = constraints.maxWidth - (horizontalPadding * 2);
    final itemHeight = availableWidth * (9 / 16);

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      itemCount: controller.morningTemplates.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(bottom: spacing),
        child: _buildTemplateCard(
          template: controller.morningTemplates[index],
          isGridView: false,
          maxWidth: availableWidth,
          maxHeight: itemHeight,
          constraints: constraints,
        ),
      ),
    );
  }

  Widget _buildTemplateCard({
    required Template template,
    required bool isGridView,
    required double maxWidth,
    required double maxHeight,
    required BoxConstraints constraints,
  }) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: maxWidth,
        maxHeight: maxHeight,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildBackgroundImage(template),
            _buildGradientOverlay(isGridView),
            _buildTemplateContent(template, isGridView, constraints),
            _buildInteractionLayer(template),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundImage(Template template) {
    return Hero(
      tag: 'template_${template.uuid}',
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
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            child: Image.asset(
              background.visualData.image?.original ?? '',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.grey[300],
                child: const Center(
                  child:
                      Icon(Icons.broken_image, color: Colors.white, size: 48),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGradientOverlay(bool isGridView) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.4),
            Colors.transparent,
            Colors.black.withOpacity(isGridView ? 0.7 : 0.5),
          ],
          stops: const [0.0, 0.3, 1.0],
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

    final isSmallScreen = constraints.maxWidth < 600;
    final padding = isGridView ? 12.0 : 16.0;

    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTitle(translation.title, isSmallScreen, isGridView),
          const Spacer(),
          _buildQuote(template, isSmallScreen, isGridView),
        ],
      ),
    );
  }

  Widget _buildTitle(String title, bool isSmallScreen, bool isGridView) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: isGridView ? 8 : 12,
            vertical: isGridView ? 6 : 8,
          ),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            title,
            style: Get.textTheme.titleLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: isSmallScreen ? 18 : 22,
              letterSpacing: 0.3,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: const Offset(0, 1),
                  blurRadius: 2,
                ),
              ],
            ),
            textAlign: TextAlign.center,
            maxLines: isGridView ? 2 : 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

  Widget _buildQuote(Template template, bool isSmallScreen, bool isGridView) {
    return FutureBuilder<Quote?>(
      future: controller.getQuoteById(template.composition.quoteId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox.shrink();

        final quoteText =
            snapshot.data?.translations[controller.currentLanguage.value]?.text;
        if (quoteText == null) return const SizedBox.shrink();

        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: isGridView ? 8 : 12,
                vertical: isGridView ? 6 : 8,
              ),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                quoteText,
                style: Get.textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                  fontSize: isSmallScreen ? 14 : 16,
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
                maxLines: isGridView ? 3 : 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildInteractionLayer(Template template) {
    return Stack(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => controller.onTemplateSelected(template),
            splashColor: Colors.white24,
            highlightColor: Colors.white10,
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildActionButton(
                icon: Icons.share_rounded,
                onTap: () => controller.shareTemplate(template),
              ),
              const SizedBox(width: 8),
              _buildActionButton(
                icon: Icons.favorite_border_rounded,
                onTap: () => controller.toggleFavorite(template),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              customBorder: const CircleBorder(),
              child: Padding(
                padding: const EdgeInsets.all(8),
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
      ),
    );
  }

  double _calculateSpacing(double width) {
    if (width <= 600) return 12;
    if (width <= 900) return 16;
    return 20;
  }

  int _calculateGridCrossAxisCount(double width) {
    if (width <= 600) return 2;
    if (width <= 900) return 3;
    if (width <= 1200) return 4;
    return 5;
  }
}

// Helper extension for responsive calculations
extension ResponsiveExtension on num {
  double get responsive => this * (Get.width / 375);
}
