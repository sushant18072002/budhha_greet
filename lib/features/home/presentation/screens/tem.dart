// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import '../../data/models/greeting_template_model.dart';
// import '../../../../shared/theme/app_colors.dart';
// import '../../../../shared/theme/app_text_styles.dart';

// class TemplateDetailController extends GetxController {
//   final template = Rx<FeaturedContentModel?>(null);
//   final isEditing = false.obs;
//   final TextEditingController greetingController = TextEditingController();
//   final TextEditingController quoteController = TextEditingController();

//   @override
//   void onInit() {
//     super.onInit();
//     template.value = Get.arguments as FeaturedContentModel;
//     _initializeControllers();
//   }

//   void _initializeControllers() {
//     greetingController.text = "Good Morning";
//     quoteController.text = "Start each day with a grateful heart";
//   }

//   void toggleEditMode() {
//     isEditing.toggle();
//   }

//   void handleQuickShare() {
//     // Implement share functionality
//     Get.snackbar(
//       'Sharing',
//       'Sharing template...',
//       snackPosition: SnackPosition.BOTTOM,
//     );
//   }

//   void saveCustomizations() {
//     // Save customizations logic here
//     isEditing.value = false;
//     Get.snackbar(
//       'Success',
//       'Changes saved successfully',
//       snackPosition: SnackPosition.BOTTOM,
//     );
//   }

//   @override
//   void onClose() {
//     greetingController.dispose();
//     quoteController.dispose();
//     super.onClose();
//   }
// }

// class TemplateDetailScreen extends GetView<TemplateDetailController> {
//   const TemplateDetailScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.gray50,
//       appBar: _buildAppBar(),
//       body: _buildBody(),
//       bottomNavigationBar: _buildBottomBar(),
//     );
//   }

//   PreferredSizeWidget _buildAppBar() {
//     return AppBar(
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       leading: IconButton(
//         icon: Icon(Icons.arrow_back, color: AppColors.amber600),
//         onPressed: () => Get.back(),
//       ),
//       actions: [
//         Obx(() => IconButton(
//           icon: Icon(
//             controller.isEditing.value ? Icons.check : Icons.edit,
//             color: AppColors.amber600,
//           ),
//           onPressed: () => controller.isEditing.value
//               ? controller.saveCustomizations()
//               : controller.toggleEditMode(),
//         )),
//         IconButton(
//           icon: Icon(Icons.share_rounded, color: AppColors.amber600),
//           onPressed: controller.handleQuickShare,
//         ),
//       ],
//     );
//   }

//   Widget _buildBody() {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           _buildImageSection(),
//           _buildContentSection(),
//         ],
//       ),
//     );
//   }

//   Widget _buildImageSection() {
//     return Obx(() {
//       final templateData = controller.template.value;
//       if (templateData == null) return const SizedBox.shrink();

//       return Hero(
//         tag: 'template-${templateData.id}',
//         child: Container(
//           height: Get.height * 0.5,
//           margin: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(16),
//             boxShadow: [
//               BoxShadow(
//                 color: AppColors.harmonyPurple.withOpacity(0.2),
//                 blurRadius: 8,
//                 offset: const Offset(0, 4),
//               ),
//             ],
//           ),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(16),
//             child: Stack(
//               fit: StackFit.expand,
//               children: [
//                 CachedNetworkImage(
//                   imageUrl: templateData.imageUrl,
//                   fit: BoxFit.cover,
//                   placeholder: (context, url) => Container(
//                     color: AppColors.surface,
//                     child: const Center(child: CircularProgressIndicator()),
//                   ),
//                   errorWidget: (context, url, error) => Container(
//                     color: AppColors.surface,
//                     child: const Icon(Icons.error),
//                   ),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: [
//                         Colors.black.withOpacity(0.2),
//                         Colors.black.withOpacity(0.5),
//                       ],
//                     ),
//                   ),
//                 ),
//                 _buildOverlayText(),
//               ],
//             ),
//           ),
//         ),
//       );
//     });
//   }

//   Widget _buildOverlayText() {
//     return Obx(() {
//       if (!controller.isEditing.value) {
//         return Padding(
//           padding: const EdgeInsets.all(24),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 controller.greetingController.text,
//                 style: AppTextStyles.headlineLarge.copyWith(
//                   color: AppColors.white,
//                   shadows: [
//                     Shadow(
//                       offset: const Offset(0, 2),
//                       blurRadius: 4,
//                       color: Colors.black.withOpacity(0.5),
//                     ),
//                   ],
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 16),
//               Text(
//                 controller.quoteController.text,
//                 style: AppTextStyles.bodyLarge.copyWith(
//                   color: AppColors.white,
//                   shadows: [
//                     Shadow(
//                       offset: const Offset(0, 2),
//                       blurRadius: 4,
//                       color: Colors.black.withOpacity(0.5),
//                     ),
//                   ],
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         );
//       }

