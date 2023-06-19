import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:reservation_app/di/interceptor/auth_interceptor.dart';
import 'package:reservation_app/di/network/network_module.dart';
import 'package:reservation_app/di/prefs/shared_pref_module.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  // 📌 SharedPreferences Single Token 등록
  locator.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());

  /**
   * 📌 SharedPreferenceModule DI 적용
   * SharedPreferences 을 Singleton 으로 생성자에 주입받고,
   * SharedPreferences 의 생명주기에 따라감
   */
  locator.registerSingletonWithDependencies<SharedPreferenceModule>(
      () => SharedPreferenceModule(pref: locator<SharedPreferences>()),
      dependsOn: [SharedPreferences]);

  /**
   * 📌 AuthInterceptor DI 적용
   * SharedPreferenceModule 을 Singleton 으로 생성자에 주입받고,
   * SharedPreferenceModule 의 생명주기에 따라감
   */
  locator.registerSingletonWithDependencies<AuthInterceptor>(
      () => AuthInterceptor(pref: locator<SharedPreferenceModule>()),
      dependsOn: [SharedPreferenceModule]);

  /**
   * 📌 NetworkModule DI 적용
   * AuthInterceptor 를 Singleton 으로 생성자에 주입받고,
   * Singleton 의 생명주기를 가지지만 인스턴스가 사용되기 전까지는 초기화를 하지 않고 처음으로 사용될 때 인스턴스 초기화 진행
   */
  locator.registerLazySingleton<Dio>(() =>
      NetworkModule(authInterceptor: locator<AuthInterceptor>()).provideDio());
}
