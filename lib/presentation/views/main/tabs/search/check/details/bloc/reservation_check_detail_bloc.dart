import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reservation_app/domain/model/reservation/reservation_detail_model.dart';
import 'package:reservation_app/domain/usecase/reservation/request_reservation_detail_by_user_use_case.dart';
import 'package:reservation_app/domain/usecase/reservation/request_reservation_detail_use_case.dart';

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

  FutureOr<void> _onRequestDetail(
    ReservationRequestCheckDetailEvent event,
    Emitter<ReservationCheckDetailState> emit,
  ) async {

  }

  FutureOr<void> _onRequestDetailByUser(
    ReservationRequestCheckDetailByUserEvent event,
    Emitter<ReservationCheckDetailState> emit,
  ) async {

  }
}
