import 'dart:convert';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter/services.dart' show rootBundle;

import '../../shared/models/analytics/analytics_config.dart';
import '../../shared/models/analytics/popular_item.dart';
import '../../shared/models/analytics/reporting_config.dart';
import '../../shared/models/analytics/tracking_config.dart';
import '../../shared/models/app_config/api_config.dart';
import '../../shared/models/app_config/app_config.dart';
import '../../shared/models/app_config/app_settings.dart';
import '../../shared/models/app_config/cache_config.dart';
import '../../shared/models/app_config/compression_config.dart';
import '../../shared/models/app_config/connectivity_config.dart';
import '../../shared/models/app_config/data_cache_config.dart';
import '../../shared/models/app_config/image_cache_config.dart';
import '../../shared/models/app_config/language_config.dart';
import '../../shared/models/app_config/metadata.dart';
import '../../shared/models/app_config/rate_limit_config.dart';
import '../../shared/models/app_config/retry_config.dart';
import '../../shared/models/app_config/system_cache_config.dart';
import '../../shared/models/app_config/system_config.dart';
import '../../shared/models/app_config/theme_config.dart';
import '../../shared/models/entities/author.dart';
import '../../shared/models/entities/background.dart';
import '../../shared/models/entities/category.dart';
import '../../shared/models/entities/entities.dart';
import '../../shared/models/entities/language.dart';
import '../../shared/models/entities/qoute_collection/qoute_collection.dart';
import '../../shared/models/entities/source.dart';
import '../../shared/models/entities/tag.dart';
import '../../shared/models/entities/template_collection/template_collection.dart';
import '../../shared/models/style/visual_data.dart';
import '../../shared/models/style/visual_effects.dart';
import '../../shared/models/validation/author_validation.dart';
import '../../shared/models/validation/quote_validation.dart';
import '../../shared/models/validation/template_validation.dart';
import '../../shared/models/validation/text_validation.dart';
import '../../shared/models/validation/typography_validation.dart';
import '../../shared/models/validation/validation_rules.dart';

class DatabaseService extends GetxService {
  static DatabaseService get to => Get.find();

  // Box definitions with type safety
  late Box<AppConfig> configBox;
  late Box<Quote> quotesBox;
  late Box<Background> backgroundsBox;
  late Box<Template> templatesBox;
  late Box<Category> categoriesBox;
  late Box<Author> authorsBox;
  late Box<Source> sourcesBox;
  late Box<Tag> tagsBox;

  // Constants
  static const String configBoxName = 'appConfig';
  static const String quotesBoxName = 'quotes';
  static const String backgroundsBoxName = 'backgrounds';
  static const String templatesBoxName = 'templates';
  static const String categoriesBoxName = 'categories';
  static const String authorsBoxName = 'authors';
  static const String sourcesBoxName = 'sources';
  static const String tagsBoxName = 'tags';

  // Observable state
  final RxString currentLanguage = 'en'.obs;
  final RxList<String> supportedLanguages = <String>['en'].obs;
  final RxMap<String, dynamic> cache = <String, dynamic>{}.obs;
  final RxBool isInitialized = false.obs;

  // Initialize the database service
  Future<DatabaseService> init() async {
    if (isInitialized.value) return this;

    try {
      final appDocumentDir =
          await path_provider.getApplicationDocumentsDirectory();
      Hive.init(appDocumentDir.path);

      await _registerAdapters();
      await _openBoxes();
      await _loadInitialData();
      await _initializeCache();

      isInitialized.value = true;
      return this;
    } catch (e, stackTrace) {
      print('Error initializing database: $e');
      print('Stack trace: $stackTrace');
      await _safeCloseBoxes();
      rethrow;
    }
  }

