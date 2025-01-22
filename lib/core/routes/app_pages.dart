// lib/routes/app_routes.dart
import 'package:buddha_greet/features/template_detail/binding/image_detail_binding.dart';
import 'package:get/get.dart';

import '../../features/greeting_creator/presentation/screens/creator_screen.dart';
import '../../features/home/presentation/binding/home_binding.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/template_detail/screens/template_detail.dart';
import '../../shared/models/entities/template_collection/template_collection.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    // GetPage(
    //   name: AppRoutes.splash,
    //   page: () => const SplashScreen(),
    //   binding: SplashBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.login,
    //   page: () => const LoginScreen(),
    //   binding: AuthBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.register,
    //   page: () => const RegisterScreen(),
    //   binding: AuthBinding(),
    // ),
    // GetPage(
    //   name:AppRoutes.template,
    //   page: () => const TemplateDetailScreen(),
    // ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    // GetPage(
    //   name: '/template-detail',
    //   page: () => const TemplateDetailScreen(),
    //   binding: ImageDetailBinding(),
    //   transition: Transition.fadeIn,
    // ),
    // GetPage(
    //   name:AppRoutes.library ,
    //   page: () => const QuoteLibraryScreen(),
    //   binding: BindingsBuilder(() {
    //     Get.lazyPut(() => QuoteLibraryController());
    //   }),
    // ),
    GetPage(
      name: AppRoutes.creator,
      page: () => GreetingScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => GreetingController());
      }),
    ),
    // GetPage(
    //   name: AppRoutes.library,
    //   page: () => const LibraryScreen(),
    //   binding: LibraryBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.profile,
    //   page: () => const ProfileScreen(),
    //   binding: ProfileBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.preview,
    //   page: () => const PreviewScreen(),
    //   binding: PreviewBinding(),
    // ),

    GetPage(
      name: AppRoutes.template,
      page: () => TemplateDetailsScreen(
        template: Get.arguments as Template,
      ),
      binding: TemplateBinding(),
    ),
  ];
}
