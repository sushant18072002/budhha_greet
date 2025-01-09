import 'dart:convert';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter/services.dart' show rootBundle;

import '../../shared/models/analytics/analytics_config.dart';
import '../../shared/models/analytics/audit.dart';
import '../../shared/models/analytics/metrics.dart';
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
import '../../shared/models/app_config/system_config.dart';
import '../../shared/models/app_config/theme_config.dart';
import '../../shared/models/entities/author.dart';
import '../../shared/models/entities/background.dart';
import '../../shared/models/entities/category.dart';
import '../../shared/models/entities/entities.dart';
import '../../shared/models/entities/language.dart';
import '../../shared/models/entities/quote.dart';
import '../../shared/models/entities/source.dart';
import '../../shared/models/entities/tag.dart';
import '../../shared/models/entities/template.dart';
import '../../shared/models/entities/translation.dart';
import '../../shared/models/layout/element_layout.dart';
import '../../shared/models/layout/layout_config.dart';
import '../../shared/models/layout/orientation_layout.dart';
import '../../shared/models/layout/position.dart';
import '../../shared/models/layout/safe_area.dart';
import '../../shared/models/layout/size.dart';
import '../../shared/models/style/font_size.dart';
import '../../shared/models/style/style.dart';
import '../../shared/models/style/style_colors.dart';
import '../../shared/models/style/typography.dart';
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

  // Boxes
  late Box<AppConfig> configBox;
  late Box<Quote> quotesBox;
  late Box<Background> backgroundsBox;
  late Box<Template> templatesBox;
  late Box<Category> categoriesBox;
  late Box<Author> authorsBox;
  late Box<Source> sourcesBox;
  late Box<Tag> tagsBox;

  // Box Names
  static const String configBoxName = 'appConfig';
  static const String quotesBoxName = 'quotes';
  static const String backgroundsBoxName = 'backgrounds';
  static const String templatesBoxName = 'templates';
  static const String categoriesBoxName = 'categories';
  static const String authorsBoxName = 'authors';
  static const String sourcesBoxName = 'sources';
  static const String tagsBoxName = 'tags';

  final RxString currentLanguage = 'en'.obs;
  final RxList<String> supportedLanguages = <String>['en'].obs;
  final RxMap<String, dynamic> cache = <String, dynamic>{}.obs;

  bool isInitialized = false;

  Future<DatabaseService> init() async {
    if (isInitialized) return this;

    try {
      // Get application documents directory
      final appDocumentDir =
          await path_provider.getApplicationDocumentsDirectory();

      // Initialize Hive
      Hive.init(appDocumentDir.path);

      // Register all adapters
      _registerAdapters();

      // Open all boxes
      await _openBoxes();

      // Load initial data
      await _loadInitialData();

      // Initialize cache
      await _initializeCache();

      isInitialized = true;
      return this;
    } catch (e) {
      print('Error in database initialization: $e');

      await _closeBoxes();
      rethrow;
    }
  }

  Future<void> _loadInitialData() async {
    if (true) {
      try {
        print('Loading initial data from JSON...');
        final String jsonContent =
            await rootBundle.loadString('assets/data/app_data.json');
        final Map<String, dynamic> data = json.decode(jsonContent);
        print('JSON data loaded successfully');

        if (!_validateDataStructure(data)) {
          throw Exception('Invalid data structure in app_data.json');
        }

        // Store initial configuration
        await _storeInitialConfig(data);
         print('JSON data _storeInitialConfig successfully');
        final entities = data['entities'] as Map<String, dynamic>;
        await Future.wait([
          _storeQuotes(entities['quotes'] ?? []),
          _storeBackgrounds(entities['backgrounds'] ?? []),
          _storeTemplates(entities['templates'] ?? []),
          _storeCategories(entities['categories'] ?? []),
          _storeAuthors(entities['authors']),
          _storeSources(entities['sources'] ?? []),
          _storeTags(entities['tags'] ?? []),
        ]);

        //await configBox.put('isInitialized', true);
        print('Initial data loaded successfully');
      } catch (e, stackTrace) {
        print('Error loading initial data: $e');
        print('Stack trace: $stackTrace');
        //await configBox.put('isInitialized', false);
        rethrow;
      }
    }
  }

  void _registerAdapters() {
    // Register all type adapters
    Hive.registerAdapter(ApiConfigAdapter());
    Hive.registerAdapter(MetadataAdapter());
    Hive.registerAdapter(SystemConfigAdapter());
    Hive.registerAdapter(LanguageConfigAdapter());
    Hive.registerAdapter(AppSettingsAdapter());
    Hive.registerAdapter(ThemeConfigAdapter());
    Hive.registerAdapter(EntitiesAdapter());
    Hive.registerAdapter(LanguageAdapter());
    Hive.registerAdapter(QuoteAdapter());
    Hive.registerAdapter(BackgroundAdapter());
    Hive.registerAdapter(TranslationAdapter());
    Hive.registerAdapter(StyleAdapter());
    Hive.registerAdapter(TypographyAdapter());
    Hive.registerAdapter(FontSizeAdapter());
    Hive.registerAdapter(StyleColorsAdapter());
    Hive.registerAdapter(QuoteMetadataAdapter());
    Hive.registerAdapter(MetricsAdapter());
    Hive.registerAdapter(AuditAdapter());
    Hive.registerAdapter(VisualDataAdapter());
    Hive.registerAdapter(ImageDataAdapter());
    Hive.registerAdapter(ImageVariantAdapter());
    Hive.registerAdapter(GradientDataAdapter());
    Hive.registerAdapter(GradientStopAdapter());
    Hive.registerAdapter(ColorDataAdapter());
    Hive.registerAdapter(ColorPaletteAdapter());
    Hive.registerAdapter(VisualEffectsAdapter());
    Hive.registerAdapter(AttributionAdapter());
    Hive.registerAdapter(OptimizationAdapter());
    Hive.registerAdapter(CacheConfigAdapter());
    Hive.registerAdapter(TemplateAdapter());
    Hive.registerAdapter(TemplateTranslationAdapter());
    Hive.registerAdapter(CompositionAdapter());
    Hive.registerAdapter(LayoutConfigAdapter());
    Hive.registerAdapter(OrientationLayoutAdapter());
    Hive.registerAdapter(ElementLayoutAdapter());
    Hive.registerAdapter(PositionAdapter());
    Hive.registerAdapter(SizeAdapter());
    Hive.registerAdapter(SafeAreaAdapter());
    Hive.registerAdapter(StyleConfigAdapter());
    Hive.registerAdapter(ElementStyleAdapter());
    Hive.registerAdapter(TemplateMetadataAdapter());
    Hive.registerAdapter(ValidationRulesAdapter());
    Hive.registerAdapter(QuoteValidationAdapter());
    Hive.registerAdapter(TextValidationAdapter());
    Hive.registerAdapter(AuthorValidationAdapter());
    Hive.registerAdapter(TemplateValidationAdapter());
    Hive.registerAdapter(TypographyValidationAdapter());
    Hive.registerAdapter(AnalyticsConfigAdapter());
    Hive.registerAdapter(TrackingConfigAdapter());
    Hive.registerAdapter(ReportingConfigAdapter());
    Hive.registerAdapter(PopularItemsAdapter());
    Hive.registerAdapter(ConnectivityConfigAdapter());
    Hive.registerAdapter(RetryConfigAdapter());
    Hive.registerAdapter(RateLimitConfigAdapter());
    Hive.registerAdapter(ImageCacheConfigAdapter());
    Hive.registerAdapter(CompressionConfigAdapter());
    Hive.registerAdapter(DataCacheConfigAdapter());
    Hive.registerAdapter(CategoryCollectionAdapter());
    Hive.registerAdapter(CategorySchemaAdapter());
    Hive.registerAdapter(CategoryAdapter());
    Hive.registerAdapter(CategoryTranslationAdapter());
    Hive.registerAdapter(CategoryMetadataAdapter());
    Hive.registerAdapter(BackgroundCollectionAdapter());
    Hive.registerAdapter(BackgroundSchemaAdapter());
    Hive.registerAdapter(SystemCacheConfigAdapter());
    Hive.registerAdapter(TagCollectionAdapter());
    Hive.registerAdapter(TagSchemaAdapter());
    Hive.registerAdapter(TagAdapter());
    Hive.registerAdapter(TagTranslationAdapter());
    Hive.registerAdapter(TagMetadataAdapter());
    Hive.registerAdapter(AuthorCollectionAdapter());
    Hive.registerAdapter(AuthorAdapter());
    Hive.registerAdapter(AuthorTranslationAdapter());
    Hive.registerAdapter(SourceCollectionAdapter());
    Hive.registerAdapter(SourceAdapter());
    Hive.registerAdapter(SourceTranslationAdapter());
  }

  Future<void> _openBoxes() async {
    // Open all boxes
    configBox = await Hive.openBox<AppConfig>(configBoxName);
    quotesBox = await Hive.openBox<Quote>(quotesBoxName);
    backgroundsBox = await Hive.openBox<Background>(backgroundsBoxName);
    templatesBox = await Hive.openBox<Template>(templatesBoxName);
    categoriesBox = await Hive.openBox<Category>(categoriesBoxName);
    authorsBox = await Hive.openBox<Author>(authorsBoxName);
    sourcesBox = await Hive.openBox<Source>(sourcesBoxName);
    tagsBox = await Hive.openBox<Tag>(tagsBoxName);
  }

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

  Future<void> _storeInitialConfig(Map<String, dynamic> data) async {
    print("metadata  ${data['metadata']}");
    final config = AppConfig(
        metadata: Metadata.fromJson(data['metadata']??{}),
        systemConfig: SystemConfig.fromJson(data['system_config'] ?? {}),
        entities: Entities.fromJson(data['entities'] ?? {}),
        validationRules: ValidationRules.fromJson(data['validation_rules']??{}),
        analyticsConfig :AnalyticsConfig.fromJson(data['analytics_config']??{})
        );
    await configBox.put('current', config);
  }

  Future<void> _storeQuotes(List<dynamic> quotes) async {
    for (final quoteData in quotes) {
      if (quoteData is Map<String, dynamic>) {
        try {
          final quote = Quote.fromJson(quoteData);
          await quotesBox.put(quote.uuid, quote);
        } catch (e) {
          print('Error storing quote: ${quoteData['uuid']} - $e');
        }
      }
    }
  }

  Future<void> _storeBackgrounds(List<dynamic> backgrounds) async {
    for (final bgData in backgrounds) {
      if (bgData is Map<String, dynamic>) {
        try {
          final background = Background.fromJson(bgData);
          await backgroundsBox.put(background.uuid, background);
        } catch (e) {
          print('Error storing background: ${bgData['uuid']} - $e');
        }
      }
    }
  }

  Future<void> _storeTemplates(List<dynamic> templates) async {
    for (final templateData in templates) {
      if (templateData is Map<String, dynamic>) {
        try {
          final template = Template.fromJson(templateData);
          await templatesBox.put(template.uuid, template);
        } catch (e) {
          print('Error storing template: ${templateData['uuid']} - $e');
        }
      }
    }
  }

  Future<void> _storeCategories(List<dynamic> categories) async {
    for (final categoryData in categories) {
      if (categoryData is Map<String, dynamic>) {
        try {
          final category = Category.fromJson(categoryData);
          await categoriesBox.put(category.id, category);
        } catch (e) {
          print('Error storing category: ${categoryData['id']} - $e');
        }
      }
    }
  }

  Future<void> _storeAuthors(dynamic authorsData) async {
  if (authorsData == null) return;
  
  // First convert to AuthorCollection to handle the wrapper object
  if (authorsData is Map<String, dynamic>) {
    try {
      final authorCollection = AuthorCollection.fromJson(authorsData);
      // Now process the actual author list
      for (final author in authorCollection.data) {
        await authorsBox.put(author.uuid, author);
      }
    } catch (e) {
      print('Error processing author collection: $e');
    }
  } else {
    print('Invalid authors data format: $authorsData');
  }
}

  Future<void> _storeSources(List<dynamic> sources) async {
    for (final sourceData in sources) {
      if (sourceData is Map<String, dynamic>) {
        try {
          final source = Source.fromJson(sourceData);
          await sourcesBox.put(source.uuid, source);
        } catch (e) {
          print('Error storing source: ${sourceData['uuid']} - $e');
        }
      }
    }
  }

  Future<void> _storeTags(List<dynamic> tags) async {
    for (final tagData in tags) {
      if (tagData is Map<String, dynamic>) {
        try {
          final tag = Tag.fromJson(tagData);
          await tagsBox.put(tag.id, tag);
        } catch (e) {
          print('Error storing tag: ${tagData['id']} - $e');
        }
      }
    }
  }

  Future<void> _initializeCache() async {
    try {
      cache.value = {
        'supportedLanguages': currentLanguage.value,
        'categories': await getAllCategories(),
        'authors': await getAllAuthors(),
        'tags': await getAllTags(),
      };
    } catch (e) {
      print('Error initializing cache: $e');
      cache.clear();
    }
  }

  // Export/Import Operations
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
    await _closeBoxes();
    await _openBoxes();

    try {
      if (data['config'] != null) {
        await configBox.put('current', AppConfig.fromJson(data['config']));
      }

      await Future.wait([
        _storeQuotes(data['quotes'] ?? []),
        _storeBackgrounds(data['backgrounds'] ?? []),
        _storeTemplates(data['templates'] ?? []),
        _storeCategories(data['categories'] ?? []),
        _storeAuthors(data['authors'] ?? []),
        _storeSources(data['sources'] ?? []),
        _storeTags(data['tags'] ?? [])
      ]);

      await _initializeCache();
    } catch (e) {
      print('Error importing data: $e');
      rethrow;
    }
  }

  // Close boxes
  Future<void> _closeBoxes() async {
    await Future.wait([
      configBox.close(),
      quotesBox.close(),
      backgroundsBox.close(),
      templatesBox.close(),
      categoriesBox.close(),
      authorsBox.close(),
      sourcesBox.close(),
      tagsBox.close(),
    ]);
  }

  // AppConfig Operations
  Future<void> saveAppConfig(AppConfig config) async {
    await configBox.put('current', config);
  }

  AppConfig? getAppConfig() {
    return configBox.get('current');
  }

  // Quote Operations
  Future<void> saveQuote(Quote quote) async {
    await quotesBox.put(quote.uuid, quote);
  }

  Future<void> saveQuotes(List<Quote> quotes) async {
    final Map<String, Quote> quotesMap = {
      for (var quote in quotes) quote.uuid: quote
    };
    await quotesBox.putAll(quotesMap);
  }

  Quote? getQuote(String uuid) {
    return quotesBox.get(uuid);
  }

  List<Quote> getAllQuotes() {
    return quotesBox.values.toList();
  }

  Future<void> deleteQuote(String uuid) async {
    await quotesBox.delete(uuid);
  }

  // Background Operations
  Future<void> saveBackground(Background background) async {
    await backgroundsBox.put(background.uuid, background);
  }

  Future<void> saveBackgrounds(List<Background> backgrounds) async {
    final Map<String, Background> backgroundsMap = {
      for (var bg in backgrounds) bg.uuid: bg
    };
    await backgroundsBox.putAll(backgroundsMap);
  }

  Background? getBackground(String uuid) {
    return backgroundsBox.get(uuid);
  }

  List<Background> getAllBackgrounds() {
    return backgroundsBox.values.toList();
  }

  Future<void> deleteBackground(String uuid) async {
    await backgroundsBox.delete(uuid);
  }

  // Template Operations
  Future<void> saveTemplate(Template template) async {
    await templatesBox.put(template.uuid, template);
  }

  Future<void> saveTemplates(List<Template> templates) async {
    final Map<String, Template> templatesMap = {
      for (var template in templates) template.uuid: template
    };
    await templatesBox.putAll(templatesMap);
  }

  Template? getTemplate(String uuid) {
    return templatesBox.get(uuid);
  }

  List<Template> getAllTemplates() {
    return templatesBox.values.toList();
  }

  Future<void> deleteTemplate(String uuid) async {
    await templatesBox.delete(uuid);
  }

  // Category Operations
  Future<void> saveCategory(Category category) async {
    await categoriesBox.put(category.id, category);
  }

  Future<void> saveCategories(List<Category> categories) async {
    final Map<String, Category> categoriesMap = {
      for (var category in categories) category.id: category
    };
    await categoriesBox.putAll(categoriesMap);
  }

  Category? getCategory(String id) {
    return categoriesBox.get(id);
  }

  List<Category> getAllCategories() {
    return categoriesBox.values.toList();
  }

  Future<void> deleteCategory(String id) async {
    await categoriesBox.delete(id);
  }

  // Author Operations
  Future<void> saveAuthor(Author author) async {
    await authorsBox.put(author.uuid, author);
  }

  Future<void> saveAuthors(List<Author> authors) async {
    final Map<String, Author> authorsMap = {
      for (var author in authors) author.uuid: author
    };
    await authorsBox.putAll(authorsMap);
  }

  Author? getAuthor(String uuid) {
    return authorsBox.get(uuid);
  }

  List<Author> getAllAuthors() {
    return authorsBox.values.toList();
  }

  Future<void> deleteAuthor(String uuid) async {
    await authorsBox.delete(uuid);
  }

  // Source Operations
  Future<void> saveSource(Source source) async {
    await sourcesBox.put(source.uuid, source);
  }

  Future<void> saveSources(List<Source> sources) async {
    final Map<String, Source> sourcesMap = {
      for (var source in sources) source.uuid: source
    };
    await sourcesBox.putAll(sourcesMap);
  }

  Source? getSource(String uuid) {
    return sourcesBox.get(uuid);
  }

  List<Source> getAllSources() {
    return sourcesBox.values.toList();
  }

  Future<void> deleteSource(String uuid) async {
    await sourcesBox.delete(uuid);
  }

  // Tag Operations
  Future<void> saveTag(Tag tag) async {
    await tagsBox.put(tag.id, tag);
  }

  Future<void> saveTags(List<Tag> tags) async {
    final Map<String, Tag> tagsMap = {for (var tag in tags) tag.id: tag};
    await tagsBox.putAll(tagsMap);
  }

  Tag? getTag(String id) {
    return tagsBox.get(id);
  }

  List<Tag> getAllTags() {
    return tagsBox.values.toList();
  }

  Future<void> deleteTag(String id) async {
    await tagsBox.delete(id);
  }

  // Clear all data
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

  // Close all boxes
  Future<void> closeBoxes() async {
    await Future.wait([
      configBox.close(),
      quotesBox.close(),
      backgroundsBox.close(),
      templatesBox.close(),
      categoriesBox.close(),
      authorsBox.close(),
      sourcesBox.close(),
      tagsBox.close(),
    ]);
  }

  // Dispose service
  @override
  void onClose() {
    closeBoxes();
    super.onClose();
  }
}
