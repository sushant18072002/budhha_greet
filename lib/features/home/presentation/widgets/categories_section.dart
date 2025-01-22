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
              Text(
                'header.categories'.tr,
                style: AppTextStyles.sectionTitle,
                semanticsLabel: 'Categories Section',
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(8), // Increased touch target
                  minimumSize: const Size(44, 44), // Accessibility standard
                ),
                child: Text(
                  'header.see_all'.tr,
                  style: AppTextStyles.buttonText.copyWith(
                    color: AppColors.amber600,
                    fontSize: 16, // Increased for better visibility
                  ),
                ),
              ),
            ],
          ),
        ),
        //const SizedBox(height: 8), // Increased spacing
        SizedBox(
          height: 100, // Increased height for better touch targets
          child: Obx(() => ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(
                  decelerationRate: ScrollDecelerationRate.fast,
                ),
                itemCount: controller.categories.length,
                itemBuilder: (context, index) {
                  final category = controller.categories[index];
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    margin: const EdgeInsets.only(right: 8),
                    child: Hero(
                      tag: 'category_${category.type}',
                      child: CategoryCard(
                        category: category,
                        isSelected: controller.selectedCategoryIndex.value == index,
                        onTap: () => controller.selectCategory(index, category),
                      ),
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
          width: 110, // Increased width
          padding: const EdgeInsets.all(16), // Increased padding
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isSelected
                  ? [AppColors.amber500, AppColors.amber700]
                  : [AppColors.amber50, AppColors.amber100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: isSelected
                    ? AppColors.amber300.withOpacity(0.3)
                    : AppColors.amber200.withOpacity(0.1),
                blurRadius: isSelected ? 8 : 4,
                offset: Offset(0, isSelected ? 4 : 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  _getCategoryIcon(category.type),
                  color: isSelected ? Colors.white : AppColors.amber800,
                  size: 32, // Increased icon size
                  semanticLabel: '${category.type} icon',
                ),
              ),
              const SizedBox(height: 8),
              Obx(
                () => Text(
                  category.translations[controller.currentLanguage.value]?.name ?? "",
                  style: AppTextStyles.bodySmall.copyWith(
                    color: isSelected ? Colors.white : AppColors.amber800,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    fontSize: 13, // Slightly increased for better readability
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
