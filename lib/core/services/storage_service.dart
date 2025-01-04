import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import '../config/app_config.dart';

class StorageService extends GetxService {
  late final GetStorage _box;

  @override
  void onInit() async {
    await GetStorage.init();
    _box = GetStorage();
    super.onInit();
  }

  Future<void> write(String key, dynamic value) async {
    await _box.write(key, value);
  }

  Future<T?> read<T>(String key) async {
    return _box.read<T>(key);
  }

  Future<void> remove(String key) async {
    await _box.remove(key);
  }

  Future<void> clearAll() async {
    await _box.erase();
  }

  // Helper methods for common storage operations
  Future<void> saveAuthToken(String token) async {
    await write(AppConfig.authTokenKey, token);
  }

  Future<String?> getAuthToken() async {
    return await read<String>(AppConfig.authTokenKey);
  }

  Future<void> saveUserData(Map<String, dynamic> userData) async {
    await write(AppConfig.userDataKey, userData);
  }

  Future<Map<String, dynamic>?> getUserData() async {
    return await read<Map<String, dynamic>>(AppConfig.userDataKey);
  }

  Future<void> setLanguage(String languageCode) async {
    await write(AppConfig.languageKey, languageCode);
  }

  Future<String> getLanguage() async {
    return await read<String>(AppConfig.languageKey) ?? AppConfig.defaultLanguage;
  }
}