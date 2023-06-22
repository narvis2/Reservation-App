import 'package:dio/dio.dart';
import 'package:reservation_app/data/utils/Endpoints.dart';
import 'package:reservation_app/di/prefs/shared_pref_module.dart';

abstract class NetworkModule {
  static Dio provideDio(SharedPreferenceModule pref) {
    final dio = Dio();

    dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout =
          const Duration(milliseconds: Endpoints.connectionTimeout)
      ..options.receiveTimeout =
          const Duration(milliseconds: Endpoints.receiveTimeout)
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
      ..interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ))
      ..interceptors.add(InterceptorsWrapper(onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) async {
        var accessToken = await pref.accessToken;

        if (accessToken != null) {
          options.headers
              .putIfAbsent('Authorization', () => "Bearer $accessToken");
        } else {
          print("🙀 Access Token is Null 🙀");
        }

        return handler.next(options);
      }));

    return dio;
  }
}
