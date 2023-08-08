part of 'user_info_bloc.dart';

@freezed
class UserInfoEvent with _$UserInfoEvent {
  const factory UserInfoEvent.init() = UserInfoInitEvent;
}

