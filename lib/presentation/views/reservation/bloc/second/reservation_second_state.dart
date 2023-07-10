part of 'reservation_second_bloc.dart';

abstract class ReservationSecondState extends Equatable {
  const ReservationSecondState();
}

class ReservationSecondInitial extends ReservationSecondState {
  const ReservationSecondInitial();

  @override
  List<Object?> get props => [];
}

class ReservationSecondStateLoading extends ReservationSecondState {
  const ReservationSecondStateLoading();

  @override
  List<Object?> get props => [];
}

class ReservationSecondStateSeatList extends ReservationSecondState {
  final List<ReservationTargetPartTimeSeatModel> seatLists;

  const ReservationSecondStateSeatList({required this.seatLists});

  @override
  List<Object?> get props => [seatLists];
}

class ReservationSecondStateFailed extends ReservationSecondState {
  final String message;

  const ReservationSecondStateFailed({required this.message});

  @override
  List<Object?> get props => [message];
}

class ReservationSecondStateNoSelectedDateTime extends ReservationSecondState {
  const ReservationSecondStateNoSelectedDateTime();

  @override
  List<Object?> get props => [];
}

