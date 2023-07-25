part of 'reservation_fifth_bloc.dart';

@freezed
class ReservationFifthState with _$ReservationFifthState {
  const factory ReservationFifthState.initial() = ReservationFifthInitial;

  const factory ReservationFifthState.loading() = ReservationFifthLoading;

  const factory ReservationFifthState.succeed() = ReservationFifthSucceed;

  const factory ReservationFifthState.error({
    @Default(null) String? errorMessage,
  }) = ReservationFifthError;
}
