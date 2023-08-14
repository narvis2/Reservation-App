part of 'reservation_check_bloc.dart';

enum ReservationNonAuthListStatus {
  initial,
  loading,
  success,
  error,
}

@freezed
class ReservationCheckState with _$ReservationCheckState {
  const factory ReservationCheckState({
    @Default(
      ReservationNonAuthListStatus.initial,
    )
    ReservationNonAuthListStatus reservationNonAuthListStatus,
    @Default([]) List<ReservationNonAuthModel> reservationNonAuthList,
    @Default(null) String? nonAuthErrorMsg,
  }) = Initial;
}
