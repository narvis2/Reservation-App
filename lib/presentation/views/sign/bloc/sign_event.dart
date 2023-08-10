part of 'sign_bloc.dart';

@freezed
class SignEvent with _$SignEvent {
  const factory SignEvent.init() = SignInitEvent;

  const factory SignEvent.setIsAutoLogin() = SignIsAutoLoginEvent;

  const factory SignEvent.setIsEnablePush() = SignIsEnablePushEvent;

  const factory SignEvent.setIsSavedId() = SignIsSavedIdEvent;

  const factory SignEvent.onSignClick({
    required String id,
    required String password,
  }) = SignOnSignInClickEvent;

  const factory SignEvent.onSignOutClick() = SignOnSignOutClickEvent;
}
