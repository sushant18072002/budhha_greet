import 'package:buddha_greet/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shared/models/entities/template_collection/template_collection.dart';
import '../controllers/home_controller.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_text_styles.dart';
import 'package:card_swiper/card_swiper.dart';

import '../widgets/categories_section.dart';
import '../widgets/language_selector.dart';
import '../widgets/template_carousel.dart';
import '../widgets/morning_template.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray50,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: controller.refreshData,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 16),
                  _buildCarousel(context),
                  const SizedBox(height: 16),
                  _buildCategories(),
                  const SizedBox(height: 16),
                  IntelligentTemplateGrid()
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildCarousel(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      return TemplateCarousel();
    });
  }

  Widget _buildCategories() {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      return CategoriesSection();
    });
  }

  // return Column(
  //   crossAxisAlignment: CrossAxisAlignment.start,
  //   children: [
  //     Text('Categories', style: AppTextStyles.sectionTitle),
  //     const SizedBox(height: 16),
  //     GridView.builder(
  //       shrinkWrap: true,
  //       physics: const NeverScrollableScrollPhysics(),
  //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 2,
  //         crossAxisSpacing: 16,
  //         mainAxisSpacing: 16,
  //         childAspectRatio: 2,
  //       ),
  //       itemCount: controller.categories.length,
  //       itemBuilder: (context, index) {
  //         return _buildCategoryCard(controller.categories[index]);
  //       },
  //     ),
  //   ],
  // );

  // In HomeScreen class
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('header.app_title'.tr, style: AppTextStyles.appTitle),
        Row(
          children: [
            const LanguageSelector(), // Add this line
            const SizedBox(width: 16),
            // Icon(Icons.notifications_none, color: AppColors.amber600, size: 24),
            // const SizedBox(width: 8),
            Icon(Icons.search, color: AppColors.amber600, size: 24),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(color: AppColors.amber100, width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, 'nav.home'.tr, true),
          GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.creator),
              child: _buildNavItem(Icons.add, 'nav.create'.tr, false)),
          GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.library),
              child: _buildNavItem(Icons.book, 'nav.library'.tr, false)),
          _buildNavItem(Icons.person, 'nav.profile'.tr, false),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    final color = isActive ? AppColors.amber600 : AppColors.amber400;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTextStyles.bottomNavLabel.copyWith(color: color),
        ),
      ],
    );
  }

  void _showGreetingDialog(Template card) {
    print("Oucch Click me");
    showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                '',
                height: 350,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _handleQuickShare(card);
                  },
                  child: const Text('Quick Share'),
                ),
                SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _navigateToCustomize(card);
                  },
                  child: const Text('Customize'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _handleQuickShare(Template card) {
    // Implement share functionality
  }

  void _navigateToCustomize(Template card) {
    // Navigate to customization screen
  }
}
