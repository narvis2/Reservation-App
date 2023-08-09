part of 'user_info_bloc.dart';

@freezed
class UserInfoEvent with _$UserInfoEvent {
  const factory UserInfoEvent.get() = UserInfoGetEvent;

  const factory UserInfoEvent.updateFcm() = UserInfoUpdateFcmTokenEvent;
}

