import 'package:buddha_greet/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_text_styles.dart';

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
          color: AppColors.amber600,
          backgroundColor: AppColors.white,
          onRefresh: controller.refreshData,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(),
                     // const SizedBox(height: 8),
                      TemplateCarousel(),
                      //const SizedBox(height: 8), // Increased spacing
                      CategoriesSection(),
                      const SizedBox(height: 8),
                      const IntelligentTemplateGrid(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'header.app_title'.tr,
            style: AppTextStyles.appTitle,
            semanticsLabel: 'App Title',
          ),
          Row(
            children: [
              const SizedBox(width: 4),
              const LanguageSelector(),
              const SizedBox(width: 4),
              IconButton(
                icon: Icon(Icons.search, color: AppColors.amber600, size: 28),
                onPressed: (){},
                tooltip: 'Search',
                padding: const EdgeInsets.all(4),
                constraints: const BoxConstraints(
                  minWidth: 44,
                  minHeight: 44,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.amber100.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, 'nav.home'.tr, true),
            _buildNavItem(Icons.add, 'nav.create'.tr, false, 
                onTap: () => Get.toNamed(AppRoutes.creator)),
            _buildNavItem(Icons.book, 'nav.library'.tr, false,
                onTap: () => Get.toNamed(AppRoutes.library)),
            _buildNavItem(Icons.person, 'nav.profile'.tr, false),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive, {VoidCallback? onTap}) {
    final color = isActive ? AppColors.amber600 : AppColors.amber400;
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTextStyles.bottomNavLabel.copyWith(
                color: color,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}