part of 'reservation_check_bloc.dart';

enum ReservationFilterListStatus {
  initial,
  loading,
  success,
  error,
}

@freezed
class ReservationCheckState with _$ReservationCheckState {
  const factory ReservationCheckState({
    @Default(
      ReservationFilterListStatus.initial,
    )
    ReservationFilterListStatus filterListStatus,
    @Default(null) ReservationFilterListModel? reservationFilterListData,
    @Default(null) String? filterListErrorMsg,
    @Default(ReservationFilterType.all) ReservationFilterType reservationFilterType,
  }) = Initial;
}
