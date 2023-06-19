import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:reservation_app/di/prefs/shared_pref_module.dart';

class AuthInterceptor extends Interceptor {
  final SharedPreferenceModule pref;

  AuthInterceptor({required this.pref});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String JwtToken = pref.getJWTToken();

    if (JwtToken.isNotEmpty) {
      String token = jsonDecode(JwtToken)['token'];
      options.headers["Authorization"] = "Bearer $token";
    }

    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print("❗️ === Dio Error === ❗️");
    print(err.message);
    // consider to remap this error to generic error.
    return super.onError(err, handler);

  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return super.onResponse(response, handler);
  }
}