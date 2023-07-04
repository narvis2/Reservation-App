part of 'reservation_bloc.dart';

abstract class ReservationState extends Equatable {
  const ReservationState();
}

class ReservationInitial extends ReservationState {
  @override
  List<Object> get props => [];
}

class ReservationCountState extends ReservationState {
  final int count;

  const ReservationCountState({
    this.count = 0,
  });

  ReservationCountState copyWith({
    int? count,
  }) {
    return ReservationCountState(
      count: count ?? this.count,
    );
  }

  @override
  List<Object?> get props => [count];
}

