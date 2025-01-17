import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      // Bottom Navigation
      'nav.home': 'Home',
      'nav.create': 'Create',
      'nav.library': 'Library',
      'nav.profile': 'Profile',
      
      // Headers
      'header.app_title': 'BuddhaGreet',
      'header.categories': 'Categories',
      'header.see_all': 'See All',
      
      // Categories
      'categories.morning_blessings': 'Morning Blessings',
      'categories.evening_blessings': 'Evening Blessings',
      'categories.meditation': 'Meditation',
      'categories.spiritual': 'Spiritual',
      
      // Actions
      'actions.quick_share': 'Quick Share',
      'actions.customize': 'Customize',
      'actions.search': 'Search',
      
      // Messages
      'messages.language_updated': 'Language updated successfully',
      'messages.language_update_failed': 'Failed to update language'
    },
    'hi': {
      // Bottom Navigation
      'nav.home': 'होम',
      'nav.create': 'बनाएं',
      'nav.library': 'लाइब्रेरी',
      'nav.profile': 'प्रोफाइल',
      
      // Headers
      'header.app_title': 'बुद्धग्रीट',
      'header.categories': 'श्रेणियां',
      'header.see_all': 'सभी देखें',
      
      // Categories
      'categories.morning_blessings': 'प्रभाती आशीर्वाद',
      'categories.evening_blessings': 'सायं आशीर्वाद',
      'categories.meditation': 'ध्यान',
      'categories.spiritual': 'आध्यात्मिक',
      
      // Actions
      'actions.quick_share': 'शेयर करें',
      'actions.customize': 'कस्टमाइज़',
      'actions.search': 'खोजें',
      
      // Messages
      'messages.language_updated': 'भाषा सफलतापूर्वक अपडेट की गई',
      'messages.language_update_failed': 'भाषा अपडेट करने में विफल'
    }
  };
}