  // Register all Hive adapters
  Future<void> _registerAdapters() async {
    try {
      // Core Config Models - typeId: 0-4
      Hive.registerAdapter(AppConfigAdapter()); //0
      Hive.registerAdapter(MetadataAdapter());  //1
      Hive.registerAdapter(SystemConfigAdapter()); //2
      Hive.registerAdapter(LanguageConfigAdapter()); //3
      Hive.registerAdapter(AppSettingsAdapter()); //4

      // System Settings - typeId: 5-7
      Hive.registerAdapter(ThemeConfigAdapter()); //5
      Hive.registerAdapter(EntitiesAdapter());   //6
      Hive.registerAdapter(LanguageAdapter());   //7

      // Core Entity Models - typeId: 8-10
      Hive.registerAdapter(QuoteAdapter());     //8
      Hive.registerAdapter(BackgroundAdapter()); //9
      Hive.registerAdapter(TranslationAdapter());

      // Style & Typography - typeId: 11-14
      Hive.registerAdapter(QouteStyleAdapter());
      Hive.registerAdapter(QouteTypographyAdapter());
      Hive.registerAdapter(QouteFontSizeAdapter());
      Hive.registerAdapter(QouteStyleColorsAdapter());

      // Quote Related - typeId: 15-17
      Hive.registerAdapter(QuoteMetadataAdapter());
      Hive.registerAdapter(AuditAdapter());

      // Visual Data Models - typeId: 18-25
      Hive.registerAdapter(VisualDataAdapter());
      Hive.registerAdapter(ImageDataAdapter());
      Hive.registerAdapter(ImageVariantAdapter());
      Hive.registerAdapter(GradientDataAdapter());
      Hive.registerAdapter(GradientStopAdapter());
      Hive.registerAdapter(ColorDataAdapter());
      Hive.registerAdapter(ColorPaletteAdapter());
      Hive.registerAdapter(VisualEffectsAdapter());

      // Attribution & Optimization - typeId: 26-28
      Hive.registerAdapter(AttributionAdapter());
      Hive.registerAdapter(OptimizationAdapter());
      Hive.registerAdapter(CacheConfigAdapter());

      // Template Related - typeId: 29-31
    

      // Layout Related - typeId: 32-37

      Hive.registerAdapter(QouteFontSizeAdapter());
     

      // Style Config - typeId: 38-40
     
      // Validation Rules - typeId: 41-46
      Hive.registerAdapter(ValidationRulesAdapter());
      Hive.registerAdapter(QuoteValidationAdapter());
      Hive.registerAdapter(TextValidationAdapter());
      Hive.registerAdapter(AuthorValidationAdapter());
      Hive.registerAdapter(TemplateValidationAdapter());
      Hive.registerAdapter(TypographyValidationAdapter());

      // Analytics Config - typeId: 47-50
      Hive.registerAdapter(AnalyticsConfigAdapter());
      Hive.registerAdapter(TrackingConfigAdapter());
      Hive.registerAdapter(ReportingConfigAdapter());
      Hive.registerAdapter(PopularItemsAdapter());

      // Connectivity Config - typeId: 51-54
      Hive.registerAdapter(ConnectivityConfigAdapter());
      Hive.registerAdapter(RetryConfigAdapter());
      Hive.registerAdapter(RateLimitConfigAdapter());
      Hive.registerAdapter(CompressionConfigAdapter());
      // API Config
      Hive.registerAdapter(ApiConfigAdapter());

      // Cache Configs - typeId: 55-57
      Hive.registerAdapter(ImageCacheConfigAdapter());
      Hive.registerAdapter(DataCacheConfigAdapter());
      Hive.registerAdapter(SystemCacheConfigAdapter());

      // Category Related - typeId: 58-62
      Hive.registerAdapter(CategoryCollectionAdapter());
      Hive.registerAdapter(CategorySchemaAdapter());
      Hive.registerAdapter(CategoryAdapter());
      Hive.registerAdapter(CategoryTranslationAdapter());
      Hive.registerAdapter(CategoryMetadataAdapter());

      // Background Related - typeId: 63-64
      Hive.registerAdapter(BackgroundCollectionAdapter());
      Hive.registerAdapter(BackgroundSchemaAdapter());

      // Tag Related - typeId: 65-69
      Hive.registerAdapter(TagCollectionAdapter());
      Hive.registerAdapter(TagSchemaAdapter());
      Hive.registerAdapter(TagAdapter());
      Hive.registerAdapter(TagTranslationAdapter());
      Hive.registerAdapter(TagMetadataAdapter());

      // Author Related - typeId: 70-71
      Hive.registerAdapter(AuthorCollectionAdapter());
      Hive.registerAdapter(AuthorTranslationAdapter());
      Hive.registerAdapter(AuthorAdapter());

      // Source Related
      Hive.registerAdapter(SourceCollectionAdapter()); // 73
      Hive.registerAdapter(SourceAdapter()); //74
      Hive.registerAdapter(SourceTranslationAdapter()); //75

      Hive.registerAdapter(LanguageCollectionAdapter()); //76
      Hive.registerAdapter(QuoteCollectionAdapter()); //77

      Hive.registerAdapter(TemplateCollectionAdapter()); //79

      Hive.registerAdapter(BackGroundTranslationAdapter()); //80

      // Layout Visual Effects Related - New TypeIds starting from where paste-2.txt left off (80)
      Hive.registerAdapter(LayoutBlurAdapter()); // 81
      Hive.registerAdapter(LayoutBlurSigmaAdapter()); // 82
      Hive.registerAdapter(LayoutBorderRadiusAdapter()); // 83
      Hive.registerAdapter(LayoutBackgroundAdapter()); // 84
      Hive.registerAdapter(LayoutOpacityConfigAdapter()); // 85
      Hive.registerAdapter(LayoutVisualEffectsAdapter()); // 86
      Hive.registerAdapter(LayoutBreakpointsAdapter()); // 87

// Common Style Related
      Hive.registerAdapter(CommonStyleAdapter()); // 88
      Hive.registerAdapter(CommonGradientOverlayAdapter()); // 89
      Hive.registerAdapter(CommonGradientStopAdapter()); // 90
      Hive.registerAdapter(CommonAnimationsAdapter()); // 91
      Hive.registerAdapter(CommonHoverAnimationAdapter()); // 92

// Element Typography & Style Related
      Hive.registerAdapter(ElementTypographyAdapter()); // 93
      Hive.registerAdapter(ElementFontSizeAdapter()); // 94
      Hive.registerAdapter(ElementStyleColorsAdapter()); // 95
      Hive.registerAdapter(ElementShadowAdapter()); // 96

// Action Buttons Related
      Hive.registerAdapter(ActionButtonsAdapter()); // 97

// Layout Adjustments Related
      Hive.registerAdapter(LayoutAdjustmentsAdapter()); // 98
      Hive.registerAdapter(LayoutSpacingAdapter()); // 99
      Hive.registerAdapter(LayoutAlignmentAdapter()); // 100
      Hive.registerAdapter(LayoutConstraintsAdapter()); // 101
      Hive.registerAdapter(MaxWidthAdapter()); // 102
      Hive.registerAdapter(MinHeightAdapter()); // 103

// Responsive Config Related
      Hive.registerAdapter(ResponsiveConfigAdapter()); // 104
      Hive.registerAdapter(GridSpacingAdapter()); // 105
      Hive.registerAdapter(GridColumnsAdapter()); // 106
      Hive.registerAdapter(ResponsiveBreakpointAdapter()); // 107
      Hive.registerAdapter(ResponsiveBehaviorAdapter()); // 108
      Hive.registerAdapter(
          BreakpointsAdapter()); // 309 (as specified in the code)

// Action Related
      Hive.registerAdapter(ActionBackgroundAdapter()); // 202
      Hive.registerAdapter(ActionBlurAdapter()); // 203
      Hive.registerAdapter(ActionSigmaAdapter()); // 204
      Hive.registerAdapter(ActionShadowAdapter()); // 205
      Hive.registerAdapter(ActionOffsetAdapter()); // 206
    } catch (e) {
      print('Error registering adapters: $e');
      rethrow;
    }
  }