//       return Container(
//         padding: const EdgeInsets.all(24),
//         color: Colors.black.withOpacity(0.5),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: controller.greetingController,
//               style: AppTextStyles.headlineLarge.copyWith(color: AppColors.white),
//               textAlign: TextAlign.center,
//               decoration: InputDecoration(
//                 hintText: 'Enter greeting',
//                 hintStyle: AppTextStyles.headlineLarge.copyWith(
//                   color: AppColors.white.withOpacity(0.7),
//                 ),
//                 border: InputBorder.none,
//               ),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: controller.quoteController,
//               style: AppTextStyles.bodyLarge.copyWith(color: AppColors.white),
//               textAlign: TextAlign.center,
//               decoration: InputDecoration(
//                 hintText: 'Enter quote',
//                 hintStyle: AppTextStyles.bodyLarge.copyWith(
//                   color: AppColors.white.withOpacity(0.7),
//                 ),
//                 border: InputBorder.none,
//               ),
//             ),
//           ],
//         ),
//       );
//     });
//   }

//   Widget _buildContentSection() {
//     return Obx(() {
//       final templateData = controller.template.value;
//       if (templateData == null) return const SizedBox.shrink();

//       return Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               templateData.title,
//               style: AppTextStyles.headlineSmall,
//             ),
//             const SizedBox(height: 8),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//               decoration: BoxDecoration(
//                 color: AppColors.amber100,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Text(
//                 templateData.category,
//                 style: AppTextStyles.bodyMedium.copyWith(
//                   color: AppColors.amber800,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             _buildOptionsSection(),
//           ],
//         ),
//       );
//     });
//   }

//   Widget _buildOptionsSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Options',
//           style: AppTextStyles.sectionTitle,
//         ),
//         const SizedBox(height: 12),
//         _buildOptionTile(
//           icon: Icons.color_lens,
//           title: 'Change Color Theme',
//           onTap: () {
//             // Implement color theme change
//           },
//         ),
//         _buildOptionTile(
//           icon: Icons.font_download,
//           title: 'Change Font Style',
//           onTap: () {
//             // Implement font style change
//           },
//         ),
//         _buildOptionTile(
//           icon: Icons.format_size,
//           title: 'Adjust Text Size',
//           onTap: () {
//             // Implement text size adjustment
//           },
//         ),
//       ],
//     );
//   }

//   Widget _buildOptionTile({
//     required IconData icon,
//     required String title,
//     required VoidCallback onTap,
//   }) {
//     return ListTile(
//       leading: Icon(icon, color: AppColors.amber600),
//       title: Text(title, style: AppTextStyles.bodyMedium),
//       trailing: Icon(Icons.chevron_right, color: AppColors.amber600),
//       onTap: onTap,
//     );
//   }

//   Widget _buildBottomBar() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: AppColors.white,
//         borderRadius: const BorderRadius.vertical(
//           top: Radius.circular(20),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 8,
//             offset: const Offset(0, -4),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: ElevatedButton(
//               onPressed: controller.handleQuickShare,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: AppColors.amber600,
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               child: Text(
//                 'Quick Share',
//                 style: AppTextStyles.buttonText.copyWith(
//                   color: AppColors.white,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: OutlinedButton(
//               onPressed: controller.toggleEditMode,
//               style: OutlinedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//                 side: BorderSide(color: AppColors.amber600),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               child: Text(
//                 'Customize',
//                 style: AppTextStyles.buttonText.copyWith(
//                   color: AppColors.amber600,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
