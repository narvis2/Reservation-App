part of 'user_info_bloc.dart';

@freezed
class UserInfoState with _$UserInfoState {
  const factory UserInfoState({
    @Default(false) bool isAutoLogin,
    @Default(false) bool isEnablePush,
  }) = Initial;
}