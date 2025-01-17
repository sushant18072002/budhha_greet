
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_text_styles.dart';
import '../controllers/home_controller.dart';

class LanguageSelector extends GetWidget<HomeController> {
  const LanguageSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      offset: const Offset(0, 40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: AppColors.amber100),
      ),
      color: AppColors.white,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.amber50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.amber100),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.language, color: AppColors.amber600, size: 20),
            const SizedBox(width: 8),
            Obx(() => Text(
              _getLanguageName(controller.currentLanguage.value),
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.amber800,
              ),
            )),
            const SizedBox(width: 4),
            Icon(Icons.arrow_drop_down, color: AppColors.amber600),
          ],
        ),
      ),
      itemBuilder: (context) => [
        _buildLanguageItem('en', 'English'),
        // _buildLanguageItem('es', 'Español'),
        // _buildLanguageItem('fr', 'Français'),
        // _buildLanguageItem('de', 'Deutsch'),
        _buildLanguageItem('hi', 'हिंदी'),
        // _buildLanguageItem('zh', '中文'),
      ],
      onSelected: (String langCode) async {
         controller.updateLanguage(langCode);
      },
    );
  }

  PopupMenuItem<String> _buildLanguageItem(String code, String name) {
    return PopupMenuItem<String>(
      value: code,
      child: Obx(() => Row(
        children: [
          Text(
            name,
            style: AppTextStyles.bodyMedium.copyWith(
              color: controller.currentLanguage.value == code 
                  ? AppColors.amber800 
                  : AppColors.amber600,
              fontWeight: controller.currentLanguage.value == code
                  ? FontWeight.w600
                  : FontWeight.normal,
            ),
          ),
          if (controller.currentLanguage.value == code) ...[
            const SizedBox(width: 8),
            Icon(Icons.check, color: AppColors.amber600, size: 18),
          ],
        ],
      )),
    );
  }

  String _getLanguageName(String code) {
    switch (code) {
      case 'en': return 'English';
      case 'es': return 'Español';
      case 'fr': return 'Français';
      case 'de': return 'Deutsch';
      case 'hi': return 'हिंदी';
      case 'zh': return '中文';
      default: return 'English';
    }
  }
}