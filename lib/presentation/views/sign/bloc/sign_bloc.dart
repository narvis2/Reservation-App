import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reservation_app/di/prefs/shared_pref_module.dart';
import 'package:reservation_app/domain/model/sign/sign_in_request_model.dart';
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
    final bool isSavedId = await _pref.isSavedId;

    emit(
      state.copyWith(
        isAutoLogin: isAutoLogin,
        isEnablePush: isEnablePush,
        isSavedId: isSavedId,
      ),
    );
  }

  void _setIsAutoLogin(
    SignIsAutoLoginEvent event,
    Emitter<SignState> emit,
  ) {
    final isAutoLogin = state.isAutoLogin;

    _pref.saveIsAutoLogin(!isAutoLogin);
    emit(state.copyWith(isAutoLogin: !isAutoLogin));
  }

  void _setIsEnablePush(
    SignIsEnablePushEvent event,
    Emitter<SignState> emit,
  ) {
    final isEnablePush = state.isEnablePush;

    _pref.saveIsEnablePush(!isEnablePush);
    emit(state.copyWith(isEnablePush: !isEnablePush));
  }

  void _setIsSavedId(
    SignIsSavedIdEvent event,
    Emitter<SignState> emit,
  ) {
    final isSavedId = state.isSavedId;

    _pref.saveIsSavedId(!isSavedId);
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
