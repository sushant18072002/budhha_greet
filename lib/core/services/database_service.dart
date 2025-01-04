import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import '../../features/greeting_creator/data/models/user_customization.dart';
import '../../features/home/data/models/template/template.dart';
import '../../features/home/data/models/template_style/template_style.dart';
import '../../features/image_detail/data/models/background_model.dart';
import '../../features/quote_library/data/models/quote_model.dart';
import '../../shared/models/background_font_category/background_font_category.dart';
import '../../shared/models/background_font_config/background_font_config.dart';
import '../../shared/models/background_text_area/background_text_area.dart';
import '../../shared/models/background_text_position/background_text_position.dart';
import '../../shared/models/background_text_style/background_text_style.dart';

class DatabaseService extends GetxService {
  // Singleton instance
  static DatabaseService? _instance;
  
  // Box names
  static const String quotesBox = 'quotes';
  static const String backgroundsBox = 'backgrounds';
  static const String templatesBox = 'templates';
  static const String metadataBox = 'metadata';
  static const String customizationsBox = 'customizations';
  static const String preferencesBox = 'preferences';
  static const String fontConfigBox = 'fontConfig';

  // Observable state
  final RxString currentLanguage = 'en'.obs;
  final RxList<String> supportedLanguages = <String>['en', 'hi'].obs;
  final RxMap<String, dynamic> cache = <String, dynamic>{}.obs;
  
  bool _isInitialized = false;

  // Singleton accessor
  static DatabaseService get instance {
    _instance ??= DatabaseService._internal();
    return _instance!;
  }

  DatabaseService._internal();

