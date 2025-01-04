import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../config/api_config.dart';
import './api_service.dart';
import './storage_service.dart';
import '../../features/auth/data/models/user_model.dart';

class AuthService extends GetxService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ApiService _apiService = Get.find();
  final StorageService _storageService = Get.find();

  final Rx<UserModel?> currentUser = Rx<UserModel?>(null);
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    _initializeAuthStateListener();
    super.onInit();
  }

  void _initializeAuthStateListener() {
    _auth.authStateChanges().listen((User? firebaseUser) async {
      if (firebaseUser == null) {
        currentUser.value = null;
        await _storageService.clearAll();
      } else {
        // Fetch user data from backend
        await _fetchUserData(firebaseUser.uid);
      }
    });
  }

  Future<void> _fetchUserData(String userId) async {
    try {
      final response = await _apiService.get('/users/$userId');
      final userData = UserModel.fromJson(response.data);
      currentUser.value = userData;
      await _storageService.saveUserData(userData.toJson());
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      isLoading.value = true;
      // Firebase authentication
      final UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Backend authentication
      final response = await _apiService.post(
        ApiEndpoints.login,
        data: {
          'firebase_uid': credential.user!.uid,
          'email': email,
        },
      );

      // Save auth token
      final token = response.data['token'];
      await _storageService.saveAuthToken(token);

      // Fetch user data
      await _fetchUserData(credential.user!.uid);
    } catch (e) {
      throw _handleAuthError(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> registerWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      isLoading.value = true;
      // Firebase registration
      final UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Backend registration
      final response = await _apiService.post(
        ApiEndpoints.register,
        data: {
          'firebase_uid': credential.user!.uid,
          'email': email,
          'name': name,
        },
      );

      // Save auth token
      final token = response.data['token'];
      await _storageService.saveAuthToken(token);

      // Fetch user data
      await _fetchUserData(credential.user!.uid);
    } catch (e) {
      throw _handleAuthError(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _storageService.clearAll();
      currentUser.value = null;
      Get.offAllNamed('/login');
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw _handleAuthError(e);
    }
  }

  Future<void> updateProfile({
    String? name,
    String? photoUrl,
    String? language,
  }) async {
    try {
      isLoading.value = true;
      final userId = currentUser.value?.id;
      if (userId == null) throw Exception('User not authenticated');

      final response = await _apiService.put(
        '/users/$userId',
        data: {
          if (name != null) 'name': name,
          if (photoUrl != null) 'photo_url': photoUrl,
          if (language != null) 'language': language,
        },
      );

      final updatedUser = UserModel.fromJson(response.data);
      currentUser.value = updatedUser;
      await _storageService.saveUserData(updatedUser.toJson());
    } catch (e) {
      throw _handleAuthError(e);
    } finally {
      isLoading.value = false;
    }
  }

  Exception _handleAuthError(dynamic error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'user-not-found':
          return AuthException('No user found with this email');
        case 'wrong-password':
          return AuthException('Invalid password');
        case 'email-already-in-use':
          return AuthException('Email is already registered');
        default:
          return AuthException(error.message ?? 'Authentication failed');
      }
    }
    return AuthException('An unexpected error occurred');
  }
}

class AuthException implements Exception {
  final String message;
  AuthException(this.message);
}