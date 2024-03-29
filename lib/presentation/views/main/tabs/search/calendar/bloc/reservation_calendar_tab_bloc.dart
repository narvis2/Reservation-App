import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/reservation/request/reservation_date_range_req_model.dart';
import 'package:reservation_app/domain/model/reservation/reservation_range_section_model.dart';
import 'package:reservation_app/domain/model/reservation/reservation_target_date_model.dart';
import 'package:reservation_app/domain/usecase/reservation/get_reservation_range_section_list_use_case.dart';
import 'package:reservation_app/domain/usecase/reservation/get_tartget_date_reservation_use_case.dart';
import 'package:reservation_app/presentation/utils/constants.dart';
import 'package:reservation_app/presentation/utils/date_time_utils.dart';

part 'reservation_calendar_tab_bloc.freezed.dart';

part 'reservation_calendar_tab_event.dart';

part 'reservation_calendar_tab_state.dart';

class ReservationCalendarTabBloc
    extends Bloc<ReservationCalendarTabEvent, ReservationCalendarTabState> {
  final GetReservationRangeSectionListUseCase
      _getReservationRangeSectionListUseCase;
  final GetTargetDateReservationUseCase _getTargetDateReservationUseCase;

  ReservationCalendarTabBloc(
    this._getReservationRangeSectionListUseCase,
    this._getTargetDateReservationUseCase,
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
    on<ReservationCalendarTabTargetListEvent>(
      (event, emit) => _getTargetList(
        event,
        emit,
      ),
    );
    on<ReservationCalendarTabResetTargetListEvent>(
      (event, emit) => _onResetTargetList(
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

    // 달력 데이터를 처음 가져올때만 Loading Dialog 를 보여주기 위해 여기서 Loading 처리
    emit(
      state.copyWith(
        sectionListStatus: SectionListStatus.loading,
        sectionListErrorMsg: null,
        sectionList: [],
        targetListStatus: TargetListStatus.initial,
        targetListErrorMsg: null,
        targetList: [],
      ),
    );

    /// 📌 아래와 같이 넣어야지 현재 달의 첫 날부터 마지막 날까지의 데이터를 가져옴
    /// 📍 그 전달의 데이터와 이번달의 데이터 그리고 다음달의 데이터 총 3달의 데이터를 가져옴
    add(
      ReservationCalendarTabSectionListEvent(
        startTime: DateTime(
          now.year,
          now.month - 1,
          1,
        ),
        endTime: DateTime(
          now.year,
          now.month + 2,
          1,
        ),
      ),
    );
  }

  FutureOr<void> _getSectionList(
    ReservationCalendarTabSectionListEvent event,
    Emitter<ReservationCalendarTabState> emit,
  ) async {
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

  FutureOr<void> _getTargetList(
    ReservationCalendarTabTargetListEvent event,
    Emitter<ReservationCalendarTabState> emit,
  ) async {
    emit(state.copyWith(targetListStatus: TargetListStatus.loading));

    final response = await _getTargetDateReservationUseCase.invoke(
      event.targetDate,
    );

    if (response is DataSuccess) {
      final result = response.data;

      if (result != null) {
        emit(
          state.copyWith(
            targetListStatus: TargetListStatus.success,
            targetList: result,
            targetListErrorMsg: null,
          ),
        );
      } else {
        emit(
          state.copyWith(
            targetListStatus: TargetListStatus.error,
            targetList: [],
            targetListErrorMsg: Constants.networkError,
          ),
        );
      }
    } else if (response is DataNetworkError) {
      emit(
        state.copyWith(
          targetListStatus: TargetListStatus.error,
          targetList: [],
          targetListErrorMsg: response.message ?? Constants.networkError,
        ),
      );
    } else if (response is DataError) {
      emit(
        state.copyWith(
          targetListStatus: TargetListStatus.error,
          targetList: [],
          targetListErrorMsg: response.message ?? Constants.dataError,
        ),
      );
    } else {
      emit(
        state.copyWith(
          targetListStatus: TargetListStatus.error,
          targetList: [],
          targetListErrorMsg: Constants.dataError,
        ),
      );
    }
  }

  void _onResetTargetList(
    ReservationCalendarTabResetTargetListEvent event,
    Emitter<ReservationCalendarTabState> emit,
  ) {
    emit(
      state.copyWith(
        targetList: [],
        targetListErrorMsg: null,
      ),
    );
  }
}