  // Safe box access with proper typing
  Future<Box<T>> _getBox<T>(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox<T>(boxName);
    }
    return Hive.box<T>(boxName);
  }

  // Initialization
  Future<DatabaseService> init() async {
    if (_isInitialized) return this;

    try {
      await Hive.initFlutter();
      
      _registerAdapters();
      await _initializeBoxes();
      await _loadInitialData();
      await _initializeCache();
      
      _isInitialized = true;
      return this;
    } catch (e) {
      print('Error in database initialization: $e');
      await _closeAllBoxes();
      rethrow;
    }
  }

  // Register all Hive type adapters
  void _registerAdapters() {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(QuoteAdapter());
      Hive.registerAdapter(BackgroundTextStyleAdapter());
      Hive.registerAdapter(BackgroundAdapter());
      Hive.registerAdapter(BackgroundTextAreaAdapter());
      Hive.registerAdapter(BackgroundTextPositionAdapter());
      Hive.registerAdapter(TemplateAdapter());
      Hive.registerAdapter(TemplateStyleAdapter());
      Hive.registerAdapter(BackgroundFontCategoryAdapter());
      Hive.registerAdapter(BackgroundFontConfigAdapter());
      Hive.registerAdapter(UserCustomizationAdapter());
    }
  }

  // Initialize all Hive boxes
  Future<void> _initializeBoxes() async {
    await _closeAllBoxes();
    
    await Future.wait([
      Hive.openBox<Quote>(quotesBox),
      Hive.openBox<Background>(backgroundsBox),
      Hive.openBox<Template>(templatesBox),
      Hive.openBox<BackgroundFontConfig>(fontConfigBox),
      Hive.openBox<UserCustomization>(customizationsBox),
      Hive.openBox(metadataBox),
      Hive.openBox(preferencesBox),
    ]);
  }

  // Close all open boxes
  Future<void> _closeAllBoxes() async {
    final boxNames = [
      quotesBox, 
      backgroundsBox, 
      templatesBox,
      fontConfigBox,
      customizationsBox,
      metadataBox,
      preferencesBox
    ];
    
    await Future.wait(
      boxNames.where((name) => Hive.isBoxOpen(name))
        .map((name) => Hive.box(name).close())
    );
  }

  // Load initial data from JSON
  Future<void> _loadInitialData() async {
    final Box metadataBoxRef = await _getBox(metadataBox);
    
    if (metadataBoxRef.get('isInitialized') != true) {
      try {
        final String jsonContent = await rootBundle.loadString('assets/data/app_data.json');
        final Map<String, dynamic> data = json.decode(jsonContent);

        if (!_validateDataStructure(data)) {
          throw Exception('Invalid data structure in app_data.json');
        }

        // Store metadata
        await metadataBoxRef.putAll({
          'version': data['metadata']['version'] ?? '1.0',
          'supportedLanguages': data['metadata']['supportedLanguages'] ?? ['en'],
          'defaultLanguage': data['metadata']['defaultLanguage'] ?? 'en',
          'lastUpdated': data['metadata']['lastUpdated'],
          'isInitialized': true,
        });

        // Store all data types
        await _storeQuotes(data['quotes'] ?? []);
        await _storeBackgrounds(data['backgrounds'] ?? []);
        await _storeTemplates(data['templates'] ?? []);
        await _storeFontConfig(data['fonts'] ?? {});

      } catch (e) {
        print('Error loading initial data: $e');
        await metadataBoxRef.put('isInitialized', false);
        rethrow;
      }
    }
  }

  // Store quotes in Hive
  Future<void> _storeQuotes(List<dynamic> quotes) async {
    final Box<Quote> quotesBoxRef = await _getBox<Quote>(quotesBox);
    for (final quoteData in quotes) {
      if (quoteData != null && quoteData is Map<String, dynamic>) {
        try {
          final quote = Quote.fromJson(quoteData);
          await quotesBoxRef.put(quote.id, quote);
        } catch (e) {
          print('Error storing quote: ${quoteData['id']} - $e');
        }
      }
    }
  }

  // Store backgrounds in Hive
  Future<void> _storeBackgrounds(List<dynamic> backgrounds) async {
    final Box<Background> backgroundsBoxRef = await _getBox<Background>(backgroundsBox);
    for (final bgData in backgrounds) {
      if (bgData != null && bgData is Map<String, dynamic>) {
        try {
          final background = Background.fromJson(bgData);
          await backgroundsBoxRef.put(background.id, background);
        } catch (e) {
          print('Error storing background: ${bgData['id']} - $e');
        }
      }
    }
  }

  // Store templates in Hive
  Future<void> _storeTemplates(List<dynamic> templates) async {
    final Box<Template> templatesBoxRef = await _getBox<Template>(templatesBox);
    for (final templateData in templates) {
      if (templateData != null && templateData is Map<String, dynamic>) {
        try {
          final template = Template.fromJson(templateData);
          await templatesBoxRef.put(template.id, template);
        } catch (e) {
          print('Error storing template: ${templateData['id']} - $e');
        }
      }
    }
  }

  // Store font configuration in Hive
  Future<void> _storeFontConfig(Map<String, dynamic> fontConfig) async {
    final Box<BackgroundFontConfig> fontConfigBoxRef = await _getBox<BackgroundFontConfig>(fontConfigBox);
    try {
      final config = BackgroundFontConfig.fromJson(fontConfig);
      await fontConfigBoxRef.put('default', config);
    } catch (e) {
      print('Error storing font config: $e');
    }
  }

  // Initialize cache with frequently accessed data
  Future<void> _initializeCache() async {
    try {
      cache.value = {
        'supportedLanguages': await getSupportedLanguages(),
        'categories': await getCategories(),
        'recentTemplates': await getRecentTemplates(limit: 5),
        'fontConfig': await getFontConfig(),
      };
    } catch (e) {
      print('Error initializing cache: $e');
      cache.clear();
    }
  }

  // Validate JSON data structure
  bool _validateDataStructure(Map<String, dynamic> data) {
    return data.containsKey('metadata') &&
           data['metadata'] is Map &&
           data.containsKey('quotes') &&
           data['quotes'] is List &&
           data.containsKey('backgrounds') &&
           data['backgrounds'] is List &&
           data.containsKey('templates') &&
           data['templates'] is List &&
           data.containsKey('fonts') &&
           data['fonts'] is Map;
  }

  // Quote-related methods
  Future<List<Quote>> getQuotes({
    String? category,
    String? searchTerm,
    int? limit,
    int? offset,
  }) async {
    final Box<Quote> quotesBoxRef = await _getBox<Quote>(quotesBox);
    
    List<Quote> quotes = quotesBoxRef.values.where((quote) {
      bool matches = true;

      if (category != null) {
        matches = matches && quote.categories.contains(category);
      }

      if (searchTerm != null) {
        final searchLower = searchTerm.toLowerCase();
        matches = matches && (
          quote.text[currentLanguage.value]?.toLowerCase().contains(searchLower) == true ||
          quote.author[currentLanguage.value]?.toLowerCase().contains(searchLower) == true
        );
      }

      return matches;
    }).toList();

    quotes.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    if (offset != null || limit != null) {
      final start = offset ?? 0;
      final end = limit != null ? (start + limit) : quotes.length;
      quotes = quotes.sublist(start, end.clamp(0, quotes.length));
    }

    return quotes;
  }

  Future<Quote?> getQuoteById(String id) async {
    final Box<Quote> quotesBoxRef = await _getBox<Quote>(quotesBox);
    return quotesBoxRef.get(id);
  }

  // Background-related methods
  Future<List<Background>> getBackgrounds({
    String? category,
    List<String>? tags,
    int? limit,
    int? offset,
  }) async {
    final Box<Background> backgroundsBoxRef = await _getBox<Background>(backgroundsBox);

    List<Background> backgrounds = backgroundsBoxRef.values.where((background) {
      bool matches = true;

      if (category != null) {
        matches = matches && background.categories.contains(category);
      }

      if (tags != null && tags.isNotEmpty) {
        matches = matches && tags.any((tag) => background.tags.contains(tag));
      }

      return matches;
    }).toList();

    backgrounds.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    if (offset != null || limit != null) {
      final start = offset ?? 0;
      final end = limit != null ? (start + limit) : backgrounds.length;
      backgrounds = backgrounds.sublist(start, end.clamp(0, backgrounds.length));
    }

    return backgrounds;
  }

  Future<Background?> getBackgroundById(String id) async {
    final Box<Background> backgroundsBoxRef = await _getBox<Background>(backgroundsBox);
    return backgroundsBoxRef.get(id);
  }

  // Template-related methods
  Future<List<Template>> getTemplates({
    String? category,
    String? occasion,
    bool? isPremium,
    int? limit,
    int? offset,
  }) async {
    final Box<Template> templatesBoxRef = await _getBox<Template>(templatesBox);

    List<Template> templates = templatesBoxRef.values.where((template) {
      bool matches = true;

      if (category != null) {
        matches = matches && template.categories.contains(category);
      }

      if (occasion != null) {
        matches = matches && template.occasions.contains(occasion);
      }

      if (isPremium != null) {
        matches = matches && template.isPremium == isPremium;
      }

      return matches;
    }).toList();

    templates.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    if (offset != null || limit != null) {
      final start = offset ?? 0;
      final end = limit != null ? (start + limit) : templates.length;
      templates = templates.sublist(start, end.clamp(0, templates.length));
    }

    return templates;
  }

  Future<List<Template>> getRecentTemplates({int? limit}) async {
    return getTemplates(limit: limit);
  }

  Future<Template?> getTemplateById(String id) async {
    final Box<Template> templatesBoxRef = await _getBox<Template>(templatesBox);
    return templatesBoxRef.get(id);
  }

  // User customization methods
  Future<void> saveCustomization(UserCustomization customization) async {
    final Box<UserCustomization> customizationsBoxRef = await _getBox<UserCustomization>(customizationsBox);
    await customizationsBoxRef.put(customization.id, customization);
  }

  Future<List<UserCustomization>> getUserCustomizations({int? limit}) async {
    final Box<UserCustomization> customizationsBoxRef = await _getBox<UserCustomization>(customizationsBox);

    List<UserCustomization> customizations = customizationsBoxRef.values.toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    if (limit != null) {
      customizations = customizations.take(limit).toList();
    }

    return customizations;
  }

  Future<void> deleteCustomization(String id) async {
    final Box<UserCustomization> customizationsBoxRef = await _getBox<UserCustomization>(customizationsBox);
    await customizationsBoxRef.delete(id);
  }

  Future<void> cleanupOldCustomizations({int daysToKeep = 30}) async {
    final Box<UserCustomization> customizationsBoxRef = await _getBox<UserCustomization>(customizationsBox);
    final cutoffDate = DateTime.now().subtract(Duration(days: daysToKeep));

    final keysToDelete = customizationsBoxRef.values
        .where((customization) => customization.createdAt.isBefore(cutoffDate))
        .map((customization) => customization.id)
        .toList();

    for (final key in keysToDelete) {
      await customizationsBoxRef.delete(key);
    }
  }

  // Category and metadata methods
  Future<List<String>> getCategories() async {
    final Set<String> categories = {};
    
    try {
      // First get the box references without using the variables in their own declarations
      final Box<Quote> quotesBoxRef = await _getBox<Quote>(quotesBox);
      final Box<Background> backgroundsBoxRef = await _getBox<Background>(backgroundsBox);
      final Box<Template> templatesBoxRef = await _getBox<Template>(templatesBox);
      
      // Collect categories from quotes
      for (final quote in quotesBoxRef.values) {
        categories.addAll(quote.categories);
      }
      
      // Collect categories from backgrounds
      for (final background in backgroundsBoxRef.values) {
        categories.addAll(background.categories);
      }
      
      // Collect categories from templates
      for (final template in templatesBoxRef.values) {
        categories.addAll(template.categories);
      }
    } catch (e) {
      print('Error getting categories: $e');
    }
    
    return categories.toList()..sort();
  }

  Future<List<String>> getOccasions() async {
    final Set<String> occasions = {};
    try {
      final templatesBoxRef = await _getBox<Template>(templatesBox);
      for (final template in templatesBoxRef.values) {
        occasions.addAll(template.occasions);
      }
    } catch (e) {
      print('Error getting occasions: $e');
    }
    return occasions.toList()..sort();
  }

  // Language and localization methods
  Future<List<String>> getSupportedLanguages() async {
    final Box metadataBoxRef = await _getBox(metadataBox);
    final languages = metadataBoxRef.get('supportedLanguages') as List<dynamic>?;
    return languages?.cast<String>() ?? ['en', 'hi'];
  }

  Future<void> setCurrentLanguage(String languageCode) async {
    if (supportedLanguages.contains(languageCode)) {
      currentLanguage.value = languageCode;
      final Box preferencesBoxRef = await _getBox(preferencesBox);
      await preferencesBoxRef.put('currentLanguage', languageCode);
    }
  }

  // Font configuration methods
  Future<BackgroundFontConfig?> getFontConfig() async {
    final Box<BackgroundFontConfig> fontConfigBoxRef = await _getBox<BackgroundFontConfig>(fontConfigBox);
    return fontConfigBoxRef.get('default');
  }

  Future<void> updateFontConfig(BackgroundFontConfig config) async {
    final Box<BackgroundFontConfig> fontConfigBoxRef = await _getBox<BackgroundFontConfig>(fontConfigBox);
    await fontConfigBoxRef.put('default', config);
    await _initializeCache();
  }

  // User preferences methods
  Future<void> saveUserPreferences(Map<String, dynamic> preferences) async {
    final Box preferencesBoxRef = await _getBox(preferencesBox);
    await preferencesBoxRef.putAll(preferences);
  }

  Future<Map<String, dynamic>> getUserPreferences() async {
    final Box preferencesBoxRef = await _getBox(preferencesBox);
    return Map.fromEntries(
      preferencesBoxRef.keys.map((key) => 
        MapEntry(key.toString(), preferencesBoxRef.get(key))
      ),
    );
  }

  // BackGroundText placement utility methods
  double getRelativePosition(double absolute, double containerSize) {
    return absolute / containerSize;
  }

  double getAbsolutePosition(double relative, double containerSize) {
    return relative * containerSize;
  }

  // CRUD operations for all types
  Future<void> addQuote(Quote quote) async {
    final Box<Quote> quotesBoxRef = await _getBox<Quote>(quotesBox);
    await quotesBoxRef.put(quote.id, quote);
  }

  Future<void> updateQuote(Quote quote) async {
    await addQuote(quote);
  }

  Future<void> deleteQuote(String id) async {
    final Box<Quote> quotesBoxRef = await _getBox<Quote>(quotesBox);
    await quotesBoxRef.delete(id);
  }

  Future<void> addBackground(Background background) async {
    final Box<Background> backgroundsBoxRef = await _getBox<Background>(backgroundsBox);
    await backgroundsBoxRef.put(background.id, background);
  }

  Future<void> updateBackground(Background background) async {
    await addBackground(background);
  }

  Future<void> deleteBackground(String id) async {
    final Box<Background> backgroundsBoxRef = await _getBox<Background>(backgroundsBox);
    await backgroundsBoxRef.delete(id);
  }

  Future<void> addTemplate(Template template) async {
    final Box<Template> templatesBoxRef = await _getBox<Template>(templatesBox);
    await templatesBoxRef.put(template.id, template);
  }

  Future<void> updateTemplate(Template template) async {
    await addTemplate(template);
  }

  Future<void> deleteTemplate(String id) async {
    final Box<Template> templatesBoxRef = await _getBox<Template>(templatesBox);
    await templatesBoxRef.delete(id);
  }

  // Search methods
  Future<List<Quote>> searchQuotes(String query) async {
    return getQuotes(searchTerm: query);
  }

  Future<List<Template>> searchTemplates(String query) async {
    final templates = await getTemplates();
    return templates.where((template) {
      final searchLower = query.toLowerCase();
      return template.title[currentLanguage.value]?.toLowerCase().contains(searchLower) == true ||
             template.description[currentLanguage.value]?.toLowerCase().contains(searchLower) == true;
    }).toList();
  }

  // Data export/import methods
  Future<Map<String, dynamic>> exportData() async {
    final quotes = await getQuotes();
    final backgrounds = await getBackgrounds();
    final templates = await getTemplates();
    final fontConfig = await getFontConfig();
    final userPreferences = await getUserPreferences();

    return {
      'quotes': quotes.map((q) => q.toJson()).toList(),
      'backgrounds': backgrounds.map((b) => b.toJson()).toList(),
      'templates': templates.map((t) => t.toJson()).toList(),
      'fontConfig': fontConfig?.toJson(),
      'userPreferences': userPreferences,
      'exportDate': DateTime.now().toIso8601String(),
    };
  }

  Future<void> importData(Map<String, dynamic> data) async {
    await _closeAllBoxes();
    await _initializeBoxes();
    
    try {
      if (data['quotes'] != null) {
        await _storeQuotes(data['quotes']);
      }
      if (data['backgrounds'] != null) {
        await _storeBackgrounds(data['backgrounds']);
      }
      if (data['templates'] != null) {
        await _storeTemplates(data['templates']);
      }
      if (data['fontConfig'] != null) {
        await _storeFontConfig(data['fontConfig']);
      }
      if (data['userPreferences'] != null) {
        await saveUserPreferences(data['userPreferences']);
      }
      
      await _initializeCache();
    } catch (e) {
      print('Error importing data: $e');
      rethrow;
    }
  }

  // Cleanup method
  Future<void> dispose() async {
    await _closeAllBoxes();
    _instance = null;
  }
}