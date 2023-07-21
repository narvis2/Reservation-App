part of 'reservation_fifth_bloc.dart';

@freezed
class ReservationFifthEvent with _$ReservationFifthEvent {
  const factory ReservationFifthEvent.requestCreateReservation({
    required ReservationCreateRequestModel request,
  }) = ReservationFifthRequestCreateReservation;
}
