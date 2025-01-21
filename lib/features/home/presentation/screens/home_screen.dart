import 'package:buddha_greet/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../shared/widgets/bottom_nav.dart';
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
          //backgroundColor: AppColors.white,
          onRefresh: controller.refreshData,
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            slivers: [
              SliverPersistentHeader(
                floating: true,
                delegate: _SliverAppBarDelegate(
                  child: _buildHeader(),
                  minHeight: 60,
                  maxHeight: 60,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TemplateCarousel(),
                      const SizedBox(height: 8),
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
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 4),
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
                  onPressed: () {},
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
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      height: 65, // Reduced height for better proportions
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
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, 'Home', true),
            _buildNavItem(Icons.add, 'Create', false,
                onTap: () => Get.toNamed(AppRoutes.creator)),
            _buildNavItem(Icons.book, 'Library', false,
                onTap: () => Get.toNamed(AppRoutes.library)),
            _buildNavItem(Icons.person, 'Profile', false),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive,
      {VoidCallback? onTap}) {
    final color = isActive ? AppColors.amber600 : AppColors.amber400;

    return InkWell(
      onTap: () {
        HapticFeedback.lightImpact();
        onTap?.call();
      },
      customBorder: const CircleBorder(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 60,
        decoration: BoxDecoration(
          color: isActive ? AppColors.amber100 : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8), // Reduced padding
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
              size: 24, // Reduced icon size from 28 to 24
            ),
            const SizedBox(height: 2), // Reduced spacing
            Text(
              label,
              style: AppTextStyles.bottomNavLabel.copyWith(
                color: color,
                fontSize: 11, // Reduced font size from 13 to 11
                height: 1.2, // Tighter line height
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}