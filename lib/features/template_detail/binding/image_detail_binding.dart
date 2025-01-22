import 'package:get/get.dart';

import '../controller/template_details_controller.dart';

class TemplateBinding implements Bindings {
  @override
  void dependencies() {
    // Core Controllers
    Get.lazyPut<TemplateDetailsController>(() => TemplateDetailsController());
    //Get.lazyPut<CreatorController>(() => CreatorController());
  }
}