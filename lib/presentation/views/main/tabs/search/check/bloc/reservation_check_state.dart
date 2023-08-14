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
    @Default([]) List<ReservationFilterModel> reservationList,
    @Default(null) String? filterListErrorMsg,
    @Default(false) bool hasNext,
    @Default(0) int totalCount,
    @Default(0) int offset,
    @Default(ReservationFilterType.all) ReservationFilterType reservationFilterType,
  }) = Initial;
}
