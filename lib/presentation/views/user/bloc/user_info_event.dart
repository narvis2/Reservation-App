part of 'user_info_bloc.dart';

@freezed
class UserInfoEvent with _$UserInfoEvent {
  const factory UserInfoEvent.init() = UserInfoInitEvent;

  const factory UserInfoEvent.setIsAutoLogin({
    required bool isAutoLogin
  }) = UserInfoIsAutoLoginEvent;

  const factory UserInfoEvent.setIsEnablePush({
    required bool isEnablePush
  }) = UserInfoIsEnablePushEvent;
}

