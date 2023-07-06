part of 'reservation_bloc.dart';

abstract class ReservationState extends Equatable {
  final int currentPosition;
  const ReservationState({this.currentPosition = 0});
}

class ReservationInitial extends ReservationState {
  const ReservationInitial();

  @override
  List<Object> get props => [];
}

class ReservationProcessState extends ReservationState {
  final DateTime? dateTime;
  final int selectedTime;
  final int selectedCount;

  const ReservationProcessState({
    super.currentPosition,
    this.dateTime,
    required this.selectedTime,
    required this.selectedCount,
  });

  factory ReservationProcessState.initial() {
    return ReservationProcessState(
      currentPosition: 0,
      dateTime: null,
      selectedTime: 0,
      selectedCount: 0,
    );
  }

  ReservationProcessState copyWith({
    int? currentPosition,
    DateTime? dateTime,
    int? selectedTime,
    int? selectedCount,
}) {
    return ReservationProcessState(
      currentPosition: currentPosition ?? this.currentPosition,
      dateTime: dateTime ?? this.dateTime,
      selectedTime: selectedTime ?? this.selectedTime,
      selectedCount: selectedCount ?? this.selectedCount,
    );
  }

  @override
  List<Object?> get props => [
    currentPosition,
    dateTime,
    selectedTime,
    selectedCount,
  ];
}