  // Open all Hive boxes
  Future<void> _openBoxes() async {
    configBox = await Hive.openBox<AppConfig>(configBoxName);
    quotesBox = await Hive.openBox<Quote>(quotesBoxName);
    backgroundsBox = await Hive.openBox<Background>(backgroundsBoxName);
    templatesBox = await Hive.openBox<Template>(templatesBoxName);
    categoriesBox = await Hive.openBox<Category>(categoriesBoxName);
    authorsBox = await Hive.openBox<Author>(authorsBoxName);
    sourcesBox = await Hive.openBox<Source>(sourcesBoxName);
    tagsBox = await Hive.openBox<Tag>(tagsBoxName);
  }

  // Load initial data from JSON
  Future<void> _loadInitialData() async {
    AppConfig? currentConfig = configBox.get('current');
    //if (currentConfig == null || !currentConfig.isInitialized) {
    if (true) {
      try {
        final String jsonContent =
            await rootBundle.loadString('assets/data/app_data.json');
        final Map<String, dynamic> data = json.decode(jsonContent);

        if (!_validateDataStructure(data)) {
          throw Exception('Invalid data structure in app_data.json');
        }

        await _storeInitialConfig(data);
        await _storeEntities(data['entities']);

        currentConfig = configBox.get('current');
        if (currentConfig != null) {
          currentConfig.isInitialized = true;
          await configBox.put('current', currentConfig);
        }
      } catch (e, stackTrace) {
        print('Error loading initial data: $e');
        print('Stack trace: $stackTrace');
        if (currentConfig != null) {
          currentConfig.isInitialized = false;
          await configBox.put('current', currentConfig);
        }
        rethrow;
      }
    }
  }

