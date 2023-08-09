import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reservation_app/di/prefs/shared_pref_module.dart';
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/member/member_model.dart';
import 'package:reservation_app/domain/usecase/member/get_my_user_info_use_case.dart';
import 'package:reservation_app/domain/usecase/member/request_update_fcm_token_use_case.dart';
import 'package:reservation_app/presentation/utils/constants.dart';

part 'user_info_bloc.freezed.dart';

part 'user_info_event.dart';

part 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  final SharedPreferenceModule _pref;
  final GetMyUserInfoUseCase _getMyUserInfoUseCase;
  final RequestUpdateFcmTokenUseCase _updateFcmTokenUseCase;

  UserInfoBloc(
    this._pref,
    this._getMyUserInfoUseCase,
    this._updateFcmTokenUseCase,
  ) : super(UserInfoState()) {
    on<UserInfoGetEvent>((event, emit) => _setUserInfo(event, emit));
    on<UserInfoUpdateFcmTokenEvent>(
      (event, emit) => _updateFcmTokenToServer(event, emit),
    );
  }

  FutureOr<void> _setUserInfo(
    UserInfoGetEvent event,
    Emitter<UserInfoState> emit,
  ) async {
    emit(state.copyWith(userInfoStatus: UserInfoStatus.loading));

    final response = await _getMyUserInfoUseCase.invoke();

    if (response is DataSuccess) {
      final result = response.data;
      emit(
        state.copyWith(
          userInfoStatus: UserInfoStatus.success,
          memberModel: result,
        ),
      );
    } else if (response is DataNetworkError) {
      emit(
        state.copyWith(
          userInfoStatus: UserInfoStatus.error,
          errorMsg: response.message ?? Constants.networkError,
        ),
      );
    } else if (response is DataError) {
      emit(
        state.copyWith(
          userInfoStatus: UserInfoStatus.error,
          errorMsg: Constants.dataError,
        ),
      );
    } else {
      emit(
        state.copyWith(
          userInfoStatus: UserInfoStatus.error,
          errorMsg: Constants.dataError,
        ),
      );
    }
  }

  FutureOr<void> _updateFcmTokenToServer(
    UserInfoUpdateFcmTokenEvent event,
    Emitter<UserInfoState> emit,
  ) async {
    emit(state.copyWith(userInfoStatus: UserInfoStatus.loading));

    final response = await _updateFcmTokenUseCase.invoke();

    if (response is DataSuccess) {
      final result = response.data;

      if (result != null && result) {
        add(UserInfoGetEvent());
      } else {
        emit(
          state.copyWith(
            userInfoStatus: UserInfoStatus.error,
            errorMsg: Constants.networkError,
          ),
        );
      }
    } else if (response is DataNetworkError) {
      emit(
        state.copyWith(
          userInfoStatus: UserInfoStatus.error,
          errorMsg: response.message ?? Constants.networkError,
        ),
      );
    } else if (response is DataError) {
      emit(
        state.copyWith(
          userInfoStatus: UserInfoStatus.error,
          errorMsg: Constants.dataError,
        ),
      );
    } else {
      emit(
        state.copyWith(
          userInfoStatus: UserInfoStatus.error,
          errorMsg: Constants.dataError,
        ),
      );
    }
  }
}
