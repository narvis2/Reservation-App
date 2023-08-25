import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/reservation/request/reservation_approval_check_request_model.dart';
import 'package:reservation_app/domain/model/reservation/reservation_detail_model.dart';
import 'package:reservation_app/domain/usecase/reservation/request_approval_check_reservation_use_case.dart';
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
  final RequestApprovalCheckReservationUseCase
      _requestApprovalCheckReservationUseCase;

  ReservationCheckDetailBloc(
    this._requestReservationDetailUseCase,
    this._requestReservationDetailByUserUseCase,
    this._requestApprovalCheckReservationUseCase,
  ) : super(ReservationCheckDetailState()) {
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

    on<ReservationCheckDetailCheckEvent>(
      (event, emit) => _onRequestCheck(
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
    emit(
      state.copyWith(
        detailInfoStatus: ReservationDetailInfoStatus.loading,
      ),
    );

    final response = await _requestReservationDetailUseCase.invoke(event.id);

    if (response is DataSuccess) {
      emit(
        state.copyWith(
          detailInfoStatus: ReservationDetailInfoStatus.success,
          reservationDetailModel: response.data,
          detailsInfoErrorMsg: null,
        ),
      );
    } else if (response is DataError) {
      emit(
        state.copyWith(
          detailInfoStatus: ReservationDetailInfoStatus.error,
          reservationDetailModel: null,
          detailsInfoErrorMsg: response.message ?? Constants.dataError,
        ),
      );
    } else if (response is DataNetworkError) {
      emit(
        state.copyWith(
          detailInfoStatus: ReservationDetailInfoStatus.error,
          reservationDetailModel: null,
          detailsInfoErrorMsg: response.message ?? Constants.networkError,
        ),
      );
    } else {
      emit(
        state.copyWith(
          detailInfoStatus: ReservationDetailInfoStatus.error,
          reservationDetailModel: null,
          detailsInfoErrorMsg: response.message ?? Constants.dataError,
        ),
      );
    }
  }

  FutureOr<void> _onRequestDetailByUser(
    ReservationRequestCheckDetailByUserEvent event,
    Emitter<ReservationCheckDetailState> emit,
  ) async {
    emit(
      state.copyWith(
        detailInfoStatus: ReservationDetailInfoStatus.loading,
      ),
    );

    final response = await _requestReservationDetailByUserUseCase.invoke(
      event.certificationNumber,
    );

    if (response is DataSuccess) {
      emit(
        state.copyWith(
          detailInfoStatus: ReservationDetailInfoStatus.success,
          reservationDetailModel: response.data,
          detailsInfoErrorMsg: null,
        ),
      );
    } else if (response is DataError) {
      emit(
        state.copyWith(
          detailInfoStatus: ReservationDetailInfoStatus.error,
          reservationDetailModel: null,
          detailsInfoErrorMsg: response.message ?? Constants.dataError,
        ),
      );
    } else if (response is DataNetworkError) {
      emit(
        state.copyWith(
          detailInfoStatus: ReservationDetailInfoStatus.error,
          reservationDetailModel: null,
          detailsInfoErrorMsg: response.message ?? Constants.dataError,
        ),
      );
    } else {
      emit(
        state.copyWith(
          detailInfoStatus: ReservationDetailInfoStatus.error,
          reservationDetailModel: null,
          detailsInfoErrorMsg: response.message ?? Constants.dataError,
        ),
      );
    }
  }

  FutureOr<void> _onRequestCheck(
    ReservationCheckDetailCheckEvent event,
    Emitter<ReservationCheckDetailState> emit,
  ) async {

    emit(
      state.copyWith(
        checkStatus: ReservationCheckStatus.loading,
      ),
    );

    final response = await _requestApprovalCheckReservationUseCase.invoke(
      ReservationApprovalCheckRequestModel(
        id: event.id,
        isAgree: event.isApproval,
      ),
    );

    if (response is DataSuccess) {
      emit(
        state.copyWith(
          checkStatus: ReservationCheckStatus.success,
          checkErrorMsg: null
        ),
      );
    } else if (response is DataNetworkError) {
      emit(
        state.copyWith(
            checkStatus: ReservationCheckStatus.success,
            checkErrorMsg: response.message ?? Constants.networkError,
        ),
      );
    } else if (response is DataError) {
      emit(
        state.copyWith(
            checkStatus: ReservationCheckStatus.success,
            checkErrorMsg: response.message ?? Constants.dataError,
        ),
      );
    } else {
      emit(
        state.copyWith(
            checkStatus: ReservationCheckStatus.success,
            checkErrorMsg: response.message ?? Constants.dataError,
        ),
      );
    }
  }
}
