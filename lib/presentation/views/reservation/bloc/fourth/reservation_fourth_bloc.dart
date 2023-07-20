import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reservation_app/data/model/sign/phone_auth_check_request.dart';
import 'package:reservation_app/data/model/sign/phone_auth_request.dart';
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/usecase/sign/get_auth_phone_number_check_use_case.dart';
import 'package:reservation_app/domain/usecase/sign/get_auth_phone_number_use_case.dart';

part 'reservation_fourth_bloc.freezed.dart';

part 'reservation_fourth_event.dart';

part 'reservation_fourth_state.dart';

class ReservationFourthBloc
    extends Bloc<ReservationFourthEvent, ReservationFourthState> {
  final GetAuthPhoneNumberUseCase _getAuthPhoneNumberUseCase;
  final GetAuthPhoneNumberCheckUseCase _getAuthPhoneNumberCheckUseCase;

  ReservationFourthBloc(
    this._getAuthPhoneNumberUseCase,
    this._getAuthPhoneNumberCheckUseCase,
  ) : super(const ReservationFourthState()) {
    on<ReservationFourthRequestPhoneAuthNumber>(
      (event, emit) => _requestPhoneAuthNumber(event, emit),
    );
    on<ReservationFourthRequestPhoneAuthCheck>(
      (event, emit) => _requestAuthCodeCheck(event, emit),
    );
  }

  FutureOr<void> _requestPhoneAuthNumber(
    ReservationFourthRequestPhoneAuthNumber event,
    Emitter<ReservationFourthState> emit,
  ) async {
    emit(state.copyWith(reqAuthNumberStatus: RequestAuthNumberStatus.loading));

    final response = await _getAuthPhoneNumberUseCase.invoke(
      PhoneAuthRequest(
        name: event.name,
        phoneNumber: event.phoneNumber,
      ),
    );

    if (response is DataSuccess) {
      emit(
        state.copyWith(
          reqAuthNumberStatus: RequestAuthNumberStatus.success,
          isRequestSuccess: response.data ?? false,
          name: event.name,
          phoneNumber: event.phoneNumber,
        ),
      );
    } else if (response is DataError) {
      emit(
        state.copyWith(
          reqAuthNumberStatus: RequestAuthNumberStatus.error,
          isRequestSuccess: false,
        ),
      );
    } else if (response is DataNetworkError) {
      emit(
        state.copyWith(
          reqAuthNumberStatus: RequestAuthNumberStatus.error,
          isRequestSuccess: false,
        ),
      );
    } else {
      emit(
        state.copyWith(
          reqAuthNumberStatus: RequestAuthNumberStatus.error,
          isRequestSuccess: false,
        ),
      );
    }
  }

  FutureOr<void> _requestAuthCodeCheck(
    ReservationFourthRequestPhoneAuthCheck event,
    Emitter<ReservationFourthState> emit,
  ) async {
    emit(
      state.copyWith(
        reqAuthNumberStatus: RequestAuthNumberStatus.initial,
        checkAuthNumberStatus: CheckAuthNumberStatus.loading,
      ),
    );

    final response = await _getAuthPhoneNumberCheckUseCase.invoke(
      PhoneAuthCheckRequest(
        name: state.name,
        phoneNumber: state.phoneNumber,
        authenticationCode: event.authCode,
      ),
    );

    if (response is DataSuccess) {
      emit(
        state.copyWith(
          checkAuthNumberStatus: CheckAuthNumberStatus.success,
          isCheckSuccess: response.data ?? false,
        ),
      );
    } else if (response is DataError) {
      emit(
        state.copyWith(
          checkAuthNumberStatus: CheckAuthNumberStatus.error,
          isCheckSuccess: false,
        ),
      );
    } else if (response is DataNetworkError) {
      emit(
        state.copyWith(
          checkAuthNumberStatus: CheckAuthNumberStatus.error,
          isCheckSuccess: false,
        ),
      );
    } else {
      emit(
        state.copyWith(
          checkAuthNumberStatus: CheckAuthNumberStatus.error,
          isCheckSuccess: false,
        ),
      );
    }
  }
}
