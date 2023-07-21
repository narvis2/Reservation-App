part of 'reservation_fourth_bloc.dart';

@freezed
class ReservationFourthEvent with _$ReservationFourthEvent {
  const factory ReservationFourthEvent.requestPhoneAuthNumber({
    required String name,
    required String phoneNumber,
  }) = ReservationFourthRequestPhoneAuthNumber;

  const factory ReservationFourthEvent.requestPhoneAuthNumberCheck({
    required String authCode,
  }) = ReservationFourthRequestPhoneAuthCheck;
}