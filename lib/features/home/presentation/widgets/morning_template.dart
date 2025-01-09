// import 'package:buddha_greet/features/image_detail/data/models/background_model.dart';
// import 'package:buddha_greet/shared/models/background_text_area/background_text_area.dart';
// import 'package:buddha_greet/shared/models/background_text_position/background_text_position.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../shared/theme/app_colors.dart';
// import '../../../../shared/theme/app_text_styles.dart';
// import '../controllers/home_controller.dart';
// import '../../data/models/template/template.dart';

// class MorningTemplatesWidget extends GetView<HomeController> {
//   const MorningTemplatesWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildHeader(),
//         _buildTemplatesList(),
//       ],
//     );
//   }

//   Widget _buildHeader() {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             'Good Morning Images',
//             style: AppTextStyles.headlineMedium,
//           ),
//           Obx(() => IconButton(
//                 icon: Icon(
//                   controller.isGridView.value
//                       ? Icons.grid_view
//                       : Icons.view_list,
//                   color: AppColors.amber600,
//                 ),
//                 onPressed: controller.toggleViewMode,
//               )),
//         ],
//       ),
//     );
//   }

//   Widget _buildTemplatesList() {
//     return Obx(() {
//       if (controller.isMorningTemplatesLoading.value) {
//         return const Center(child: CircularProgressIndicator());
//       }

//       return AnimatedSwitcher(
//         duration: const Duration(milliseconds: 300),
//         child:
//             controller.isGridView.value ? _buildGridView() : _buildListView(),
//       );
//     });
//   }

//   Widget _buildGridView() {
//     return GridView.builder(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 16,
//         mainAxisSpacing: 16,
//         childAspectRatio: 9 / 16, // Portrait aspect ratio
//       ),
//       itemCount: controller.morningTemplates.length,
//       itemBuilder: (context, index) => _buildTemplateCard(
//         controller.morningTemplates[index],
//         isGridView: true,
//       ),
//     );
//   }

//   Widget _buildListView() {
//     return ListView.builder(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: controller.morningTemplates.length,
//       itemBuilder: (context, index) => Padding(
//         padding: const EdgeInsets.only(bottom: 16),
//         child: _buildTemplateCard(
//           controller.morningTemplates[index],
//           isGridView: false,
//         ),
//       ),
//     );
//   }

