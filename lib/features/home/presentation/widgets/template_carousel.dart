import 'package:buddha_greet/features/home/presentation/widgets/morning_template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:card_swiper/card_swiper.dart';
import 'dart:ui';

import '../../../../shared/models/entities/background_collection/background_collection.dart';
import '../../../../shared/models/entities/qoute_collection/qoute_collection.dart';
import '../../../../shared/models/entities/template_collection/template_collection.dart';
import '../controllers/home_controller.dart';

class TemplateCarousel extends GetView<HomeController> {
  const TemplateCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => _buildCarouselContent(constraints)),
          ],
        );
      },
    );
  }

  Widget _buildCarouselContent(BoxConstraints constraints) {
    if (controller.isLoading.value) {
      return _buildLoadingState();
    }

    // Calculate height based on 16:9 aspect ratio
    final carouselWidth = constraints.maxWidth;
    final carouselHeight = (carouselWidth * 4) / 5;

    return Container(
      height: carouselHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Swiper(
        itemBuilder: (context, index) => _buildCarouselItem(
          controller.featuredTemplates[index],
          BoxConstraints(
            maxWidth: carouselWidth * 0.85, // Account for viewportFraction
            maxHeight: carouselHeight,
          ),
        ),
        itemCount: controller.featuredTemplates.length,
        pagination: const SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            activeColor: Colors.amber,
            color: Colors.amber,
          ),
        ),
        scale: 0.9,
        viewportFraction: 0.85,
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

  Widget _buildCarouselItem(Template template, BoxConstraints constraints) {
    return LayoutBuilder(
      builder: (context, itemConstraints) {
        return Hero(
          tag: 'carousel_${template.uuid}',
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => controller.onTemplateSelected(template),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    _buildBackground(template),
                    _buildContentOverlay(template, itemConstraints),
                    _buildInteractiveElements(template),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBackground(Template template) {
    return FutureBuilder<Background?>(
      future: controller.getBackgroundById(template.composition.backgroundId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const ColoredBox(
            color: Colors.black12,
          );
        }

        final background = snapshot.data!;
        return AdaptiveBackgroundWidget(
          background: background,
          template: template,
          constraints: BoxConstraints.expand(),
        );
      },
    );
  }

  Widget _buildContentOverlay(Template template, BoxConstraints constraints) {
    final currentLanguage = controller.currentLanguage.value;
    final translation = template.translations[currentLanguage];
    if (translation == null) return const SizedBox.shrink();

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.1),
            Colors.black.withOpacity(0.5),
          ],
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AdaptiveTitleWidget(
            title: translation.title,
            template: template,
            isGridView: false,
            maxHeight: constraints.maxHeight * 0.3,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: _buildQuoteContent(template, constraints),
          ),
        ],
      ),
    );
  }

  Widget _buildQuoteContent(Template template, BoxConstraints constraints) {
    return FutureBuilder<Quote?>(
      future: controller.getQuoteById(template.composition.quoteId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox.shrink();

        final quote = snapshot.data!;
        final quoteText = quote.translations[controller.currentLanguage.value]?.text;
        if (quoteText == null) return const SizedBox.shrink();

        return AdaptiveQuoteWidget(
          quoteText: quoteText,
          template: template,
          isGridView: false,
          maxHeight: constraints.maxHeight * 0.5,
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