part of 'sign_bloc.dart';

enum SignInStatus {
  initial,
  loading,
  success,
  error,
}

enum SignOutState {
  initial,
  loading,
  success,
  error,
}

@freezed
class SignState with _$SignState {
  const factory SignState({
    @Default(SignInStatus.initial) SignInStatus signInStatus,
    @Default(SignOutState.initial) SignOutState signOutStatus,
    @Default(false) bool isAutoLogin,
    @Default(false) bool isEnablePush,
    @Default(false) bool isSavedId,
    @Default(null) String? savedEmail,
    @Default(null) String? errorMessage,
    @Default(null) String? signOutErrorMsg,
  }) = Initial;
}
