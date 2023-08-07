part of 'app_info_bloc.dart';

@freezed
class AppInfoState with _$AppInfoState {
  const factory AppInfoState({
    @Default(null) PackageInfo? appInfo,
  }) = Initial;
}
