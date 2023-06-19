
import 'package:dio/dio.dart';
import 'package:reservation_app/di/interceptor/auth_interceptor.dart';

class NetworkModule {
  final Dio _dio = Dio();
  final String _baseUrl = "http://10.0.2.2:8080/api/v1";
  final AuthInterceptor authInterceptor;

  NetworkModule({required this.authInterceptor});

  BaseOptions _dioOptions(){
    BaseOptions opts = BaseOptions();
    opts.baseUrl = _baseUrl;
    opts.contentType = "application/json";
    opts.connectTimeout = const Duration(milliseconds: 60000);
    opts.receiveTimeout = const Duration(milliseconds: 60000);
    opts.sendTimeout = const Duration(milliseconds: 60000);
    return opts;
  }

  Dio provideDio(){
    _dio.options = _dioOptions();
    _dio.interceptors.add(authInterceptor);
    return _dio;
  }
}