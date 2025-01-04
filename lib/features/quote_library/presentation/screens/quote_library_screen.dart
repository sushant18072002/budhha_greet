import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/services/database_service.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_text_styles.dart';
import '../../data/models/quote_model.dart';

class QuoteLibraryController extends GetxController {
  final DatabaseService _db = Get.find<DatabaseService>();
  final searchController = TextEditingController();
  final RxList<Quote> quotes = <Quote>[].obs;
  final RxList<Quote> filteredQuotes = <Quote>[].obs;
  final RxList<String> selectedCategories = <String>[].obs;
  final RxList<String> categories = <String>[].obs;
  
  @override
  void onInit() {
    super.onInit();
    loadCategories();
    loadQuotes();
  }

  Future<void> loadCategories() async {
    categories.value = await _db.getCategories();
  }

  Future<void> loadQuotes() async {
    quotes.value = await _db.getQuotes();
    print("quotes lenght ${quotes.length}");
    filterQuotes();
  }

  void toggleCategory(String category) {
    if (selectedCategories.contains(category)) {
      selectedCategories.remove(category);
    } else {
      selectedCategories.add(category);
    }
    filterQuotes();
  }

  void filterQuotes() {
  final searchTerm = searchController.text.toLowerCase();
  final currentLang = _db.currentLanguage.value;

  filteredQuotes.value = quotes.where((quote) {
    final quoteText = quote.text[currentLang]?.toLowerCase();
    final quoteAuthor = quote.author[currentLang]?.toLowerCase();

    final matchesSearch = (quoteText?.contains(searchTerm) ?? false) ||
        (quoteAuthor?.contains(searchTerm) ?? false);

    final matchesCategories = selectedCategories.isEmpty ||
        (quote.categories.any((cat) => selectedCategories.contains(cat)));

    return matchesSearch && matchesCategories;
  }).toList();
}


  void shareQuote(Quote quote) {
    // Share implementation
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}

class QuoteLibraryScreen extends GetView<QuoteLibraryController> {
  const QuoteLibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray50,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _buildAppBar(),
            _buildSearchBar(),
            _buildCategoryChips(),
            _buildQuoteGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildQuoteCard(Quote quote) {
    final currentLang = Get.find<DatabaseService>().currentLanguage.value;
    
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.harmonyPurple.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: () => _showQuoteDetail(quote),
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            quote.text[currentLang] ?? '',
                            style: AppTextStyles.bodyMedium.copyWith(
                              fontStyle: FontStyle.italic,
                              fontSize: quote.style.fontSize,
                              fontFamily: quote.style.fontFamily,
                            ),
                            maxLines: 6,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '- ${quote.author[currentLang] ?? ''}',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.amber800,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Wrap(
                      spacing: 4,
                      children: quote.categories.map((category) {
                        return Chip(
                          label: Text(
                            category,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.amber800,
                            ),
                          ),
                          backgroundColor: AppColors.amber50,
                          padding: EdgeInsets.zero,
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: Icon(
                    Icons.share_rounded,
                    color: AppColors.amber600,
                    size: 20,
                  ),
                  onPressed: () => controller.shareQuote(quote),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showQuoteDetail(Quote quote) {
    final currentLang = Get.find<DatabaseService>().currentLanguage.value;
    
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              quote.text[currentLang] ?? '',
              style: AppTextStyles.bodyLarge.copyWith(
                fontStyle: FontStyle.italic,
                fontSize: quote.style.fontSize,
                fontFamily: quote.style.fontFamily,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '- ${quote.author[currentLang] ?? ''}',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.amber800,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.end,
            ),
            if (quote.source[currentLang]?.isNotEmpty ?? false) ...[
              const SizedBox(height: 8),
              Text(
                quote.source[currentLang]!,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.amber600,
                ),
                textAlign: TextAlign.end,
              ),
            ],
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(
                  icon: Icons.share_rounded,
                  label: 'Share',
                  onTap: () => controller.shareQuote(quote),
                ),
                _buildActionButton(
                  icon: Icons.edit,
                  label: 'Customize',
                  onTap: () {
                    Get.back();
                    // Navigate to customize screen with quote
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildAppBar() {
    return SliverAppBar(
      floating: true,
      title: Text('Quote Library', style: AppTextStyles.headlineMedium),
      backgroundColor: AppColors.white,
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(Icons.favorite_border, color: AppColors.amber600),
          onPressed: () {
            // Navigate to favorites
          },
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.harmonyPurple.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            controller: controller.searchController,
            onChanged: (_) => controller.filterQuotes(),
            decoration: InputDecoration(
              hintText: 'Search quotes...',
              prefixIcon: Icon(Icons.search, color: AppColors.amber600),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChips() {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Obx(() => Row(
          children: controller.categories.map((category) {
            final isSelected = controller.selectedCategories.contains(category);
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: FilterChip(
                selected: isSelected,
                label: Text(category),
                onSelected: (_) => controller.toggleCategory(category),
                selectedColor: AppColors.amber200,
                checkmarkColor: AppColors.amber800,
                backgroundColor: AppColors.white,
                labelStyle: AppTextStyles.bodyMedium.copyWith(
                  color: isSelected ? AppColors.amber800 : AppColors.amber600,
                ),
              ),
            );
          }).toList(),
        )),
      ),
    );
  }

  Widget _buildQuoteGrid() {
    return Obx(() => SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.8,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final quote = controller.filteredQuotes[index];
            return _buildQuoteCard(quote);
          },
          childCount: controller.filteredQuotes.length,
        ),
      ),
    ));
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColors.amber600),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.amber600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}