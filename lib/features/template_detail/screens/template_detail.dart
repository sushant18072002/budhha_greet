import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

import '../../../shared/models/entities/background_collection/background_collection.dart';
import '../../../shared/models/entities/qoute_collection/qoute_collection.dart';
import '../../../shared/models/entities/template_collection/template_collection.dart';
import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_text_styles.dart';
import '../../home/presentation/widgets/morning_template.dart';
import '../controller/template_details_controller.dart';

class TemplateDetailsScreen extends GetView<TemplateDetailsController> {
  final Template template;
  final GlobalKey _sliverAppBarKey = GlobalKey();

  TemplateDetailsScreen({
    Key? key,
    required this.template,
  }) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          _buildSliverAppBar(context),
          SliverToBoxAdapter(
            child: _buildContent(context),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomActionBar(),
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * 0.6,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [
          StretchMode.zoomBackground,
          StretchMode.blurBackground,
        ],
        background: RepaintBoundary(
          key: _sliverAppBarKey,
          child: Hero(
            tag: 'template_${template.uuid}',
            child: Stack(
              fit: StackFit.expand,
              children: [
                _buildBackgroundImage(),
                _buildGradientOverlay(),
                _buildTemplateContent(),
              ],
            ),
          ),
        ),
      ),
      leading: _buildBackButton(),
      actions: [
        _buildShareButton(),
        _buildFavoriteButton(),
      ],
    );
  }
  
   Widget _buildBackButton() {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
      onPressed: () => Get.back(),
    );
  }

  Widget _buildShareButton() {
    return IconButton(
      icon: const Icon(Icons.share_rounded, color: Colors.white),
      onPressed: _captureAndShareSliverAppBar,
    );
  }
  

  Future<void> _captureAndShareSliverAppBar() async {
    try {
      // Capture the widget as an image
      final RenderRepaintBoundary boundary = _sliverAppBarKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      final ui.Image image = await boundary.toImage();
      final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      final Uint8List imageBytes = byteData!.buffer.asUint8List();

      // Save the image to a temporary file
      final tempDir = await getTemporaryDirectory();
      final file = await File('${tempDir.path}/sliver_app_bar.png').writeAsBytes(imageBytes);
      // Share the image with a message
      await Share.shareXFiles(
        [XFile(file.path)],
        text: 'Good Morning',
      );
    } catch (e) {
      print('Error capturing and sharing image: $e');
    }
  }


  Widget _buildFavoriteButton() {
    return Obx(() {
      final isFavorite = controller.isFavorite.value;
      return IconButton(
        icon: Icon(
          isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
          color: isFavorite ? Colors.red : Colors.white,
        ),
        onPressed: () => controller.toggleFavorite(template),
      );
    });
  }

  Widget _buildBackgroundImage() {
    return FutureBuilder<Background?>(
      future: controller.getBackgroundById(template.composition.backgroundId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const ColoredBox(
            color: Colors.black12,
            child: Center(child: CircularProgressIndicator()),
          );
        }

         return AdaptiveBackgroundWidget(
          background: snapshot.data!,
          template: template,
          constraints: const BoxConstraints.expand(),
        );
      },
    );
  }

  Widget _buildGradientOverlay() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.3),
            Colors.black.withOpacity(0.7),
          ],
        ),
      ),
    );
  }

  Widget _buildTemplateContent(
  ) {
    final currentLanguage = controller.currentLanguage.value;
    final translation = template.translations[currentLanguage];
    print(
        "_buildTemplateContent translation $translation template.translations ${template.translations.entries.toList()} ");
    if (translation == null) return const SizedBox.shrink();

    final spacing = template.layoutConfig?.portrait?.layoutAdjustments?.spacing
            .betweenElements ??
        8.0;
    var isGridView =  MediaQuery.of(Get.context!).orientation == Orientation.portrait;
    var constraints= BoxConstraints.expand();
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
            child: _buildQuote(
            
            ),
          ),
        ],
      ),
    );
  }

 

  Widget _buildQuote() {
    return FutureBuilder<Quote?>(
      future: controller.getQuoteById(template.composition.quoteId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox.shrink();

        final quoteText =
            snapshot.data?.translations[controller.currentLanguage.value]?.text;
        if (quoteText == null) return const SizedBox.shrink();
         var isGridView =  MediaQuery.of(Get.context!).orientation == Orientation.portrait;
    var constraints= BoxConstraints.expand();
        return AdaptiveQuoteWidget(
          quoteText: quoteText,
          template: template,
          isGridView: isGridView,
          maxHeight: constraints.maxHeight,
        );
      },
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMetadataSection(),
          const SizedBox(height: 24),
          _buildDetailsSection(),
          const SizedBox(height: 24),
          _buildRelatedTemplatesSection(),
        ],
      ),
    );
  }

  Widget _buildMetadataSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Template Information',
              style: AppTextStyles.headlineMedium,
            ),
            const SizedBox(height: 16),
            _buildMetadataGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildMetadataGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 2.5,
      children: [
        _buildMetadataItem(
          icon: Icons.remove_red_eye_rounded,
          label: 'Views',
          value: '${template.metrics?.views ?? 0}',
        ),
        _buildMetadataItem(
          icon: Icons.favorite_rounded,
          label: 'Favorites',
          value: '${template.metrics?.favorites ?? 0}',
        ),
        _buildMetadataItem(
          icon: Icons.share_rounded,
          label: 'Shares',
          value: '${template.metrics?.shares ?? 0}',
        ),
        _buildMetadataItem(
          icon: Icons.download_rounded,
          label: 'Downloads',
          value: '${template.metrics?.shares ?? 0}',
        ),
      ],
    );
  }

  Widget _buildMetadataItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.amber50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.amber600, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: AppColors.amber600.withOpacity(0.8),
                    fontSize: 12,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About this Template',
              style: AppTextStyles.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(
              template.translations[controller.currentLanguage]?.description ??
                  'No description available.',
              style: AppTextStyles.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRelatedTemplatesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Similar Templates',
          style: AppTextStyles.headlineMedium,
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: Obx(
            () => ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: controller.relatedTemplates.length,
              itemBuilder: (context, index) {
                final relatedTemplate = controller.relatedTemplates[index];
                return _buildRelatedTemplateCard(relatedTemplate);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRelatedTemplateCard(Template relatedTemplate) {
    return GestureDetector(
      onTap: () => controller.openTemplate(relatedTemplate),
      child: Card(
        child: Container(
          width: 160,
          margin: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              fit: StackFit.expand,
              children: [
                _buildRelatedTemplateBackground(relatedTemplate),
                _buildRelatedTemplateOverlay(relatedTemplate),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRelatedTemplateBackground(Template template) {
    return FutureBuilder<Background?>(
      future: controller.getBackgroundById(template.composition.backgroundId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const ColoredBox(color: Colors.black12);
        }

        return AdaptiveBackgroundWidget(
          background: snapshot.data!,
          template: template,
          constraints: const BoxConstraints.expand(),
        );
      },
    );
  }

  Widget _buildRelatedTemplateOverlay(Template template) {
    final translation = template.translations[controller.currentLanguage.value];
    if (translation == null) return const SizedBox.shrink();

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.7),
          ],
        ),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            translation.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActionBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildActionButton(
              icon: Icons.edit_rounded,
              label: 'Customize',
              onTap: () => controller.customizeTemplate(template),
              isPrimary: true,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildActionButton(
              icon: Icons.download_rounded,
              label: 'Download',
              onTap: () => controller.downloadTemplate(template),
              isPrimary: false,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required bool isPrimary,
  }) {
    return Material(
      color: isPrimary ? AppColors.amber600 : AppColors.amber50,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isPrimary ? Colors.white : AppColors.amber600,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: isPrimary ? Colors.white : AppColors.amber600,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}