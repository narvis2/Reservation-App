import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reservation_app/domain/model/reservation/reservation_non_auth_model.dart';
import 'package:reservation_app/domain/usecase/reservation/get_reservation_non_auth_list_use_case.dart';

part 'reservation_check_bloc.freezed.dart';

part 'reservation_check_event.dart';

part 'reservation_check_state.dart';

class ReservationCheckBloc
    extends Bloc<ReservationCheckEvent, ReservationCheckState> {
  final GetReservationNonAuthListUseCase _getReservationNonAuthListUseCase;

  ReservationCheckBloc(
    this._getReservationNonAuthListUseCase,
  ) : super(ReservationCheckState()) {
    on<ReservationCheckGetNonAuthListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
