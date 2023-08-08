part of 'sign_bloc.dart';

@freezed
class SignState with _$SignState {
  const factory SignState({
    @Default(false) bool isAutoLogin,
    @Default(false) bool isEnablePush,
    @Default(false) bool isSavedId,
  }) = Initial;
}