  // Validate JSON data structure
  bool _validateDataStructure(Map<String, dynamic> data) {
    final requiredKeys = [
      'metadata',
      'system_config',
      'entities',
      'validation_rules',
      'analytics_config'
    ];
    return requiredKeys.every((key) => data.containsKey(key));
  }

  // Store initial configuration
  Future<void> _storeInitialConfig(Map<String, dynamic> data) async {
    final config = AppConfig(
        metadata: Metadata.fromJson(data['metadata'] ?? {}),
        systemConfig: SystemConfig.fromJson(data['system_config'] ?? {}),
        entities: Entities.fromJson(data['entities'] ?? {}),
        validationRules:
            ValidationRules.fromJson(data['validation_rules'] ?? {}),
        analyticsConfig:
            AnalyticsConfig.fromJson(data['analytics_config'] ?? {}));
    await configBox.put('current', config);
  }

  // Store all entities
  Future<void> _storeEntities(Map<String, dynamic> entities) async {
    await Future.wait([
      _storeEntityCollection<Quote, QuoteCollection>(
        data: entities['quotes'],
        box: quotesBox,
        fromJson: Quote.fromJson,
        getId: (item) => item.uuid,
        collectionFromJson: QuoteCollection.fromJson,
      ),
      _storeEntityCollection<Background, BackgroundCollection>(
        data: entities['backgrounds'],
        box: backgroundsBox,
        fromJson: Background.fromJson,
        getId: (item) => item.uuid,
        collectionFromJson: BackgroundCollection.fromJson,
      ),
      _storeEntityCollection<Category, CategoryCollection>(
        data: entities['categories'],
        box: categoriesBox,
        fromJson: Category.fromJson,
        getId: (item) => item.id,
        collectionFromJson: CategoryCollection.fromJson,
      ),
      _storeEntityCollection<Template, TemplateCollection>(
        data: entities['templates'],
        box: templatesBox,
        fromJson: Template.fromJson,
        getId: (item) => item.uuid,
        collectionFromJson: TemplateCollection.fromJson,
      ),
      _storeEntityCollection<Author, AuthorCollection>(
        data: entities['authors'],
        box: authorsBox,
        fromJson: Author.fromJson,
        getId: (item) => item.uuid,
        collectionFromJson: AuthorCollection.fromJson,
      ),
      _storeEntityCollection<Source, SourceCollection>(
        data: entities['sources'],
        box: sourcesBox,
        fromJson: Source.fromJson,
        getId: (item) => item.uuid,
        collectionFromJson: SourceCollection.fromJson,
      ),
      _storeEntityCollection<Tag, TagCollection>(
        data: entities['tags'],
        box: tagsBox,
        fromJson: Tag.fromJson,
        getId: (item) => item.id,
        collectionFromJson: TagCollection.fromJson,
      ),
    ]);
  }

  Future<void> _storeEntityCollection<T, C>({
    required dynamic data,
    required Box<T> box,
    required T Function(Map<String, dynamic>) fromJson,
    required String Function(T) getId,
    C Function(Map<String, dynamic>)? collectionFromJson,
  }) async {
    try {
      if (data == null) return;

      if (data is Map<String, dynamic> && data.containsKey('data')) {
        // Use the collectionFromJson method to parse data
        final collection = collectionFromJson?.call(data);
        if (collection is C && (collection as dynamic).data is List) {
          for (final item in (collection as dynamic).data) {
            if (item is T) {
              await box.put(getId(item), item);
            }
          }
        }
        return;
      }

      if (data is List) {
        for (final item in data) {
          if (item is Map<String, dynamic>) {
            final entity = fromJson(item);
            await box.put(getId(entity), entity);
          }
        }
        return;
      }

      if (data is Map<String, dynamic>) {
        final entity = fromJson(data);
        await box.put(getId(entity), entity);
      }
    } catch (e, stackTrace) {
      print('Error storing ${T.toString()} collection: $e');
      print('Stack trace: $stackTrace');
      rethrow;
    }
  }

