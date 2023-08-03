import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceModule {
  final SharedPreferences pref;
  static const String _JWT_TOKEN = "JWT_TOKEN";
  static const String _REFRESH_TOKEN = "REFRESH_TOKEN";
  static const String _FCM_TOKEN = "FCM_TOKEN";

  SharedPreferenceModule(this.pref);

  void saveJWTToken(String jwtToken) => pref.setString(_JWT_TOKEN, jwtToken);

  Future<String?> get accessToken async {
    return pref.getString(_JWT_TOKEN);
  }

  void saveRefreshToken(String refreshToken) =>
      pref.setString(_REFRESH_TOKEN, refreshToken);

  Future<String?> get refreshToken async {
    return pref.getString(_REFRESH_TOKEN);
  }

  void saveFcmToken(String fcmToken) => pref.setString(_FCM_TOKEN, fcmToken);

  Future<String?> get fcmToken async {
    return pref.getString(_FCM_TOKEN);
  }

  void clear() => pref.clear();
}