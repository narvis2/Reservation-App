part of 'reservation_bloc.dart';

class ReservationState extends Equatable {
  final int currentPosition; // 현재 Process Position
  final DateTime? dateTime; // 선택된 날짜
  final int selectedTime; // 선택된 시간 (PartTime)
  final int selectedCount; // 선택된 예약인원수
  final List<SeatType> selectedSeats; // 선택된 좌석 List

  const ReservationState({
    required this.currentPosition,
    this.dateTime,
    required this.selectedTime,
    required this.selectedCount,
    required this.selectedSeats,
  });

  factory ReservationState.initial() {
    return ReservationState(
      currentPosition: 0,
      dateTime: null,
      selectedTime: 0,
      selectedCount: 0,
      selectedSeats: [],
    );
  }

  ReservationState copyWith({
    int? currentPosition,
    DateTime? dateTime,
    int? selectedTime,
    int? selectedCount,
    List<SeatType>? selectedSeats,
  }) {
    return ReservationState(
      currentPosition: currentPosition ?? this.currentPosition,
      dateTime: dateTime ?? this.dateTime,
      selectedTime: selectedTime ?? this.selectedTime,
      selectedCount: selectedCount ?? this.selectedCount,
      selectedSeats: selectedSeats ?? this.selectedSeats,
    );
  }

  @override
  List<Object?> get props => [
        currentPosition,
        dateTime,
        selectedTime,
        selectedCount,
        selectedSeats,
      ];

  @override
  bool? get stringify => true;
}
