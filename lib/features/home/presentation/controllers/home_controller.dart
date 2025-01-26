import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/services/database_service.dart';
import '../../../../shared/models/entities/background_collection/background_collection.dart';
import '../../../../shared/models/entities/category_collection/category_collection.dart';
import '../../../../shared/models/entities/qoute_collection/quote/quote.dart';
import '../../../../shared/models/entities/template_collection/template_collection.dart';
import '../../../../shared/theme/app_colors.dart';

class HomeController extends GetxController {
  final DatabaseService _dbService;

  final RxList<Template> featuredTemplates = <Template>[].obs;
  final RxList<Template> morningTemplates = <Template>[].obs;
  final RxList<Category> categories = <Category>[].obs;
  final RxList<Map<String, dynamic>> carouselItems = <Map<String, dynamic>>[].obs;

  final RxBool isLoading = true.obs;
  final RxBool isMorningTemplatesLoading = true.obs;
  final RxBool isGridView = true.obs;
  final RxInt selectedCategoryIndex = 0.obs;
  final RxInt currentIndex = 0.obs;

  final Rx<Template?> selectedTemplate = Rx<Template?>(null);
  final RxString currentLanguage = 'en'.obs;

 HomeController({required DatabaseService dbService}) : _dbService = dbService;


  @override
  void onInit() {
    super.onInit();
    initializeController();
  }

  Future<void> initializeController() async {
    try {
      await loadInitialData();
      await loadMorningTemplatesInitialData();
      currentLanguage.value = _dbService.currentLanguage.value;
    } catch (e, stackTrace) {
      _handleError('Initialization failed', e, stackTrace);
    }
  }

  Future<void> loadInitialData() async {
    try {
      isLoading.value = true;
      final validTemplates = await _getValidTemplatesForCarousel();
      
      if (validTemplates.length > 3) {
        final random = Random();
        final selectedIndices = Set<int>();
        while (selectedIndices.length < 3) {
          selectedIndices.add(random.nextInt(validTemplates.length));
        }
        featuredTemplates.value = selectedIndices.map((i) => validTemplates[i]).toList();
      } else {
        featuredTemplates.value = validTemplates;
      }

      categories.value = await _dbService.getAllCategories();
     
    } catch (e) {
      _handleError('Loading home data failed', e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<Template>> _getValidTemplatesForCarousel() async {
    final allTemplates = await _dbService.getAllTemplates();
    final validTemplates = <Template>[];

    for (var template in allTemplates) {
      final background = await getBackgroundById(template.composition.backgroundId);
      if (background != null && 
          background.type == 'image' && 
          background.visualData.image != null) {
        validTemplates.add(template);
      }
    }

    return validTemplates;
  }


  Future<void> loadMorningTemplatesInitialData() async {
    try {
      isMorningTemplatesLoading.value = true;
      final allTemplates = await _dbService.getAllTemplates();
      morningTemplates.value = allTemplates;
      selectedTemplate.value = allTemplates.isNotEmpty ? allTemplates.first : null;
    } catch (e) {
      _handleError('Loading morning templates failed', e);
    } finally {
      isMorningTemplatesLoading.value = false;
    }
  }

  Future<Quote?> getQuoteById(String quoteId) async {
    return await _dbService.getQuote(quoteId);
  }

  Future<Background?> getBackgroundById(String backgroundId) async {
    return await _dbService.getBackground(backgroundId);
  }

  void toggleViewMode() => isGridView.value = !isGridView.value;

  Future<void> refreshData() async {
    await loadInitialData();
    await loadMorningTemplatesInitialData();
  }

  void updateLanguage(String langCode) async {
    try {
      await _dbService.setCurrentLanguage(langCode);
      currentLanguage.value = langCode;
      Get.updateLocale(Locale(langCode));
      
      await loadInitialData();
      await loadMorningTemplatesInitialData();

      Get.snackbar(
        'Success',
        'messages.language_updated'.tr,
        backgroundColor: AppColors.amber50,
        colorText: AppColors.amber800,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
    } catch (e) {
      _handleError('Language update failed', e);
      Get.snackbar(
        'Error',
        'messages.language_update_failed'.tr,
        backgroundColor: AppColors.amber50,
        colorText: AppColors.amber800,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
    }
  }

  void selectCategory(int index, Category category) {
    selectedCategoryIndex.value = index;
    onCategorySelected(category);
  }

  void onCategorySelected(Category category) {}

  void setCurrentIndex(int index) {
    currentIndex.value = index;
  }

  void _handleError(String message, Object error, [StackTrace? stackTrace]) {
    print('$message: $error');
    if (stackTrace != null) print('Stack trace: $stackTrace');
  }

  void shareTemplate(Template template) {}
  void toggleFavorite(Template template) {}
  void onTemplateSelected(Template template) {}
  bool isFavorite(String id) => true;
}