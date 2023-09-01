import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:reservation_app/data/api/banner/banner_api_service.dart';
import 'package:reservation_app/data/api/member/member_api_service.dart';
import 'package:reservation_app/data/api/notice/notice_api_service.dart';
import 'package:reservation_app/data/api/reservation/reservation_api_service.dart';
import 'package:reservation_app/data/api/sign/sign_api_service.dart';
import 'package:reservation_app/data/datasource/impl/remote_data_source_impl.dart';
import 'package:reservation_app/data/datasource/remote_data_source.dart';
import 'package:reservation_app/data/repository/banner/banner_repository_impl.dart';
import 'package:reservation_app/data/repository/fcm/fcm_repository.dart';
import 'package:reservation_app/data/repository/member/member_repository_impl.dart';
import 'package:reservation_app/data/repository/notice/notice_repository_impl.dart';
import 'package:reservation_app/data/repository/reservation/reservation_repository_impl.dart';
import 'package:reservation_app/data/repository/sign/sign_repository_impl.dart';
import 'package:reservation_app/di/local/local_module.dart';
import 'package:reservation_app/di/network/network_module.dart';
import 'package:reservation_app/di/prefs/shared_pref_module.dart';
import 'package:reservation_app/domain/repository/banner/banner_repository.dart';
import 'package:reservation_app/domain/repository/member/member_repository.dart';
import 'package:reservation_app/domain/repository/notice/notice_repository.dart';
import 'package:reservation_app/domain/repository/reservation/reservation_repository.dart';
import 'package:reservation_app/domain/repository/sign/sign_repository.dart';
import 'package:reservation_app/domain/usecase/banner/get_all_banner_image_use_case.dart';
import 'package:reservation_app/domain/usecase/member/get_my_user_info_use_case.dart';
import 'package:reservation_app/domain/usecase/member/request_update_fcm_token_use_case.dart';
import 'package:reservation_app/domain/usecase/notice/get_all_notice_list_use_case.dart';
import 'package:reservation_app/domain/usecase/reservation/get_reservation_filter_page_list_use_case.dart';
import 'package:reservation_app/domain/usecase/reservation/get_reservation_non_auth_list_use_case.dart';
import 'package:reservation_app/domain/usecase/reservation/get_reservation_range_section_list_use_case.dart';
import 'package:reservation_app/domain/usecase/reservation/get_reservation_target_part_time_use_case.dart';
import 'package:reservation_app/domain/usecase/reservation/get_tartget_date_reservation_use_case.dart';
import 'package:reservation_app/domain/usecase/reservation/request_approval_check_reservation_use_case.dart';
import 'package:reservation_app/domain/usecase/reservation/request_create_reservation_use_case.dart';
import 'package:reservation_app/domain/usecase/reservation/request_reservation_detail_by_user_use_case.dart';
import 'package:reservation_app/domain/usecase/reservation/request_reservation_detail_use_case.dart';
import 'package:reservation_app/domain/usecase/sign/get_auth_phone_number_check_use_case.dart';
import 'package:reservation_app/domain/usecase/sign/get_auth_phone_number_use_case.dart';
import 'package:reservation_app/domain/usecase/sign/request_sign_in_use_case.dart';
import 'package:reservation_app/domain/usecase/sign/request_sign_out_use_case.dart';
import 'package:reservation_app/presentation/views/app/bloc/app_info_bloc.dart';
import 'package:reservation_app/presentation/views/fcm/bloc/fcm_notification_bloc.dart';
import 'package:reservation_app/presentation/views/main/bloc/main_bloc.dart';
import 'package:reservation_app/presentation/views/main/tabs/home/bloc/home_tab_bloc.dart';
import 'package:reservation_app/presentation/views/main/tabs/home/tabs/home/bloc/content_home_tab_bloc.dart';
import 'package:reservation_app/presentation/views/main/tabs/home/tabs/location/bloc/content_location_tab_bloc.dart';
import 'package:reservation_app/presentation/views/main/tabs/home/tabs/notice/bloc/content_notice_tab_bloc.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/calendar/bloc/reservation_calendar_tab_bloc.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/bloc/reservation_check_bloc.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/details/bloc/reservation_check_detail_bloc.dart';
import 'package:reservation_app/presentation/views/network/bloc/network_bloc.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/fifth/reservation_fifth_bloc.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/fourth/reservation_fourth_bloc.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/reservation_bloc.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/second/reservation_second_bloc.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/third/reservation_third_bloc.dart';
import 'package:reservation_app/presentation/views/sign/bloc/sign_bloc.dart';
import 'package:reservation_app/presentation/views/user/bloc/user_info_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  // 📌 SharedPreferences Singleton 등록
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

  // 📌 Api Service
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
  locator.registerLazySingleton<MemberApiService>(
    () => MemberApiService(locator<Dio>()),
  );

  // 📌 DataSource
  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      locator<BannerApiService>(),
      locator<MemberApiService>(),
      locator<NoticeApiService>(),
      locator<ReservationApiService>(),
      locator<SignApiService>(),
    ),
  );

  // 📌 Repository
  locator.registerLazySingleton<BannerRepository>(
    () => BannerRepositoryImpl(locator<RemoteDataSource>()),
  );
  locator.registerLazySingleton<ReservationRepository>(
    () => ReservationRepositoryImpl(
      locator<RemoteDataSource>(),
      locator<SharedPreferenceModule>(),
    ),
  );
  locator.registerLazySingleton<NoticeRepository>(
    () => NoticeRepositoryImpl(locator<RemoteDataSource>()),
  );
  locator.registerLazySingleton<SignRepository>(
    () => SignRepositoryImpl(
      locator<RemoteDataSource>(),
      locator<SharedPreferenceModule>(),
    ),
  );
  locator.registerLazySingleton<FcmRepository>(
    () => FcmRepository(locator<SharedPreferenceModule>()),
  );
  locator.registerLazySingleton<MemberRepository>(
    () => MemberRepositoryImpl(
      locator<RemoteDataSource>(),
      locator<SharedPreferenceModule>(),
    ),
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
  locator.registerLazySingleton<GetMyUserInfoUseCase>(
    () => GetMyUserInfoUseCase(locator<MemberRepository>()),
  );
  locator.registerLazySingleton<RequestUpdateFcmTokenUseCase>(
    () => RequestUpdateFcmTokenUseCase(locator<MemberRepository>()),
  );
  locator.registerLazySingleton<RequestSignInUseCase>(
    () => RequestSignInUseCase(locator<SignRepository>()),
  );
  locator.registerLazySingleton<RequestSignOutUseCase>(
    () => RequestSignOutUseCase(locator<SignRepository>()),
  );
  locator.registerLazySingleton<GetReservationNonAuthListUseCase>(
    () => GetReservationNonAuthListUseCase(locator<ReservationRepository>()),
  );
  locator.registerLazySingleton<GetReservationFilterPageListUseCase>(
    () => GetReservationFilterPageListUseCase(
      locator<ReservationRepository>(),
    ),
  );
  locator.registerLazySingleton<RequestApprovalCheckReservationUseCase>(
    () => RequestApprovalCheckReservationUseCase(
      locator<ReservationRepository>(),
    ),
  );
  locator.registerLazySingleton<RequestReservationDetailUseCase>(
    () => RequestReservationDetailUseCase(
      locator<ReservationRepository>(),
    ),
  );
  locator.registerLazySingleton<RequestReservationDetailByUserUseCase>(
    () => RequestReservationDetailByUserUseCase(
      locator<ReservationRepository>(),
    ),
  );
  locator.registerLazySingleton<GetReservationRangeSectionListUseCase>(
    () => GetReservationRangeSectionListUseCase(
      locator<ReservationRepository>(),
    ),
  );

  // 📌 Bloc
  locator.registerFactory(() => MainBloc());
  locator.registerFactory(
    () => SignBloc(
      locator<SharedPreferenceModule>(),
      locator<RequestSignInUseCase>(),
      locator<RequestSignOutUseCase>(),
    ),
  );
  locator.registerLazySingleton(() => AppInfoBloc());
  locator.registerLazySingleton(
    () => FcmNotificationBloc(locator<FcmRepository>()),
  );
  locator.registerFactory(() => NetworkBloc());
  locator.registerFactory(
    () => UserInfoBloc(
      locator<SharedPreferenceModule>(),
      locator<GetMyUserInfoUseCase>(),
      locator<RequestUpdateFcmTokenUseCase>(),
    ),
  );
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
  locator.registerFactory(
    () => ReservationCheckBloc(
      locator<GetReservationFilterPageListUseCase>(),
      locator<RequestApprovalCheckReservationUseCase>(),
    ),
  );
  locator.registerFactory(
    () => ReservationCheckDetailBloc(
      locator<RequestReservationDetailUseCase>(),
      locator<RequestReservationDetailByUserUseCase>(),
      locator<RequestApprovalCheckReservationUseCase>(),
    ),
  );
  locator.registerFactory(
    () => ReservationCalendarTabBloc(
      locator<GetReservationRangeSectionListUseCase>(),
    ),
  );
}
