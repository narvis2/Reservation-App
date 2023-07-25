import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/reservation/request/reservation_create_request_model.dart';
import 'package:reservation_app/domain/usecase/reservation/request_create_reservation_use_case.dart';

part 'reservation_fifth_bloc.freezed.dart';

part 'reservation_fifth_event.dart';

part 'reservation_fifth_state.dart';

class ReservationFifthBloc
    extends Bloc<ReservationFifthEvent, ReservationFifthState> {
  final RequestCreateReservationUseCase _requestCreateReservationUseCase;

  ReservationFifthBloc(this._requestCreateReservationUseCase)
      : super(const ReservationFifthInitial()) {
    on<ReservationFifthRequestCreateReservation>(
      (event, emit) => _requestCreateReservation(event, emit),
    );
  }

  FutureOr<void> _requestCreateReservation(
    ReservationFifthRequestCreateReservation event,
    Emitter<ReservationFifthState> emit,
  ) async {
    emit(const ReservationFifthLoading());

    debugPrint("🌨️ event.request 👉 ${event.request.toString()}");
    final response = await _requestCreateReservationUseCase.invoke(
      event.request,
    );

    if (response is DataSuccess) {
      final result = response.data ?? false;
      debugPrint("🌨️ event.request 👉 $result");
      result ? emit(const ReservationFifthSucceed()) : emit(const ReservationFifthError());
    } else if (response is DataError) {
      emit(const ReservationFifthError());
    } else if (response is DataNetworkError) {
      final message = response.message;
      emit(ReservationFifthError(errorMessage: message));
    } else {
      emit(const ReservationFifthError());
    }
  }

  @override
  void onTransition(Transition<ReservationFifthEvent, ReservationFifthState> transition) {
    super.onTransition(transition);

    debugPrint("🌧️🌧️🌧️ transition 👉 $transition");
  }
}
