import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:reservation_app/data/datasources/remote/banner/banner_api_service.dart';
import 'package:reservation_app/data/datasources/remote/notice/notice_api_service.dart';
import 'package:reservation_app/data/datasources/remote/reservation/reservation_api_service.dart';
import 'package:reservation_app/data/datasources/remote/sign/sign_api_service.dart';
import 'package:reservation_app/data/repository/banner/banner_repository_impl.dart';
import 'package:reservation_app/data/repository/notice/notice_repository_impl.dart';
import 'package:reservation_app/data/repository/reservation/reservation_repository_impl.dart';
import 'package:reservation_app/data/repository/sign/sign_repository_impl.dart';
import 'package:reservation_app/di/network/network_module.dart';
import 'package:reservation_app/di/prefs/shared_pref_module.dart';
import 'package:reservation_app/domain/repository/banner/banner_repository.dart';
import 'package:reservation_app/domain/repository/notice/notice_repository.dart';
import 'package:reservation_app/domain/repository/reservation/reservation_repository.dart';
import 'package:reservation_app/domain/repository/sign/sign_repository.dart';
import 'package:reservation_app/domain/usecase/banner/get_all_banner_image_use_case.dart';
import 'package:reservation_app/domain/usecase/notice/get_all_notice_list_use_case.dart';
import 'package:reservation_app/domain/usecase/reservation/get_reservation_target_part_time_use_case.dart';
import 'package:reservation_app/domain/usecase/reservation/get_tartget_date_reservation_use_case.dart';
import 'package:reservation_app/domain/usecase/reservation/request_create_reservation_use_case.dart';
import 'package:reservation_app/domain/usecase/sign/get_auth_phone_number_check_use_case.dart';
import 'package:reservation_app/domain/usecase/sign/get_auth_phone_number_use_case.dart';
import 'package:reservation_app/presentation/views/fcm/bloc/fcm_bloc.dart';
// import 'package:reservation_app/presentation/views/fcm/bloc/fcm_bloc.dart';
import 'package:reservation_app/presentation/views/main/block/main_bloc.dart';
import 'package:reservation_app/presentation/views/main/tabs/home/block/home_tab_bloc.dart';
import 'package:reservation_app/presentation/views/main/tabs/home/tabs/home/bloc/content_home_tab_bloc.dart';
import 'package:reservation_app/presentation/views/main/tabs/home/tabs/location/bloc/content_location_tab_bloc.dart';
import 'package:reservation_app/presentation/views/main/tabs/home/tabs/notice/bloc/content_notice_tab_bloc.dart';
import 'package:reservation_app/presentation/views/network/bloc/network_bloc.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/fifth/reservation_fifth_bloc.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/fourth/reservation_fourth_bloc.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/reservation_bloc.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/second/reservation_second_bloc.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/third/reservation_third_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'local/local_module.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  // 📌 SharedPreferences Single Token 등록
  locator.registerSingletonAsync<SharedPreferences>(
    () => LocalModule.provideSharedPreferences(),
  );

  // 📌 SharedPreferenceModule Singleton DI 적용
  locator.registerSingleton<SharedPreferenceModule>(
    SharedPreferenceModule(await locator.getAsync<SharedPreferences>()),
  );

  /**
   * 📌 NetworkModule DI 적용
   * AuthInterceptor 를 Singleton 으로 생성자에 주입받고,
   * Singleton 의 생명주기를 가지지만 인스턴스가 사용되기 전까지는 초기화를 하지 않고 처음으로 사용될 때 인스턴스 초기화 진행
   */
  locator.registerLazySingleton<Dio>(
    () => NetworkModule.provideDio(locator<SharedPreferenceModule>()),
  );

  // 📌 datasource
  locator.registerLazySingleton<BannerApiService>(
    () => BannerApiService(locator<Dio>()),
  );
  locator.registerLazySingleton<ReservationApiService>(
    () => ReservationApiService(locator<Dio>()),
  );
  locator.registerLazySingleton<NoticeApiService>(
    () => NoticeApiService(locator<Dio>()),
  );
  locator.registerLazySingleton<SignApiService>(
    () => SignApiService(locator<Dio>()),
  );

  // 📌 Repository
  locator.registerLazySingleton<BannerRepository>(
    () => BannerRepositoryImpl(locator<BannerApiService>()),
  );
  locator.registerLazySingleton<ReservationRepository>(
    () => ReservationRepositoryImpl(locator<ReservationApiService>()),
  );
  locator.registerLazySingleton<NoticeRepository>(
    () => NoticeRepositoryImpl(locator<NoticeApiService>()),
  );
  locator.registerLazySingleton<SignRepository>(
    () => SignRepositoryImpl(locator<SignApiService>()),
  );

  // 📌 UseCase
  locator.registerLazySingleton<GetAllBannerImageUseCase>(
    () => GetAllBannerImageUseCase(locator<BannerRepository>()),
  );
  locator.registerLazySingleton<GetTargetDateReservationUseCase>(
    () => GetTargetDateReservationUseCase(locator<ReservationRepository>()),
  );
  locator.registerLazySingleton<GetAllNoticeListUseCase>(
    () => GetAllNoticeListUseCase(locator<NoticeRepository>()),
  );
  locator.registerLazySingleton<GetReservationTargetPartTimeUseCase>(
    () => GetReservationTargetPartTimeUseCase(locator<ReservationRepository>()),
  );
  locator.registerLazySingleton<GetAuthPhoneNumberUseCase>(
    () => GetAuthPhoneNumberUseCase(locator<SignRepository>()),
  );
  locator.registerLazySingleton<GetAuthPhoneNumberCheckUseCase>(
    () => GetAuthPhoneNumberCheckUseCase(
      locator<SignRepository>(),
    ),
  );
  locator.registerLazySingleton<RequestCreateReservationUseCase>(
    () => RequestCreateReservationUseCase(
      locator<ReservationRepository>(),
    ),
  );

  // 📌 Block
  locator.registerFactory(() => MainBloc());
  locator.registerFactory(() => FcmBloc());
  locator.registerFactory(() => NetworkBloc());
  locator.registerFactory(
    () => HomeTabBloc(locator<GetAllBannerImageUseCase>()),
  );
  locator.registerFactory(
    () => ContentHomeTabBloc(locator<GetTargetDateReservationUseCase>()),
  );
  locator.registerFactory(
    () => ContentLocationTabBloc(),
  );
  locator.registerFactory(
    () => ReservationBloc(),
  );
  locator.registerFactory(
    () => ReservationSecondBloc(locator<GetReservationTargetPartTimeUseCase>()),
  );
  locator.registerFactory(
    () => ReservationThirdBloc(),
  );
  locator.registerFactory(
    () => ContentNoticeTabBloc(locator<GetAllNoticeListUseCase>()),
  );
  locator.registerFactory(
    () => ReservationFourthBloc(
      locator<GetAuthPhoneNumberUseCase>(),
      locator<GetAuthPhoneNumberCheckUseCase>(),
    ),
  );
  locator.registerFactory(
    () => ReservationFifthBloc(
      locator<RequestCreateReservationUseCase>(),
    ),
  );
}
