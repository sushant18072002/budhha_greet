// greeting_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as ui;

import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_text_styles.dart';

class GreetingController extends GetxController {
  final selectedQuote = "".obs;
  final selectedFont = "Playfair Display".obs;
  final fontSize = 20.0.obs;
  final textColor = Colors.white.obs;
  final textPosition = Offset(0, 0).obs;
  final textRotation = 0.0.obs;
  final personalMessage = "".obs;
  final backgroundType = "color".obs; // color, gradient, image
  final backgroundColor = AppColors.amber100.obs;
  final backgroundImage = Rxn<String>();
  final backgroundOpacity = 1.0.obs;
  final effects = <String>[].obs;
  
  // Track editing state
  final isEditing = false.obs;
  final editingHistory = <Map<String, dynamic>>[].obs;
  final historyIndex = 0.obs;

  void updateQuote(String quote) {
    selectedQuote.value = quote;
    addToHistory();
  }

  void updateFont(String font) {
    selectedFont.value = font;
    addToHistory();
  }

  void updateFontSize(double size) {
    fontSize.value = size;
    addToHistory();
  }

  void updateTextPosition(Offset position) {
    textPosition.value = position;
    addToHistory();
  }

  void updateBackground(String type, {Color? color, String? imagePath}) {
    backgroundType.value = type;
    if (color != null) backgroundColor.value = color;
    if (imagePath != null) backgroundImage.value = imagePath;
    addToHistory();
  }

  void addEffect(String effect) {
    if (!effects.contains(effect)) {
      effects.add(effect);
      addToHistory();
    }
  }

  void removeEffect(String effect) {
    effects.remove(effect);
    addToHistory();
  }

  void addToHistory() {
    // Add current state to history
    final currentState = {
      'quote': selectedQuote.value,
      'font': selectedFont.value,
      'fontSize': fontSize.value,
      'position': textPosition.value,
      'background': backgroundType.value,
      'effects': List.from(effects),
    };
    
    editingHistory.add(currentState);
    historyIndex.value = editingHistory.length - 1;
  }

  void undo() {
    if (historyIndex.value > 0) {
      historyIndex.value--;
      _restoreState(editingHistory[historyIndex.value]);
    }
  }

  void redo() {
    if (historyIndex.value < editingHistory.length - 1) {
      historyIndex.value++;
      _restoreState(editingHistory[historyIndex.value]);
    }
  }

  void _restoreState(Map<String, dynamic> state) {
    selectedQuote.value = state['quote'];
    selectedFont.value = state['font'];
    fontSize.value = state['fontSize'];
    textPosition.value = state['position'];
    backgroundType.value = state['background'];
    effects.value = List.from(state['effects']);
  }
}

