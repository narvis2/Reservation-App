import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceModule {
  final SharedPreferences pref;
  static const String _JWT_TOKEN = "JWT_TOKEN";
  static const String _REFRESH_TOKEN = "REFRESH_TOKEN";
  static const String _FCM_TOKEN = "FCM_TOKEN";
  static const String _IS_AUTO_LOGIN = "IS_AUTO_LOGIN";
  static const String _IS_SAVED_ID = "IS_SAVED_ID";
  static const String _IS_ENABLE_PUSH = "IS_ENABLE_PUSH";
  static const String _USER_EMAIL = "USER_EMAIL";

  SharedPreferenceModule(this.pref);

  Future<void> saveJWTToken(String jwtToken) =>
      pref.setString(_JWT_TOKEN, jwtToken);

  Future<void> clearJWTToken() =>
      pref.remove(_JWT_TOKEN);

  Future<String?> get accessToken async {
    return pref.getString(_JWT_TOKEN);
  }

  Future<void> saveRefreshToken(String refreshToken) =>
      pref.setString(_REFRESH_TOKEN, refreshToken);

  Future<void> clearRefreshToken() =>
      pref.remove(_REFRESH_TOKEN);

  Future<String?> get refreshToken async {
    return pref.getString(_REFRESH_TOKEN);
  }

  Future<void> saveFcmToken(String fcmToken) =>
      pref.setString(_FCM_TOKEN, fcmToken);

  Future<String?> get fcmToken async {
    return pref.getString(_FCM_TOKEN);
  }

  Future<void> saveIsAutoLogin(bool autoLogin) =>
      pref.setBool(_IS_AUTO_LOGIN, autoLogin);

  Future<void> clearIsAutoLogin() =>
      pref.remove(_IS_AUTO_LOGIN);

  Future<bool> get isAutoLogin async {
    return pref.getBool(_IS_AUTO_LOGIN) ?? false;
  }

  Future<void> saveIsSavedId(bool savedId) =>
      pref.setBool(_IS_SAVED_ID, savedId);

  Future<void> clearIsSavedId() =>
      pref.remove(_IS_SAVED_ID);

  Future<bool> get isSavedId async {
    return pref.getBool(_IS_SAVED_ID) ?? false;
  }

  Future<void> saveIsEnablePush(bool enablePush) =>
      pref.setBool(_IS_ENABLE_PUSH, enablePush);

  Future<void> clearEnablePush() =>
      pref.remove(_IS_ENABLE_PUSH);

  Future<bool> get isEnablePush async {
    return pref.getBool(_IS_ENABLE_PUSH) ?? false;
  }

  Future<void> saveUserEmail(String email) =>
      pref.setString(_USER_EMAIL, email);

  Future<void> clearUserEmail() =>
      pref.remove(_USER_EMAIL);

  Future<String?> get userEmail async {
    return pref.getString(_USER_EMAIL);
  }

  Future<bool> clear() => pref.clear();
}
