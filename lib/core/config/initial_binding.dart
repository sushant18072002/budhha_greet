import 'package:get/get.dart';
import '../services/auth_service.dart';
import '../services/storage_service.dart';
import '../services/api_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // Core Services
    Get.put(StorageService(), permanent: true);
    Get.put(ApiService(), permanent: true);
   // Get.put(AuthService(), permanent: true);
   // Get.put(NotificationService(), permanent: true);
  }
}