  // Special handling for author collection
  Future<void> _storeAuthorCollection(dynamic authorsData) async {
    if (authorsData == null) return;

    if (authorsData is Map<String, dynamic>) {
      try {
        final authorCollection = AuthorCollection.fromJson(authorsData);
        for (final author in authorCollection.data) {
          await authorsBox.put(author.uuid, author);
        }
      } catch (e) {
        print('Error processing author collection: $e');
      }
    }
  }

  // Initialize cache
  Future<void> _initializeCache() async {
    try {
      cache.value = {
        'supportedLanguages': currentLanguage.value,
        'categories': getAllCategories(),
        'authors': getAllAuthors(),
        'tags': getAllTags(),
      };
    } catch (e) {
      print('Error initializing cache: $e');
      cache.clear();
    }
  }

  // CRUD Operations for each entity type
  // AppConfig
  Future<void> saveAppConfig(AppConfig config) async =>
      await configBox.put('current', config);
  AppConfig? getAppConfig() => configBox.get('current');

  // Quotes
  Future<void> saveQuote(Quote quote) async =>
      await quotesBox.put(quote.uuid, quote);
  Quote? getQuote(String uuid) => quotesBox.get(uuid);
  List<Quote> getAllQuotes() => quotesBox.values.toList();
  Future<void> deleteQuote(String uuid) async => await quotesBox.delete(uuid);

  // Backgrounds
  Future<void> saveBackground(Background background) async =>
      await backgroundsBox.put(background.uuid, background);
  Background? getBackground(String uuid) => backgroundsBox.get(uuid);
  List<Background> getAllBackgrounds() => backgroundsBox.values.toList();
  Future<void> deleteBackground(String uuid) async =>
      await backgroundsBox.delete(uuid);

  // Templates
  Future<void> saveTemplate(Template template) async =>
      await templatesBox.put(template.uuid, template);
  Template? getTemplate(String uuid) => templatesBox.get(uuid);
  List<Template> getAllTemplates() => templatesBox.values.toList();
  Future<void> deleteTemplate(String uuid) async =>
      await templatesBox.delete(uuid);

  // Categories
  Future<void> saveCategory(Category category) async =>
      await categoriesBox.put(category.id, category);
  Category? getCategory(String id) => categoriesBox.get(id);
  List<Category> getAllCategories() => categoriesBox.values.toList();
  Future<void> deleteCategory(String id) async =>
      await categoriesBox.delete(id);

  // Authors
  Future<void> saveAuthor(Author author) async =>
      await authorsBox.put(author.uuid, author);
  Author? getAuthor(String uuid) => authorsBox.get(uuid);
  List<Author> getAllAuthors() => authorsBox.values.toList();
  Future<void> deleteAuthor(String uuid) async => await authorsBox.delete(uuid);

  // Sources
  Future<void> saveSource(Source source) async =>
      await sourcesBox.put(source.uuid, source);
  Source? getSource(String uuid) => sourcesBox.get(uuid);
  List<Source> getAllSources() => sourcesBox.values.toList();
  Future<void> deleteSource(String uuid) async => await sourcesBox.delete(uuid);

  // Tags
  Future<void> saveTag(Tag tag) async => await tagsBox.put(tag.id, tag);
  Tag? getTag(String id) => tagsBox.get(id);
  List<Tag> getAllTags() => tagsBox.values.toList();
  Future<void> deleteTag(String id) async => await tagsBox.delete(id);

