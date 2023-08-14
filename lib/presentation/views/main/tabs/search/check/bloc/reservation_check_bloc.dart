import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/reservation/enum/reservation_filter_type.dart';
import 'package:reservation_app/domain/model/reservation/page/reservation_filter_list_model.dart';
import 'package:reservation_app/domain/usecase/reservation/get_reservation_filter_page_list_use_case.dart';
import 'package:reservation_app/presentation/utils/constants.dart';

part 'reservation_check_bloc.freezed.dart';

part 'reservation_check_event.dart';

part 'reservation_check_state.dart';

class ReservationCheckBloc
    extends Bloc<ReservationCheckEvent, ReservationCheckState> {
  final GetReservationFilterPageListUseCase
      _getReservationFilterPageListUseCase;

  ReservationCheckBloc(
    this._getReservationFilterPageListUseCase,
  ) : super(ReservationCheckState()) {
    on<ReservationCheckInitEvent>(
      (event, emit) => _requestInit(
        event,
        emit,
      ),
    );

    on<ReservationCheckFilterListEvent>(
      (event, emit) => _requestFilterList(
        event,
        emit,
      ),
    );
  }

  void _requestInit(
    ReservationCheckInitEvent event,
    Emitter<ReservationCheckState> emit,
  ) {
    if (state.reservationFilterType != ReservationFilterType.all) {
      emit(state.copyWith(reservationFilterType: ReservationFilterType.all));
    }

    add(
      ReservationCheckFilterListEvent(
        page: 0,
        limit: 15,
        filterType: state.reservationFilterType,
      ),
    );
  }

  FutureOr<void> _requestFilterList(
    ReservationCheckFilterListEvent event,
    Emitter<ReservationCheckState> emit,
  ) async {
    emit(state.copyWith(filterListStatus: ReservationFilterListStatus.loading));

    final response = await _getReservationFilterPageListUseCase.invoke(
      event.page,
      event.limit,
      event.filterType,
    );

    if (response is DataSuccess) {
      final result = response.data;

      if (result != null) {
        emit(
          state.copyWith(
            filterListStatus: ReservationFilterListStatus.success,
            reservationFilterListData: result,
          ),
        );
      } else {
        emit(
          state.copyWith(
            filterListStatus: ReservationFilterListStatus.error,
            filterListErrorMsg: Constants.networkError,
          ),
        );
      }
    } else if (response is DataNetworkError) {
      emit(
        state.copyWith(
          filterListStatus: ReservationFilterListStatus.error,
          filterListErrorMsg: response.message ?? Constants.networkError,
        ),
      );
    } else if (response is DataError) {
      emit(
        state.copyWith(
          filterListStatus: ReservationFilterListStatus.error,
          filterListErrorMsg: Constants.dataError,
        ),
      );
    } else {
      emit(
        state.copyWith(
          filterListStatus: ReservationFilterListStatus.error,
          filterListErrorMsg: Constants.dataError,
        ),
      );
    }
  }
}
