part of 'reservation_second_bloc.dart';

abstract class ReservationSecondEvent extends Equatable {
  const ReservationSecondEvent();
}

class ReservationSecondEventGetSeatList extends ReservationSecondEvent {
  final int partTime;
  final DateTime? date;
  final int count;

  const ReservationSecondEventGetSeatList({
    required this.partTime,
    required this.date,
    required this.count,
  });

  @override
  List<Object?> get props => [partTime, date, count];
}

class ReservationSecondEventSelectedSeats extends ReservationSecondEvent {
  final int currentItem;
  final int selectedLimitUserCount;

  const ReservationSecondEventSelectedSeats({
    required this.currentItem,
    required this.selectedLimitUserCount,
  });

  @override
  List<Object?> get props => [currentItem, selectedLimitUserCount];
}
