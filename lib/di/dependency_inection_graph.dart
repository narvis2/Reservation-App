import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:reservation_app/di/interceptor/auth_interceptor.dart';
import 'package:reservation_app/di/network/network_module.dart';
import 'package:reservation_app/di/prefs/shared_pref_module.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'local/local_module.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  // 📌 SharedPreferences Single Token 등록
  locator.registerSingletonAsync<SharedPreferences>(
      () => LocalModule.provideSharedPreferences());

  // 📌 SharedPreferenceModule Singleton DI 적용
  locator.registerSingleton<SharedPreferenceModule>(
      SharedPreferenceModule(await locator.getAsync<SharedPreferences>())
  );

  // 📌 AuthInterceptor DI Singleton 적용
  locator.registerSingleton<AuthInterceptor>(
      AuthInterceptor(locator<SharedPreferenceModule>())
  );

  /**
   * 📌 NetworkModule DI 적용
   * AuthInterceptor 를 Singleton 으로 생성자에 주입받고,
   * Singleton 의 생명주기를 가지지만 인스턴스가 사용되기 전까지는 초기화를 하지 않고 처음으로 사용될 때 인스턴스 초기화 진행
   */
  locator.registerLazySingleton<Dio>(() =>
      NetworkModule(authInterceptor: locator<AuthInterceptor>()).provideDio());
}
