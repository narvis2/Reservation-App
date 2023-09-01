import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/reservation/request/reservation_date_range_req_model.dart';
import 'package:reservation_app/domain/model/reservation/reservation_range_section_model.dart';
import 'package:reservation_app/domain/usecase/reservation/get_reservation_range_section_list_use_case.dart';
import 'package:reservation_app/presentation/utils/constants.dart';
import 'package:reservation_app/presentation/utils/date_time_utils.dart';

part 'reservation_calendar_tab_bloc.freezed.dart';

part 'reservation_calendar_tab_event.dart';

part 'reservation_calendar_tab_state.dart';

class ReservationCalendarTabBloc
    extends Bloc<ReservationCalendarTabEvent, ReservationCalendarTabState> {
  final GetReservationRangeSectionListUseCase _getReservationRangeSectionListUseCase;

  ReservationCalendarTabBloc(
    this._getReservationRangeSectionListUseCase,
  ) : super(ReservationCalendarTabState()) {
    on<ReservationCalendarTabInitDataEvent>(
      (event, emit) => _getInitData(
        event,
        emit,
      ),
    );
    on<ReservationCalendarTabSectionListEvent>(
      (event, emit) => _getSectionList(
        event,
        emit,
      ),
    );
  }

  void _getInitData(
    ReservationCalendarTabInitDataEvent event,
    Emitter<ReservationCalendarTabState> emit,
  ) {
    final now = DateTime.now();

    // 📌 아래와 같이 넣어야지 현재 달의 첫 날부터 마지막 날까지의 데이터를 가져옴
    add(
      ReservationCalendarTabSectionListEvent(
        startTime: DateTime(
          now.year, // 현재 달의 첫 번째 날
          now.month, // 다음 달의 첫 번째 날
          1,
        ),
        endTime: DateTime(
          now.year,
          now.month + 1,
          1,
        ),
      ),
    );
  }

  FutureOr<void> _getSectionList(
    ReservationCalendarTabSectionListEvent event,
    Emitter<ReservationCalendarTabState> emit,
  ) async {
    emit(state.copyWith(sectionListStatus: SectionListStatus.loading));

    debugPrint(
      "📅 event.startTime 👉 ${DateTimeUtils.dateTimeToYearDateString(event.startTime)}",
    );
    debugPrint(
      "📅 event.endTime 👉 ${DateTimeUtils.dateTimeToYearDateString(event.endTime)}",
    );
    final response = await _getReservationRangeSectionListUseCase.invoke(
      ReservationDateRangeReqModel(
        searchStartDate: event.startTime,
        searchEndDate: event.endTime,
      ),
    );

    if (response is DataSuccess) {
      final result = response.data;

      if (result != null) {
        emit(
          state.copyWith(
            sectionListStatus: SectionListStatus.success,
            sectionList: result,
            sectionListErrorMsg: null,
          ),
        );
      } else {
        emit(
          state.copyWith(
            sectionListStatus: SectionListStatus.error,
            sectionList: [],
            sectionListErrorMsg: Constants.networkError,
          ),
        );
      }
    } else if (response is DataNetworkError) {
      emit(
        state.copyWith(
          sectionListStatus: SectionListStatus.error,
          sectionList: [],
          sectionListErrorMsg: response.message ?? Constants.networkError,
        ),
      );
    } else if (response is DataError) {
      emit(
        state.copyWith(
          sectionListStatus: SectionListStatus.error,
          sectionList: [],
          sectionListErrorMsg: response.message ?? Constants.dataError,
        ),
      );
    } else {
      emit(
        state.copyWith(
          sectionListStatus: SectionListStatus.error,
          sectionList: [],
          sectionListErrorMsg: Constants.dataError,
        ),
      );
    }
  }
}
