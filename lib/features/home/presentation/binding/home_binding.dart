import 'package:get/get.dart';
import '../controllers/home_controller.dart';
class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // Core Controllers
    Get.lazyPut<HomeController>(() => HomeController());
    //Get.lazyPut<CreatorController>(() => CreatorController());
  }
}