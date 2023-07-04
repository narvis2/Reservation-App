part of 'reservation_bloc.dart';

abstract class ReservationEvent extends Equatable {
  const ReservationEvent();
}

class ReservationCountPlusEvent extends ReservationEvent {
  const ReservationCountPlusEvent();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}

class ReservationCountMinusEvent extends ReservationEvent {
  const ReservationCountMinusEvent();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}
