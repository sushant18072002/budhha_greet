import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shared/widgets/bottom_nav.dart';
import '../../../../shared/widgets/sliver_appbar_delegate.dart';
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
          backgroundColor: AppColors.amber100,
          onRefresh: controller.refreshData,
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            slivers: [
              SliverPersistentHeader(
                floating: true,
                delegate: CustumSliverAppBarDelegate(
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
      bottomNavigationBar: const CustumBottomNavigation(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
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
}
