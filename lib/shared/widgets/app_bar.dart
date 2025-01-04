import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showNotification;
  final bool showSearch;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onSearchTap;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showNotification = false,
    this.showSearch = false,
    this.onNotificationTap,
    this.onSearchTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      title: Text(
        title,
        style:  AppTextStyles.appTitle,
      ),
      actions: [
        if (showNotification)
          IconButton(
          icon: const Icon(Icons.notifications_none),
          color: AppColors.amber600,
          onPressed: onNotificationTap,
        ),
        if (showSearch)
          IconButton(
          icon: const Icon(Icons.search),
          color: AppColors.amber600,
          onPressed: onSearchTap,
        ),
      ],
    );
  }
}