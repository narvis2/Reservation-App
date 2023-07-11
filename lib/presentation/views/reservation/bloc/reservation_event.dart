part of 'reservation_bloc.dart';

abstract class ReservationEvent extends Equatable {
  const ReservationEvent();
}

// 📌 예약 Process 진행 Event
class ReservationProcessEvent extends ReservationEvent {
  final int processIndex;
  const ReservationProcessEvent({required this.processIndex});

  @override
  List<Object?> get props => [processIndex];

  @override
  bool? get stringify => false;
}

// 📌 예약날짜 선택 Event
class ReservationDatePickerEvent extends ReservationEvent {
  final DateTime? selectedDateTime;
  const ReservationDatePickerEvent({this.selectedDateTime});

  @override
  List<Object?> get props => [selectedDateTime];

  @override
  bool? get stringify => false;
}

// 📌 예약시간 선택 Event
class ReservationRadioTimeSelectEvent extends ReservationEvent {
  final int selectedTime;
  const ReservationRadioTimeSelectEvent({required this.selectedTime});

  @override
  List<Object?> get props => [selectedTime];

  @override
  bool? get stringify => false;
}

// 📌 예약인원 선택 Event
class ReservationSelectedCountEvent extends ReservationEvent {
  final int reservationCount;
  const ReservationSelectedCountEvent({required this.reservationCount});

  @override
  List<Object?> get props => [reservationCount];

  @override
  bool? get stringify => false;
}

// 📌 좌석 선택 Event
class ReservationSelectedSeatsEvent extends ReservationEvent {
  final List<SeatType> selectedSeatList;
  const ReservationSelectedSeatsEvent({required this.selectedSeatList});

  @override
  List<Object?> get props => [selectedSeatList];

  @override
  bool? get stringify => false;
}
