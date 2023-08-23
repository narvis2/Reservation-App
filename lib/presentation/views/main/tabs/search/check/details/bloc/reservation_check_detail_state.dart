part of 'reservation_check_detail_bloc.dart';

@freezed
class ReservationCheckDetailState with _$ReservationCheckDetailState {
  const factory ReservationCheckDetailState.initial() = _ReservationCheckDetailInitial;
  const factory ReservationCheckDetailState.loading() = _ReservationCheckDetailLoading;
  const factory ReservationCheckDetailState.success({
    @Default(null) ReservationDetailModel? reservationDetailModel,
}) = _ReservationCheckDetailSuccess;
  const factory ReservationCheckDetailState.error({
    @Default(null) String? errorMsg
}) = _ReservationCheckDetailError;
}