class GreetingScreen extends GetView<GreetingController> {
  GreetingScreen({Key? key}) : super(key: key);
  final controller = Get.put(GreetingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Greeting', style: AppTextStyles.appTitle),
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: AppColors.amber600),
            onPressed: () => _handleShare(),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildPreviewArea(),
          _buildEditingTools(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildPreviewArea() {
    return Obx(() => Container(
      height: Get.height * 0.4,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: controller.backgroundColor.value,
        borderRadius: BorderRadius.circular(16),
        image: controller.backgroundImage.value != null
            ? DecorationImage(
                image: NetworkImage(controller.backgroundImage.value!),
                fit: BoxFit.cover,
                opacity: controller.backgroundOpacity.value,
              )
            : null,
      ),
      child: Stack(
        children: [
          Positioned(
            left: controller.textPosition.value.dx,
            top: controller.textPosition.value.dy,
            child: GestureDetector(
              onPanUpdate: (details) {
                controller.updateTextPosition(
                  Offset(
                    controller.textPosition.value.dx + details.delta.dx,
                    controller.textPosition.value.dy + details.delta.dy,
                  ),
                );
              },
              child: Transform.rotate(
                angle: controller.textRotation.value,
                child: Text(
                  controller.selectedQuote.value,
                  style: GoogleFonts.getFont(
                    controller.selectedFont.value,
                    fontSize: controller.fontSize.value,
                    color: controller.textColor.value,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget _buildEditingTools() {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: 'Background'),
              Tab(text: 'Quote'),
              Tab(text: 'Font'),
              Tab(text: 'Effects'),
            ],
            labelColor: AppColors.amber600,
            unselectedLabelColor: AppColors.amber400,
          ),
          SizedBox(
            height: Get.height * 0.3,
            child: TabBarView(
              children: [
                _BackgroundTab(controller),
                _QuoteTab(controller),
                _FontTab(controller),
                _EffectsTab(controller),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(color: AppColors.amber100),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBottomNavItem(Icons.undo, 'Undo', controller.undo),
          _buildBottomNavItem(Icons.redo, 'Redo', controller.redo),
          _buildBottomNavItem(Icons.save, 'Save', _handleSave),
          _buildBottomNavItem(Icons.share, 'Share', _handleShare),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.amber600),
          Text(label, style: AppTextStyles.bottomNavLabel),
        ],
      ),
    );
  }

  void _handleSave() {
    // Implement save functionality
  }

  void _handleShare() {
    // Implement share functionality
  }
}

class _BackgroundTab extends StatelessWidget {
  final GreetingController controller;

  const _BackgroundTab(this.controller);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Background Type', style: AppTextStyles.sectionTitle),
          const SizedBox(height: 8),
          _buildBackgroundTypeSelector(),
          const SizedBox(height: 16),
          _buildBackgroundOptions(),
        ],
      ),
    );
  }

  Widget _buildBackgroundTypeSelector() {
    return Obx(() => Row(
      children: [
        _buildTypeOption('Color', 'color'),
        const SizedBox(width: 8),
        _buildTypeOption('Gradient', 'gradient'),
        const SizedBox(width: 8),
        _buildTypeOption('Image', 'image'),
      ],
    ));
  }

  Widget _buildTypeOption(String label, String type) {
    return ChoiceChip(
      label: Text(label),
      selected: controller.backgroundType.value == type,
      onSelected: (selected) {
        if (selected) controller.backgroundType.value = type;
      },
    );
  }

  Widget _buildBackgroundOptions() {
    return Obx(() {
      switch (controller.backgroundType.value) {
        case 'color':
          return _buildColorPicker();
        case 'gradient':
          return _buildGradientPicker();
        case 'image':
          return _buildImagePicker();
        default:
          return const SizedBox();
      }
    });
  }

  Widget _buildColorPicker() {
    // Implement color picker widget
    return Container();
  }

  Widget _buildGradientPicker() {
    // Implement gradient picker widget
    return Container();
  }

  Widget _buildImagePicker() {
    // Implement image picker widget
    return Container();
  }
}

class _QuoteTab extends StatelessWidget {
  final GreetingController controller;

  const _QuoteTab(this.controller);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Select Quote', style: AppTextStyles.sectionTitle),
          const SizedBox(height: 16),
          _buildQuoteList(),
          const SizedBox(height: 16),
          Text('Personal Message', style: AppTextStyles.sectionTitle),
          const SizedBox(height: 8),
          _buildPersonalMessageInput(),
        ],
      ),
    );
  }

  Widget _buildQuoteList() {
    // Implement quote list widget
    return Container();
  }

  Widget _buildPersonalMessageInput() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Add your personal message...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onChanged: (value) => controller.personalMessage.value = value,
    );
  }
}

class _FontTab extends StatelessWidget {
  final GreetingController controller;

  const _FontTab(this.controller);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Font Style', style: AppTextStyles.sectionTitle),
          const SizedBox(height: 16),
          _buildFontPicker(),
          const SizedBox(height: 16),
          Text('Font Size', style: AppTextStyles.sectionTitle),
          const SizedBox(height: 8),
          _buildFontSizeSlider(),
          const SizedBox(height: 16),
          Text('Font Color', style: AppTextStyles.sectionTitle),
          const SizedBox(height: 8),
          _buildColorPicker(),
        ],
      ),
    );
  }

  Widget _buildFontPicker() {
    // Implement font picker widget
    return Container();
  }

  Widget _buildFontSizeSlider() {
    return Obx(() => Slider(
      value: controller.fontSize.value,
      min: 12,
      max: 48,
      divisions: 36,
      label: controller.fontSize.value.round().toString(),
      onChanged: (value) => controller.updateFontSize(value),
    ));
  }

  Widget _buildColorPicker() {
    // Implement color picker widget
    return Container();
  }
}

class _EffectsTab extends StatelessWidget {
  final GreetingController controller;

  const _EffectsTab(this.controller);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Text Effects', style: AppTextStyles.sectionTitle),
          const SizedBox(height: 16),
          _buildEffectsList(),
          const SizedBox(height: 16),
          Text('Background Effects', style: AppTextStyles.sectionTitle),
          const SizedBox(height: 8),
          _buildBackgroundEffects(),
        ],
      ),
    );
  }

  Widget _buildEffectsList() {
    // Implement effects list widget
    return Container();
  }

  Widget _buildBackgroundEffects() {
    // Implement background effects widget
    return Container();
  }
}