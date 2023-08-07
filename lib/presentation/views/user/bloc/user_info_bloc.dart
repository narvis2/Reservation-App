import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reservation_app/di/prefs/shared_pref_module.dart';

part 'user_info_bloc.freezed.dart';

part 'user_info_event.dart';

part 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  final SharedPreferenceModule _pref;

  UserInfoBloc(
    this._pref,
  ) : super(UserInfoState()) {
    on<UserInfoInitEvent>((event, emit) => _setInitState(event, emit));

    on<UserInfoIsAutoLoginEvent>((event, emit) => _setIsAutoLogin(event, emit));

    on<UserInfoIsEnablePushEvent>(
      (event, emit) => _setIsEnablePush(event, emit),
    );
  }

  FutureOr<void> _setInitState(
    UserInfoInitEvent event,
    Emitter<UserInfoState> emit,
  ) async {
    final bool isAutoLogin = await _pref.isAutoLogin;
    final bool isEnablePush = await _pref.isEnablePush;

    emit(
      state.copyWith(
        isAutoLogin: isAutoLogin,
        isEnablePush: isEnablePush,
      ),
    );
  }

  void _setIsAutoLogin(
    UserInfoIsAutoLoginEvent event,
    Emitter<UserInfoState> emit,
  ) {
    _pref.saveIsAutoLogin(event.isAutoLogin);
    emit(state.copyWith(isAutoLogin: event.isAutoLogin));
  }

  void _setIsEnablePush(
    UserInfoIsEnablePushEvent event,
    Emitter<UserInfoState> emit,
  ) {
    _pref.saveIsEnablePush(event.isEnablePush);
    emit(state.copyWith(isEnablePush: event.isEnablePush));
  }
}
