part of 'user_info_bloc.dart';

enum UserInfoStatus {
  initial,
  loading,
  success,
  error,
}

@freezed
class UserInfoState with _$UserInfoState {
  const factory UserInfoState({
    @Default(UserInfoStatus.initial) UserInfoStatus userInfoStatus,
    @Default(null) MemberModel? memberModel,
    @Default(null) String? errorMsg,
  }) = Initial;
}