//   Widget _buildTemplateCard(Template template, {required bool isGridView}) {
//     return Hero(
//       tag: 'template-${template.id}',
//       child: GestureDetector(
//         onTap: () => _navigateToDetail(template),
//         child: LayoutBuilder(
//           builder: (context, constraints) {
//             final isPortrait = constraints.maxWidth < constraints.maxHeight;
//             return Container(
//                 height: isGridView ? null : 200,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(16),
//                   boxShadow: [
//                     BoxShadow(
//                       color: AppColors.harmonyPurple.withOpacity(0.2),
//                       blurRadius: 8,
//                       offset: const Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 child: _buildBackground(template, isPortrait));
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildBackground(Template template, bool isPortrait) {
//     return FutureBuilder(
//       future: controller.getBackgroundById(template.backgroundId),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return Container(color: Colors.grey[300]);
//         }
//         final background = snapshot.data!;
//         return _cardTemplate(template, background, isPortrait);
//       },
//     );
//   }

//   Widget _backgroundCard(Background background) {
//     if (background.type == 'image' && background.imageUrl != null) {
//       return Image.asset(
//         background.imageUrl!,
//         fit: BoxFit.cover,
//       );
//     } else if (background.type == 'gradient' && background.gradient != null) {
//       return Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: (background.gradient!['colors'] as List)
//                 .map((c) => Color(int.parse(c.replaceAll('#', '0xFF'))))
//                 .toList(),
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             transform: GradientRotation(
//                 (background.gradient!['angle'] as num).toDouble() * 3.14 / 180),
//           ),
//         ),
//       );
//     }
//     return Container(color: Colors.grey[300]);
//   }

//   Widget _cardTemplate(
//       Template template, Background background, bool isPortrait) {
//     return ClipRRect(
//         borderRadius: BorderRadius.circular(16),
//         child: Stack(
//           fit: StackFit.expand,
//           children: [
//             _backgroundCard(background),
//             _buildGradientOverlay(),
//             _buildGreetingText(template, background, isPortrait),
//             if (template.quoteId != null) _buildQuoteText(template,background, isPortrait),
//             _buildShareButton(template),
//           ],
//         ));
//   }

//   Widget _buildGradientOverlay() {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             Colors.transparent,
//             Colors.black.withOpacity(0.7),
//           ],
//           stops: const [0.4, 1.0],
//         ),
//       ),
//     );
//   }

//   Widget _buildGreetingText(
//       Template template, Background background, bool isPortrait) {
//     final greeting = template.greeting[controller.currentLanguage.value] ?? '';
//     final textStyle = template.style.greeting;
//     final textArea = background.textAreas.firstWhere(
//         (area) => area.id == 'greeting',
//         orElse: () => BackgroundTextArea(
//             id: 'greeting',
//             portrait:
//                 BackgroundTextPosition(x: 0.5, y: 0.3, width: 0.8, height: 0.2),
//             landscape: BackgroundTextPosition(
//                 x: 0.5, y: 0.25, width: 0.7, height: 0.15)));
//     final position = isPortrait ? textArea.portrait : textArea.landscape;

//     return Positioned(
//       left: position.x * 100,
//       top: position.y * 100,
//       width: position.width * 100,
//       height: position.height * 100,
//       child: Transform.rotate(
//         angle: position.rotation * 3.14 / 180,
//         child: Text(
//           greeting,
//           style: TextStyle(
//             fontSize: textStyle.fontSize,
//             fontFamily: textStyle.fontFamily,
//             color: Color(
//               int.parse(textStyle.colorHex.replaceAll('#', '0xFF')),
//             ),
//             shadows: textStyle.effects.contains('shadow')
//                 ? [
//                     const Shadow(
//                       offset: Offset(0, 2),
//                       blurRadius: 4,
//                       color: Colors.black45,
//                     )
//                   ]
//                 : null,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }

//   Widget _buildQuoteText(Template template,Background background, bool isPortrait) {
//     return FutureBuilder(
//       future: controller.getQuoteById(template.quoteId!),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) return const SizedBox();

//         final quote = snapshot.data!;
//         final text = quote.text[controller.currentLanguage.value] ?? '';
//         final author = quote.author[controller.currentLanguage.value] ?? '';
//         final textStyle = template.style.quote;
//         final textArea= background.textAreas
//               .firstWhere((area) => area.id == 'quote', 
//                   orElse: () => BackgroundTextArea(
//                     id: 'quote',
//                     portrait:  BackgroundTextPosition(x: 0.5, y: 0.3, width: 0.8, height: 0.2),
//                     landscape: BackgroundTextPosition(x: 0.5, y: 0.25, width: 0.7, height: 0.15)
//                   ));
//      final position = isPortrait 
//               ? textArea.portrait
//               : textArea.landscape;

//         return Positioned(
//           left: position.x * 100,
//           top: position.y * 100,
//           width: position.width * 100,
//           height: position.height * 100,
//           child: Transform.rotate(
//             angle: position.rotation * 3.14 / 180,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   text,
//                   style: TextStyle(
//                     fontSize: textStyle.fontSize,
//                     fontFamily: textStyle.fontFamily,
//                     color: Color(
//                       int.parse(textStyle.colorHex.replaceAll('#', '0xFF')),
//                     ),
//                     shadows: textStyle.effects.contains('shadow')
//                         ? [
//                             const Shadow(
//                               offset: Offset(0, 2),
//                               blurRadius: 4,
//                               color: Colors.black45,
//                             )
//                           ]
//                         : null,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 if (author.isNotEmpty) ...[
//                   const SizedBox(height: 8),
//                   Text(
//                     '- $author',
//                     style: TextStyle(
//                       fontSize: textStyle.fontSize * 0.8,
//                       fontFamily: textStyle.fontFamily,
//                       color: Color(
//                         int.parse(textStyle.colorHex.replaceAll('#', '0xFF')),
//                       ),
//                       shadows: textStyle.effects.contains('shadow')
//                           ? [
//                               const Shadow(
//                                 offset: Offset(0, 2),
//                                 blurRadius: 4,
//                                 color: Colors.black45,
//                               )
//                             ]
//                           : null,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildShareButton(Template template) {
//     return Positioned(
//       top: 8,
//       right: 8,
//       child: IconButton(
//         icon: const Icon(
//           Icons.share_rounded,
//           color: Colors.white,
//           size: 24,
//         ),
//         onPressed: () => _handleShare(template),
//       ),
//     );
//   }

//   void _navigateToDetail(Template template) {
//     Get.toNamed('/template-detail', arguments: template);
//   }

//   void _handleShare(Template template) {
//     // Implement share functionality
//   }
// }
