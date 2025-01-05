import 'package:buddha_greet/features/home/data/models/template/template.dart';
import 'package:buddha_greet/features/image_detail/data/models/background_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_text_styles.dart';
import '../controllers/home_controller.dart';

class MorningTemplatesWidget extends GetView<HomeController> {
  const MorningTemplatesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
       // const SizedBox(height: 16),
        _buildTemplateGrid(),
      ],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Good Morning Images',
            style: AppTextStyles.headlineMedium,
          ),
          Obx(
             ()=>
               IconButton(
                isSelected:  controller.isGridView.value,
                icon: controller.isGridView.value?Icon(
                  Icons.grid_view,
                  color: AppColors.amber600,
                ):Icon(
                  Icons.view_list,
                  color: AppColors.amber600,
                ),
                onPressed: () => controller.toggleViewMode(),
              )
            
          ),
        ],
      ),
    );
  }

  Widget _buildTemplateGrid() {
    return Obx(() => AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: controller.isGridView.value
          ? _buildGridView()
          : _buildListView(),
    ));
  }

  Widget _buildGridView() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: controller.morningTemplates.length,
      itemBuilder: (context, index) => _buildTemplateCard(
        controller.morningTemplates[index],
        isGridView: true,
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.morningTemplates.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: _buildTemplateCard(
          controller.morningTemplates[index],
          isGridView: false,
        ),
      ),
    );
  }

  Widget _buildTemplateCard(Template template, {required bool isGridView}) {
    return Hero(
      tag: 'template-${template.id}',
      child: GestureDetector(
        onTap: () => _showDetailScreen(template),
        child: Container(
          height: isGridView ? null : 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.harmonyPurple.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              fit: StackFit.expand,
              children: [
                _buildTemplateImage(template.backgroundId),
                _buildGradientOverlay(),
                _buildTemplateContent(template),
                _buildShareButton(template),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTemplateImage(String backgroundId) {
  return FutureBuilder<Background?>(
    future: controller.getBackgroundById(backgroundId), // Call your future function here
    builder: (BuildContext context, AsyncSnapshot<Background?> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        // Show shimmer or a placeholder while loading
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey[300], // Placeholder shimmer color
            boxShadow: [
              BoxShadow(
                color: AppColors.amber600.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
        );
      } else if (snapshot.hasError) {
        // Show the error decoration when there's an error
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey[100], // Error placeholder background
            boxShadow: [
              BoxShadow(
                color: AppColors.amber600.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Icon(Icons.error, color: Colors.red), // Optional error icon
          ),
        );
      } else if (snapshot.hasData) {
        // Display the loaded image
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(snapshot.data!.imageUrl!), // Use the loaded image
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.amber600.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
        );
      }

      // Fallback for unexpected state
      return SizedBox();
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
            Colors.transparent,
            Colors.black.withOpacity(0.7),
          ],
        ),
      ),
    );
  }

  Widget _buildTemplateContent(Template template) {
    return Positioned(
      bottom: 16,
      left: 16,
      right: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            template.title[controller.currentLanguage]??"",
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              template.categories.first,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShareButton(Template template) {
    return Positioned(
      top: 8,
      right: 8,
      child: IconButton(
        icon: const Icon(
          Icons.share_rounded,
          color: AppColors.white,
          size: 24,
        ),
        onPressed: () => _handleQuickShare(template),
      ),
    );
  }

  void _showDetailScreen(Template template) {
    Get.toNamed(
      '/template-detail',
      arguments: template,
      //transition: Transition.fadeIn,
    );
  }

  void _handleQuickShare(Template template) {
    // Implement share functionality
   // controller.shareTemplate(template);
  }
}
