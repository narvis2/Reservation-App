import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/reservation/reservation_detail_model.dart';
import 'package:reservation_app/domain/usecase/reservation/request_reservation_detail_by_user_use_case.dart';
import 'package:reservation_app/domain/usecase/reservation/request_reservation_detail_use_case.dart';
import 'package:reservation_app/presentation/utils/constants.dart';

part 'reservation_check_detail_bloc.freezed.dart';

part 'reservation_check_detail_event.dart';

part 'reservation_check_detail_state.dart';

class ReservationCheckDetailBloc
    extends Bloc<ReservationCheckDetailEvent, ReservationCheckDetailState> {
  final RequestReservationDetailUseCase _requestReservationDetailUseCase;
  final RequestReservationDetailByUserUseCase
      _requestReservationDetailByUserUseCase;

  ReservationCheckDetailBloc(
    this._requestReservationDetailUseCase,
    this._requestReservationDetailByUserUseCase,
  ) : super(const ReservationCheckDetailState.initial()) {
    on<ReservationRequestCheckDetailInitDataEvent>(
      (event, emit) => _onInitData(
        event,
        emit,
      ),
    );

    on<ReservationRequestCheckDetailEvent>(
      (event, emit) => _onRequestDetail(
        event,
        emit,
      ),
    );

    on<ReservationRequestCheckDetailByUserEvent>(
      (event, emit) => _onRequestDetailByUser(
        event,
        emit,
      ),
    );
  }

  void _onInitData(
    ReservationRequestCheckDetailInitDataEvent event,
    Emitter<ReservationCheckDetailState> emit,
  ) {
    final id = event.id;
    final certificationNumber = event.certificationNumber;

    if (id == null && certificationNumber != null) {
      add(
        ReservationRequestCheckDetailByUserEvent(
          certificationNumber: certificationNumber,
        ),
      );
    } else if (id != null && certificationNumber == null) {
      add(
        ReservationRequestCheckDetailEvent(
          id: id,
        ),
      );
    }
  }

  FutureOr<void> _onRequestDetail(
    ReservationRequestCheckDetailEvent event,
    Emitter<ReservationCheckDetailState> emit,
  ) async {
    emit(const _ReservationCheckDetailLoading());

    final response = await _requestReservationDetailUseCase.invoke(event.id);

    if (response is DataSuccess) {
      emit(
        _ReservationCheckDetailSuccess(
          reservationDetailModel: response.data,
        ),
      );
    } else if (response is DataError) {
      emit(
        _ReservationCheckDetailError(
          errorMsg: response.message ?? Constants.dataError,
        ),
      );
    } else if (response is DataNetworkError) {
      emit(
        _ReservationCheckDetailError(
          errorMsg: response.message ?? Constants.dataError,
        ),
      );
    } else {
      emit(
        const _ReservationCheckDetailError(
          errorMsg: Constants.dataError,
        ),
      );
    }
  }

  FutureOr<void> _onRequestDetailByUser(
    ReservationRequestCheckDetailByUserEvent event,
    Emitter<ReservationCheckDetailState> emit,
  ) async {
    emit(const _ReservationCheckDetailLoading());

    final response = await _requestReservationDetailByUserUseCase.invoke(
      event.certificationNumber,
    );

    if (response is DataSuccess) {
      emit(
        _ReservationCheckDetailSuccess(
          reservationDetailModel: response.data,
        ),
      );
    } else if (response is DataError) {
      emit(
        _ReservationCheckDetailError(
          errorMsg: response.message ?? Constants.dataError,
        ),
      );
    } else if (response is DataNetworkError) {
      emit(
        _ReservationCheckDetailError(
          errorMsg: response.message ?? Constants.dataError,
        ),
      );
    } else {
      emit(
        const _ReservationCheckDetailError(
          errorMsg: Constants.dataError,
        ),
      );
    }
  }
}