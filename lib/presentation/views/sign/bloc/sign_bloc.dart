import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reservation_app/di/prefs/shared_pref_module.dart';
import 'package:reservation_app/domain/usecase/sign/request_sign_in_use_case.dart';
import 'package:reservation_app/domain/usecase/sign/request_sign_out_use_case.dart';

part 'sign_bloc.freezed.dart';

part 'sign_event.dart';

part 'sign_state.dart';

class SignBloc extends Bloc<SignEvent, SignState> {
  final SharedPreferenceModule _pref;
  final RequestSignInUseCase _requestSignInUseCase;
  final RequestSignOutUseCase _requestSignOutUseCase;

  SignBloc(
    this._pref,
    this._requestSignInUseCase,
    this._requestSignOutUseCase,
  ) : super(SignState()) {
    on<SignInitEvent>((event, emit) => _setInitState(event, emit));

    on<SignIsAutoLoginEvent>((event, emit) => _setIsAutoLogin(event, emit));

    on<SignIsEnablePushEvent>(
      (event, emit) => _setIsEnablePush(event, emit),
    );

    on<SignIsSavedIdEvent>(
      (event, emit) => _setIsSavedId(event, emit),
    );

    on<SignOnSignInClickEvent>(
      (event, emit) => _onSignInClick(event, emit),
    );
  }

  FutureOr<void> _setInitState(
    SignInitEvent event,
    Emitter<SignState> emit,
  ) async {
    final bool isAutoLogin = await _pref.isAutoLogin;
    final bool isEnablePush = await _pref.isEnablePush;
    bool isSavedId = await _pref.isSavedId;

    if (isAutoLogin && !isSavedId) {
      await _pref.saveIsSavedId(true);
      isSavedId = true;
    }

    emit(
      state.copyWith(
        isAutoLogin: isAutoLogin,
        isEnablePush: isEnablePush,
        isSavedId: isSavedId,
      ),
    );
  }

  FutureOr<void> _setIsAutoLogin(
    SignIsAutoLoginEvent event,
    Emitter<SignState> emit,
  ) async {
    final isAutoLogin = !state.isAutoLogin;

    if (isAutoLogin && !state.isSavedId) {
      await _pref.saveIsSavedId(true);
      emit(state.copyWith(isSavedId: true));
    }

    await _pref.saveIsAutoLogin(isAutoLogin);
    emit(state.copyWith(isAutoLogin: isAutoLogin));
  }

  FutureOr<void> _setIsEnablePush(
    SignIsEnablePushEvent event,
    Emitter<SignState> emit,
  ) async {
    final isEnablePush = state.isEnablePush;

    await _pref.saveIsEnablePush(!isEnablePush);
    emit(state.copyWith(isEnablePush: !isEnablePush));
  }

  FutureOr<void> _setIsSavedId(
    SignIsSavedIdEvent event,
    Emitter<SignState> emit,
  ) async {
    if (state.isAutoLogin) return;

    final isSavedId = state.isSavedId;

    await _pref.saveIsSavedId(!isSavedId);
    emit(state.copyWith(isSavedId: !isSavedId));
  }

  void _onSignInClick(
    SignOnSignInClickEvent event,
    Emitter<SignState> emit,
  ) {
    debugPrint("📍 onSignInClick email 👉 ${event.id}");
    debugPrint("📍 onSignInClick password 👉 ${event.password}");
  }
}
