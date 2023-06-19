import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceModule {
  final SharedPreferences pref;
  static const String _JWT_TOKEN = "JWT_TOKEN";
  static const String _REFRESH_TOKEN = "REFRESH_TOKEN";

  SharedPreferenceModule(this.pref);

  void saveJWTToken(String jwtToken) => pref.setString(_JWT_TOKEN, jwtToken);

  String getJWTToken() {
    String token = pref.getString(_JWT_TOKEN) ?? "";
    return token;
  }

  void saveRefreshToken(String refreshToken) =>
      pref.setString(_REFRESH_TOKEN, refreshToken);

  String getRefreshToken() {
    String refreshToken = pref.getString(_REFRESH_TOKEN) ?? "";
    return refreshToken;
  }

  void clear() => pref.clear();
}