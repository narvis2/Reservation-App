part of 'reservation_bloc.dart';

class ReservationState extends Equatable {
  final int currentPosition; // 현재 Process Position
  final DateTime? dateTime; // 선택된 날짜
  final int selectedTime; // 선택된 시간 (PartTime)
  final int selectedCount; // 선택된 예약인원수 [범위]
  final List<SeatType> selectedSeats; // 선택된 좌석 List
  final int realUserCount; // 선택된 예약인원수 [실제 예약인원수]
  final bool termIsAllAgree; // 약관 동의 - 전체 동의 했는지 여부
  final bool isCheckedAuth; // 본인 인증 여부

  const ReservationState({
    required this.currentPosition,
    this.dateTime,
    required this.selectedTime,
    required this.selectedCount,
    required this.selectedSeats,
    required this.realUserCount,
    required this.termIsAllAgree,
    required this.isCheckedAuth,
  });

  factory ReservationState.initial() {
    return ReservationState(
      currentPosition: 0,
      dateTime: null,
      selectedTime: 0,
      selectedCount: 0,
      selectedSeats: [],
      realUserCount: 1,
      termIsAllAgree: false,
      isCheckedAuth: false,
    );
  }

  ReservationState copyWith({
    int? currentPosition,
    DateTime? dateTime,
    int? selectedTime,
    int? selectedCount,
    List<SeatType>? selectedSeats,
    int? realUserCount,
    bool? termIsAllAgree,
    bool? isCheckedAuth,
  }) {
    return ReservationState(
      currentPosition: currentPosition ?? this.currentPosition,
      dateTime: dateTime ?? this.dateTime,
      selectedTime: selectedTime ?? this.selectedTime,
      selectedCount: selectedCount ?? this.selectedCount,
      selectedSeats: selectedSeats ?? this.selectedSeats,
      realUserCount: realUserCount ?? this.realUserCount,
      termIsAllAgree: termIsAllAgree ?? this.termIsAllAgree,
      isCheckedAuth: isCheckedAuth ?? this.isCheckedAuth,
    );
  }

  @override
  List<Object?> get props => [
        currentPosition,
        dateTime,
        selectedTime,
        selectedCount,
        selectedSeats,
        realUserCount,
        termIsAllAgree,
        isCheckedAuth,
      ];

  @override
  bool? get stringify => true;
}
