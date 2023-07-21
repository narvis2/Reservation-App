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

// 📌 실제 예약 인원수 Add Event
class ReservationInputRealUserCountAddEvent extends ReservationEvent {
  const ReservationInputRealUserCountAddEvent();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}

// 📌 실제 예약 인원수 Minus Event
class ReservationInputRealUserCountMinusEvent extends ReservationEvent {
  const ReservationInputRealUserCountMinusEvent();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}

// 📌 약관동의 - 전체 동의했을 경우 Event
class ReservationTermAllAgreeEvent extends ReservationEvent {
  final bool isAllSelected;

  const ReservationTermAllAgreeEvent({required this.isAllSelected});

  @override
  List<Object?> get props => [isAllSelected];

  @override
  bool? get stringify => false;
}

class ReservationUserAuthEvent extends ReservationEvent {
  final String authName;
  final String authPhoneNumber;
  final bool isCheckedAuth;
  const ReservationUserAuthEvent({
    required this.authName,
    required this.authPhoneNumber,
    required this.isCheckedAuth,
  });

  @override
  List<Object?> get props => [
        authName,
        authPhoneNumber,
        isCheckedAuth,
      ];

  @override
  bool? get stringify => false;
}
