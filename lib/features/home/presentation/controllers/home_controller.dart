import 'dart:math';
import 'package:buddha_greet/shared/models/entities/category_collection/all_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/services/database_service.dart';
import '../../../../shared/models/entities/background_collection/background_collection.dart';
import '../../../../shared/models/entities/category_collection/category_collection.dart';
import '../../../../shared/models/entities/qoute_collection/quote/quote.dart';
import '../../../../shared/models/entities/template_collection/template_collection.dart';
import '../../../../shared/theme/app_colors.dart';

class HomeController extends GetxController {
  final _dbService = Get.find<DatabaseService>();

  final RxList<Template> featuredTemplates = <Template>[].obs;
  final RxList<Template> morningTemplates = <Template>[].obs;
  final RxList<Category> categories = <Category>[].obs;
  final RxList<Map<String, dynamic>> carouselItems =
      <Map<String, dynamic>>[].obs;
  final RxBool isLoading = true.obs;
  final RxBool isMorningTemplatesLoading = true.obs;
  final Rx<Template?> selectedTemplate = Rx<Template?>(null);
  final RxBool isGridView = true.obs;
  final RxString currentLanguage = 'en'.obs;

  @override
  void onInit() {
    super.onInit();
    initializeController();
  }

  Future<void> initializeController() async {
    try {
      // Wait for database to be initialized
      // if (!_dbService.isInitialized) {
      //   await _dbService.init();
      // }
      await loadInitialData();
      await loadMorningTemplatesInitialData();
      currentLanguage.value = _dbService.currentLanguage.value;
    } catch (e, stackTrace) {
      print('Error in initializeController: $e');
      print('Stack trace: $stackTrace');
    }
  }

  Future<void> loadInitialData() async {
    try {
      isLoading.value = true;

      // Load and filter valid templates
      final validTemplates = await _getValidTemplatesForCarousel();
      print("validTemplates.length ${validTemplates.length}");

      // Randomly select 3 templates from valid ones
      if (validTemplates.length > 3) {
        final random = Random();
        final selectedIndices = Set<int>();
        while (selectedIndices.length < 3) {
          selectedIndices.add(random.nextInt(validTemplates.length));
        }
        featuredTemplates.value =
            selectedIndices.map((i) => validTemplates[i]).toList();
      } else {
        featuredTemplates.value = validTemplates;
      }

      // Load categories
      final allCategories = await _dbService.getAllCategories();
      categories.value = allCategories;

      // Prepare carousel items
      await _prepareCarouselItems();
    } catch (e) {
      print('Error loading home data: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<Template>> _getValidTemplatesForCarousel() async {
    final allTemplates = await _dbService.getAllTemplates();
    final validTemplates = <Template>[];
    print(" allTemplates ${allTemplates.length}");
    for (var template in allTemplates) {
      debugPrint(
          "template \n {start} ${template.translations[currentLanguage.value]?.greeting} backgroundId ${template.composition.backgroundId} id ${template.uuid} greeting ${template.translations.entries.first.value.greeting.isEmpty}");
      // Check if template has a greeting
      // if (template.translations[currentLanguage.value]?.greeting.isEmpty) {
      //   continue;
      // }
      print("template template.quoteId ${template.composition.quoteId} ");
      // Check if template has a quote
      // if (template.composition.quoteId == null) {
      //   continue;
      // }
      print("template template.getQuoteById ${template.composition.quoteId} ");
      // Get and verify the quote exists
      // final quote = await getQuoteById(template.composition.quoteId!);
      // print(
      //     "template quote ${quote}  quote.text[currentLanguage.value]?.isEmpty ${quote?.translations[currentLanguage.value]?.text.isEmpty}");
      // if (quote == null ||
      //     quote.translations[currentLanguage.value]?.text.isEmpty == true) {
      //   continue;
      // }

      // Get and verify the background has an image
      final background =
          await getBackgroundById(template.composition.backgroundId);
      print(
          "template background ${background}   background.type != 'image' background?.type ${background?.type} ${background?.type != 'image'} imageUrl ${{
        background?.visualData.image?.original
      }} ${background?.visualData.image}");
      if (background == null ||
          background.type != 'image' ||
          background.visualData.image == null) {
        continue;
      }
      print("template background valid hurry");

      validTemplates.add(template);
    }

    return validTemplates;
  }

  Future<void> _prepareCarouselItems() async {
    if (featuredTemplates.isEmpty) return;

    final items = <Map<String, dynamic>>[];

    for (var template in featuredTemplates) {
      final background =
          await getBackgroundById(template.composition.backgroundId);
      final quote = await getQuoteById(template.composition.quoteId);

      // Double-check that we have all required components
      if (background != null &&
          background.type == 'image' &&
          background.visualData.image != null &&
          quote != null) {
        items.add({
          'template': template,
          'background': background,
          'quote': quote,
          'greeting':
              template.translations[currentLanguage.value]!.greeting ?? '',
        });
      }
    }

    carouselItems.value = items;
    print("carouselItems.value ${carouselItems.value}");
  }

  // Update loadInitialData to include morning templates
  Future<void> loadMorningTemplatesInitialData() async {
    try {
      isMorningTemplatesLoading.value = true;
      // Load morning templates
      final allTemplates = await _dbService.getAllTemplates(
          // category: 'morning',
          );
      morningTemplates.value = allTemplates;
      selectedTemplate.value = allTemplates.first;
      print("loadMorningTemplatesInitialData ${allTemplates.length}");
    } catch (e) {
      print('Error loading home data: $e');
    } finally {
      isMorningTemplatesLoading.value = false;
    }
  }

  Future<Quote?> getQuoteById(String quoteId) async {
    debugPrint("getQuoteById ${quoteId}");
    return await _dbService.getQuote(quoteId);
  }

  Future<Background?> getBackgroundById(String quoteId) async {
    return await _dbService.getBackground(quoteId);
  }

  void toggleViewMode() {
    isGridView.value = !isGridView.value;
  }

  Future<void> refreshData() async {
    await loadInitialData();
  }

  void shareTemplate(Template template) {}

  void toggleFavorite(Template template) {}
  void onTemplateSelected(Template template) {}
  bool isFavorite(String id) {
    return true;
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
      print('Error updating language: $e');
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

  final RxInt selectedCategoryIndex = 0.obs;

  void selectCategory(int index, Category category) {
    selectedCategoryIndex.value = index;
    onCategorySelected(category);
  }

  void onCategorySelected(Category category) {}

   final currentIndex = 0.obs;

  void setCurrentIndex(int index) {
    currentIndex.value = index;
  }
  
}

