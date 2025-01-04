class AppConfig {
  static const String appName = 'BuddhaGreet';
  static const String appVersion = '1.0.0';
  
  // API Configuration
  static const String baseUrl = 'https://api.buddhagreet.com/v1';
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;
  
  // Storage Keys
  static const String authTokenKey = 'auth_token';
  static const String userDataKey = 'user_data';
  static const String languageKey = 'language';
  
  // Default Settings
  static const String defaultLanguage = 'en';
  static const int maxScheduledGreetings = 10;
  
  // Firebase Configuration
  static const String firebaseStorageBucket = 'gs://buddha-greet.appspot.com';
  static const String firebaseCollection = 'greetings';
}
