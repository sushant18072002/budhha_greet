import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../../core/services/database_service.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // Core Controllers
   
    Get.lazyPut<HomeController>(() => HomeController(dbService: Get.find<DatabaseService>()));
    //Get.lazyPut<CreatorController>(() => CreatorController());
  }
}