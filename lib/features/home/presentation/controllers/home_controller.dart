import 'dart:math';
import 'package:get/get.dart';
import '../../../../core/services/database_service.dart';
import '../../data/models/template/template.dart';

class HomeController extends GetxController {
  final DatabaseService _dbService = DatabaseService.instance;

  final RxList<Template> featuredTemplates = <Template>[].obs;
  final RxList<String> categories = <String>[].obs;
  final RxList<Map<String, dynamic>> carouselItems =
      <Map<String, dynamic>>[].obs;
  final RxBool isLoading = true.obs;
  final RxString currentLanguage = 'en'.obs;

  @override
  void onInit() {
    super.onInit();
    loadInitialData();
    currentLanguage.value = _dbService.currentLanguage.value;
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
      final allCategories = await _dbService.getCategories();
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
    final allTemplates = await _dbService.getTemplates();
    final validTemplates = <Template>[];
    print("allTemplates ${allTemplates.length}");
    for (var template in allTemplates) {
      print(
          "template ${template.title.entries.first} backgroundId ${template.backgroundId} id ${template.id} greeting ${template.greeting.isEmpty} greeting ${template.greeting[currentLanguage.value]?.isEmpty}");
      // Check if template has a greeting
      if (template.greeting.isEmpty ||
          template.greeting[currentLanguage.value]?.isEmpty == true) {
        continue;
      }
      print("template template.quoteId ${template.quoteId} ");
      // Check if template has a quote
      if (template.quoteId == null) {
        continue;
      }
      print("template template.getQuoteById ${template.quoteId} ");
      // Get and verify the quote exists
      final quote = await _dbService.getQuoteById(template.quoteId!);
      print(
          "template quote ${quote}  quote.text[currentLanguage.value]?.isEmpty ${quote?.text[currentLanguage.value]?.isEmpty}");
      if (quote == null || quote.text[currentLanguage.value]?.isEmpty == true) {
        continue;
      }

      // Get and verify the background has an image
      final background =
          await _dbService.getBackgroundById(template.backgroundId);
      print(
          "template background ${background}   background.type != 'image'  ${background?.type != 'image'} imageUrl ${background?.imageUrl}");
      if (background == null ||
          background.type != 'image' ||
          background.imageUrl == null ||
          background.imageUrl!.isEmpty) {
        continue;
      }

      validTemplates.add(template);
    }

    return validTemplates;
  }

  Future<void> _prepareCarouselItems() async {
    if (featuredTemplates.isEmpty) return;

    final items = <Map<String, dynamic>>[];

    for (var template in featuredTemplates) {
      final background =
          await _dbService.getBackgroundById(template.backgroundId);
      final quote = await _dbService.getQuoteById(template.quoteId!);

      // Double-check that we have all required components
      if (background != null &&
          background.type == 'image' &&
          background.imageUrl != null &&
          quote != null) {
        items.add({
          'template': template,
          'background': background,
          'quote': quote,
          'greeting': template.greeting[currentLanguage.value] ?? '',
        });
      }
    }

    carouselItems.value = items;
    print("carouselItems.value ${carouselItems.value}");
  }

  void toggleFavorite(String id) {
    // Implementation
  }

  Future<void> refreshData() async {
    await loadInitialData();
  }
}
