import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'core/config/app_config.dart';
import 'core/config/initial_binding.dart';
import 'core/routes/app_pages.dart';
import 'core/routes/app_routes.dart';
import 'core/services/database_service.dart';
import 'shared/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 // await Firebase.initializeApp();
  await GetStorage.init();
 await Get.putAsync(() => DatabaseService().init());
  
  runApp(const BuddhaGreetApp());
}

class BuddhaGreetApp extends StatelessWidget {
  const BuddhaGreetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConfig.appName,
      theme: AppTheme.lightTheme,
      initialBinding: InitialBinding(),
      initialRoute: AppRoutes.home,
      getPages: AppPages.pages,
      defaultTransition: Transition.fade,
      debugShowCheckedModeBanner: false,
    );
  }
}