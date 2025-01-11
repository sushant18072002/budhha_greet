import 'package:buddha_greet/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shared/models/entities/template.dart';
import '../controllers/home_controller.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_text_styles.dart';
import 'package:card_swiper/card_swiper.dart';

import '../widgets/morning_template.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray50,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: controller.refreshData,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 16),
                  _buildCarousel(context),
                  const SizedBox(height: 16),
                  _buildCategories(),
                  const SizedBox(height: 16),
                  MorningTemplatesWidget()
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }
  
  Widget _buildCarousel(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      return Container(
        height: MediaQuery.of(context).size.height * 0.35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.amber600.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Swiper(
          itemBuilder: (context, index) => _buildCarouselItem(
            controller.carouselItems[index],
          ),
          itemCount: controller.carouselItems.length,
          pagination: const SwiperPagination(
            builder: DotSwiperPaginationBuilder(
              activeColor: AppColors.amber600,
              color: AppColors.amber200,
            ),
          ),
          scale: 0.9,
          viewportFraction: 0.85,
        ),
      );
    });
  }

  Widget _buildCarouselItem(Map<String, dynamic> item) {
    final template = item['template'];
    final background = item['background'];
    final quote = item['quote'];
    //debugPrint("template.greeting ${template.greeting} \n greeting ${template.greeting[controller.currentLanguage.value]}");
    debugPrint("quote.text ${quote.text} \n text ${quote.text[controller.currentLanguage.value]}");
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: background?.imageUrl != null
            ? DecorationImage(
                image: AssetImage(background!.imageUrl!),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3),
                  BlendMode.darken,
                ),
              )
            : null,
        gradient:  background?.gradient != null
            ? LinearGradient(
                colors: [
                  Color(int.parse(background!.gradient!['startColor'])),
                  Color(int.parse(background.gradient!['endColor'])),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (template.title.isNotEmpty)
              Text(
                template.title[controller.currentLanguage.value],
                style: template.style.greeting != null
                    ? AppTextStyles.quoteText.copyWith(
                        fontSize: template.style.greeting.fontSize,
                        color: Color(
                          int.parse(template.style.greeting.colorHex.replaceAll('#', '0xFF')),
                        ),
                      )
                    : AppTextStyles.quoteText,
                textAlign: TextAlign.center,
              ),
            if (quote != null) ...[
              const SizedBox(height: 16),
              Text(
                quote.text[controller.currentLanguage.value] ?? '',
                style: template.style.quote != null
                    ? AppTextStyles.quoteText.copyWith(
                        fontSize: template.style.quote.fontSize*0.9,
                        color: Color(
                          int.parse(template.style.quote.colorHex.replaceAll('#', '0xFF')),
                        ),
                      )
                    : AppTextStyles.quoteText,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                '- ${quote.author[controller.currentLanguage.value] ?? ''}',
                style: AppTextStyles.quoteAuthor,
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Categories', style: AppTextStyles.sectionTitle),
          const SizedBox(height: 16),
          SizedBox(
            height:60,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.categories.length,
              itemBuilder: (context, index) {
                return _buildCategoryCard(controller.categories[index].translations.entries.first.value.name);
              },
            ),
          ),
        ],
      );

      // return Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Text('Categories', style: AppTextStyles.sectionTitle),
      //     const SizedBox(height: 16),
      //     GridView.builder(
      //       shrinkWrap: true,
      //       physics: const NeverScrollableScrollPhysics(),
      //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //         crossAxisCount: 2,
      //         crossAxisSpacing: 16,
      //         mainAxisSpacing: 16,
      //         childAspectRatio: 2,
      //       ),
      //       itemCount: controller.categories.length,
      //       itemBuilder: (context, index) {
      //         return _buildCategoryCard(controller.categories[index]);
      //       },
      //     ),
      //   ],
      // );
    });
  }

  Widget _buildCategoryCard(String category) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.amber100, AppColors.amber300],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.amber600.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          category,
          style: AppTextStyles.templateTitle.copyWith(
            color: AppColors.amber800,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('BuddhaGreet', style: AppTextStyles.appTitle),
        Row(
          children: [
            Icon(Icons.notifications_none, color: AppColors.amber600, size: 24),
            const SizedBox(width: 16),
            Icon(Icons.search, color: AppColors.amber600, size: 24),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(color: AppColors.amber100, width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, 'Home', true),
          GestureDetector(
            onTap: ()=>Get.toNamed(AppRoutes.creator)
            ,
            child: _buildNavItem(Icons.add, 'Create', false)),
          GestureDetector(
            onTap: ()=>Get.toNamed(AppRoutes.library),
            child: _buildNavItem(Icons.book, 'Library', false)),
          _buildNavItem(Icons.person, 'Profile', false),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    final color = isActive ? AppColors.amber600 : AppColors.amber400;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTextStyles.bottomNavLabel.copyWith(color: color),
        ),
      ],
    );
  }

  void _showGreetingDialog(Template card) {
    print("Oucch Click me");
    showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                '',
                height: 350 ,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _handleQuickShare(card);
                  },
                  child: const Text('Quick Share'),
                ),
                SizedBox(width: 8,),
                ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _navigateToCustomize(card);
              },
              child: const Text('Customize'),
            ),
              ],
              
            ),
            
          ],
        ),
      ),
    );
  }

  void _handleQuickShare(Template card) {
    // Implement share functionality
  }

  void _navigateToCustomize(Template card) {
    // Navigate to customization screen
  }

}