  // Bulk operations
  Future<void> saveQuotes(List<Quote> quotes) async =>
      await quotesBox.putAll({for (var q in quotes) q.uuid: q});
  Future<void> saveBackgrounds(List<Background> backgrounds) async =>
      await backgroundsBox.putAll({for (var b in backgrounds) b.uuid: b});
  Future<void> saveTemplates(List<Template> templates) async =>
      await templatesBox.putAll({for (var t in templates) t.uuid: t});
  Future<void> saveCategories(List<Category> categories) async =>
      await categoriesBox.putAll({for (var c in categories) c.id: c});
  Future<void> saveAuthors(List<Author> authors) async =>
      await authorsBox.putAll({for (var a in authors) a.uuid: a});
  Future<void> saveSources(List<Source> sources) async =>
      await sourcesBox.putAll({for (var s in sources) s.uuid: s});
  Future<void> saveTags(List<Tag> tags) async =>
      await tagsBox.putAll({for (var t in tags) t.id: t});

  // Export/Import operations
  Future<Map<String, dynamic>> exportData() async {
    return {
      'config': configBox.get('current')?.toJson(),
      'quotes': quotesBox.values.map((q) => q.toJson()).toList(),
      'backgrounds': backgroundsBox.values.map((b) => b.toJson()).toList(),
      'templates': templatesBox.values.map((t) => t.toJson()).toList(),
      'categories': categoriesBox.values.map((c) => c.toJson()).toList(),
      'authors': authorsBox.values.map((a) => a.toJson()).toList(),
      'sources': sourcesBox.values.map((s) => s.toJson()).toList(),
      'tags': tagsBox.values.map((t) => t.toJson()).toList(),
      'exportDate': DateTime.now().toIso8601String(),
    };
  }

  Future<void> importData(Map<String, dynamic> data) async {
    await _safeCloseBoxes();
    await _openBoxes();

    try {
      if (data['config'] != null) {
        await configBox.put('current', AppConfig.fromJson(data['config']));
      }

      await _storeEntities({
        'quotes': data['quotes'],
        'backgrounds': data['backgrounds'],
        'templates': data['templates'],
        'categories': data['categories'],
        'authors': {'data': data['authors']},
        'sources': data['sources'],
        'tags': data['tags']
      });

      await _initializeCache();
    } catch (e) {
      print('Error importing data: $e');
      rethrow;
    }
  }

  // Utility methods
  Future<void> clearAll() async {
    await Future.wait([
      configBox.clear(),
      quotesBox.clear(),
      backgroundsBox.clear(),
      templatesBox.clear(),
      categoriesBox.clear(),
      authorsBox.clear(),
      sourcesBox.clear(),
      tagsBox.clear(),
    ]);
  }

  Future<void> _safeCloseBoxes() async {
    try {
      await Future.wait([
        if (configBox.isOpen == true) configBox.close(),
        if (quotesBox.isOpen == true) quotesBox.close(),
        if (backgroundsBox.isOpen == true) backgroundsBox.close(),
        if (templatesBox.isOpen == true) templatesBox.close(),
        if (categoriesBox.isOpen == true) categoriesBox.close(),
        if (authorsBox.isOpen == true) authorsBox.close(),
        if (sourcesBox.isOpen == true) sourcesBox.close(),
        if (tagsBox.isOpen == true) tagsBox.close(),
      ]);
    } catch (e) {
      print('Error closing boxes: $e');
    }
  }

  // // Search functionality
  // List<Quote> searchQuotes(String query) {
  //   query = query.toLowerCase();
  //   return quotesBox.values.where((quote) {
  //     return quote.content.toLowerCase().contains(query) ||
  //            quote.author?.name.toLowerCase().contains(query) == true ||
  //            quote.tags.any((tag) => tag.toLowerCase().contains(query));
  //   }).toList();
  // }

  // List<Author> searchAuthors(String query) {
  //   query = query.toLowerCase();
  //   return authorsBox.values.where((author) {
  //     return author.name.toLowerCase().contains(query) ||
  //            author.description?.toLowerCase().contains(query) == true;
  //   }).toList();
  // }

  // List<Tag> searchTags(String query) {
  //   query = query.toLowerCase();
  //   return tagsBox.values.where((tag) {
  //     return tag.name.toLowerCase().contains(query) ||
  //            tag.description?.toLowerCase().contains(query) == true;
  //   }).toList();
  // }

  // Language related methods
  Future<void> setCurrentLanguage(String languageCode) async {
    currentLanguage.value = languageCode;
    // await _updateCacheForLanguage(languageCode);
  }

