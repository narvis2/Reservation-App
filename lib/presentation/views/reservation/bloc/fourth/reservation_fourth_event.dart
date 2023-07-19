part of 'reservation_fourth_bloc.dart';

abstract class ReservationFourthEvent extends Equatable {
  const ReservationFourthEvent();
}

/// 📌 인증번호를 문자를 보내는 API Event
class ReservationFourthGetPhoneAuthNumberEvent extends ReservationFourthEvent {
  const ReservationFourthGetPhoneAuthNumberEvent();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}
