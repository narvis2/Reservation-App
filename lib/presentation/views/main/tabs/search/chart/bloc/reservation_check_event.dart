part of 'reservation_check_bloc.dart';

@freezed
class ReservationCheckEvent with _$ReservationCheckEvent {
  const factory ReservationCheckEvent.getNonAuthList() = ReservationCheckGetNonAuthListEvent;
}