  // Future<void> _updateCacheForLanguage(String languageCode) async {
  //   try {
  //     final categories = await getAllCategories();
  //     final authors = await getAllAuthors();
  //     final tags = await getAllTags();

  //     cache.value = {
  //       ...cache,
  //       'currentLanguage': languageCode,
  //       'categories': categories.map((c) => c.getTranslation(languageCode)).toList(),
  //       'authors': authors.map((a) => a.getTranslation(languageCode)).toList(),
  //       'tags': tags.map((t) => t.getTranslation(languageCode)).toList(),
  //     };
  //   } catch (e) {
  //     print('Error updating cache for language $languageCode: $e');
  //   }
  // }

  // Filter methods

  List<Quote> getQuotesByCategory(String categoryId) {
    return quotesBox.values
        .where((quote) => quote.categoryIds.contains(categoryId))
        .toList();
  }

  List<Quote> getQuotesByAuthor(String authorId) {
    return quotesBox.values
        .where((quote) => quote.authorId == authorId)
        .toList();
  }

  List<Quote> getQuotesByTag(String tagId) {
    return quotesBox.values
        .where((quote) => quote.tagIds.contains(tagId))
        .toList();
  }

  // Background related methods
  List<Background> getBackgroundsByCategory(String categoryId) {
    return backgroundsBox.values
        .where((bg) => bg.categoryIds.contains(categoryId))
        .toList();
  }

  List<Background> getBackgroundsByTag(String tagId) {
    return backgroundsBox.values
        .where((bg) => bg.tagIds.contains(tagId))
        .toList();
  }

  // Template related methods
  List<Template> getTemplatesByCategory(String categoryId) {
    return templatesBox.values
        .where((template) => template.categoryIds.contains(categoryId))
        .toList();
  }

  List<Template> getTemplatesByTag(String tagId) {
    return templatesBox.values
        .where((template) => template.tagIds.contains(tagId))
        .toList();
  }

  // Statistics and analytics methods
  Map<String, dynamic> getDatabaseStats() {
    return {
      'totalQuotes': quotesBox.length,
      'totalAuthors': authorsBox.length,
      'totalBackgrounds': backgroundsBox.length,
      'totalTemplates': templatesBox.length,
      'totalCategories': categoriesBox.length,
      'totalTags': tagsBox.length,
      'totalSources': sourcesBox.length,
      'lastUpdated': DateTime.now().toIso8601String(),
    };
  }

  // Validation methods
  // bool validateQuote(Quote quote) {
  //   final config = getAppConfig();
  //   if (config == null) return false;

  //   final validation = config.validationRules.quotes;
  //   if (validation == null) return true;

  //   return quote.content.length >= validation.minLength &&
  //          quote.content.length <= validation.maxLength &&
  //          (validation.requiredFields.every((field) {
  //            switch (field) {
  //              case 'author': return quote.author != null;
  //              case 'source': return quote.source != null;
  //              case 'categories': return quote.categories.isNotEmpty;
  //              case 'tags': return quote.tags.isNotEmpty;
  //              default: return true;
  //            }
  //          }));
  // }

  // Error handling and recovery methods
  Future<bool> verifyDatabaseIntegrity() async {
    try {
      // Verify all boxes are open and accessible
      if (!configBox.isOpen ||
          !quotesBox.isOpen ||
          !backgroundsBox.isOpen ||
          !templatesBox.isOpen ||
          !categoriesBox.isOpen ||
          !authorsBox.isOpen ||
          !sourcesBox.isOpen ||
          !tagsBox.isOpen) {
        return false;
      }

      // Verify essential data
      if (getAppConfig() == null) {
        return false;
      }

      return true;
    } catch (e) {
      print('Database integrity check failed: $e');
      return false;
    }
  }

  Future<void> repairDatabase() async {
    try {
      await _safeCloseBoxes();
      await _openBoxes();
      await _loadInitialData();
      await _initializeCache();
    } catch (e) {
      print('Database repair failed: $e');
      rethrow;
    }
  }

  // Cleanup and disposal methods
  Future<void> dispose() async {
    try {
      await _safeCloseBoxes();
      cache.clear();
    } catch (e) {
      print('Error during database disposal: $e');
    }
  }

  @override
  void onClose() {
    dispose();
    super.onClose();
  }
}
