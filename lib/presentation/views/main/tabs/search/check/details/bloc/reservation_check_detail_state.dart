part of 'reservation_check_detail_bloc.dart';

enum ReservationDetailInfoStatus {
  initial,
  loading,
  success,
  error,
}

enum ReservationCheckStatus {
  initial,
  loading,
  success,
  error,
}

@freezed
class ReservationCheckDetailState with _$ReservationCheckDetailState {
  const factory ReservationCheckDetailState({
    @Default(ReservationDetailInfoStatus.initial) ReservationDetailInfoStatus detailInfoStatus,
    @Default(null) ReservationDetailModel? reservationDetailModel,
    @Default(null) String? detailsInfoErrorMsg,
    @Default(ReservationCheckStatus.initial) ReservationCheckStatus checkStatus,
    @Default(null) String? checkErrorMsg,
  }) = Initial;
}
