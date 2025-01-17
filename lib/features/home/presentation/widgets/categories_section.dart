import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_text_styles.dart';
import '../../../../shared/models/entities/category_collection/category_collection.dart';
import '../controllers/home_controller.dart';

class CategoriesSection extends GetWidget<HomeController> {
  const CategoriesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('header.categories'.tr, style: AppTextStyles.sectionTitle),
              TextButton(
                onPressed: () {},
                child: Text(
                  'header.see_all'.tr,
                  style: AppTextStyles.buttonText.copyWith(
                    color: AppColors.amber600,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 90,
          child: Obx(() => ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: controller.categories.length,
                itemBuilder: (context, index) {
                  final category = controller.categories[index];
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.only(right: 12),
                    child: CategoryCard(
                      category: category,
                      isSelected:
                          controller.selectedCategoryIndex.value == index,
                      onTap: () => controller.selectCategory(index, category),
                    ),
                  );
                },
              )),
        ),
      ],
    );
  }
}

class CategoryCard extends GetWidget<HomeController> {
  final Category category;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryCard({
    Key? key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: 100,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isSelected
                  ? [AppColors.amber400, AppColors.amber600]
                  : [AppColors.amber50, AppColors.amber100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: AppColors.amber300.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    )
                  ]
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _getCategoryIcon(category.type),
                color: isSelected ? Colors.white : AppColors.amber800,
                size: 28,
              ),
              const SizedBox(height: 8),
              Obx(
                () => Text(
                  category.translations[controller.currentLanguage.value]
                          ?.name ??
                      "",
                  style: AppTextStyles.bodySmall.copyWith(
                    color: isSelected ? Colors.white : AppColors.amber800,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String type) {
    switch (type.toLowerCase()) {
      // Original categories
      case 'nature':
        return Icons.landscape;
      case 'temple':
        return Icons.temple_buddhist;
      case 'abstract':
        return Icons.auto_awesome;

      // Architecture types
      case 'urban':
        return Icons.location_city;
      case 'palace':
        return Icons.account_balance;
      case 'monument':
        return Icons.tour;

      // Nature types
      case 'waterfall':
        return Icons.water_drop;
      case 'desert':
        return Icons.wb_sunny;
      case 'sunset':
        return Icons.wb_twilight;
      case 'landscape':
        return Icons.terrain;

      // Style types
      case 'geometric':
        return Icons.hexagon;
      case 'minimal':
        return Icons.grid_view;
      case 'mandala':
        return Icons.brightness_7;

      // Default fallback
      default:
        return Icons.category;
    }
  }
}
