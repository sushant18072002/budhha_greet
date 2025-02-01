import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../core/routes/app_routes.dart';
import '../../features/home/presentation/controllers/home_controller.dart';
import '../theme/app_colors.dart';

class CustumBottomNavigation extends GetView<HomeController> {
  const CustumBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 76,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                icon: Icons.home_rounded,
                label: 'Home',
                isSelected: controller.currentIndex.value == 0,
                onTap: () => _handleNavigation(0),
              ),
              // _buildNavItem(
              //   icon: Icons.add_circle_outline_rounded,
              //   label: 'Create',
              //   isSelected: controller.currentIndex.value == 1,
              //   onTap: () => _handleNavigation(1),
              // ),
              _buildNavItem(
                icon: Icons.book_rounded,
                label: 'Library',
                isSelected: controller.currentIndex.value == 2,
                onTap: () => _handleNavigation(2),
              ),
              _buildNavItem(
                icon: Icons.person_rounded,
                label: 'Profile',
                isSelected: controller.currentIndex.value == 3,
                onTap: () => _handleNavigation(3),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        onTap();
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 72,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.amber100 : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: isSelected ? AppColors.amber600 : AppColors.amber400,
                size: 26,
              ),
            ),
           // const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? AppColors.amber600 : AppColors.amber400,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleNavigation(int index) {
    controller.setCurrentIndex(index);
    switch (index) {
      case 0:
        Get.toNamed(AppRoutes.home);
        break;
      case 1:
        Get.toNamed(AppRoutes.creator);
        break;
      case 2:
        Get.toNamed(AppRoutes.library);
        break;
      case 3:
        Get.toNamed(AppRoutes.profile);
        break;
    }
  }
}