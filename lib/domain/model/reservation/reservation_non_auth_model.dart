
import 'package:equatable/equatable.dart';
import 'package:reservation_app/domain/model/reservation/enum/part_time.dart';

class ReservationNonAuthModel extends Equatable {
  final int id;
  final String name;
  final String phoneNumber;
  final String reservationDateTime;
  final int reservationCount;
  final List<String> selectedSeats;
  final PartTime partTime;

  ReservationNonAuthModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.reservationDateTime,
    required this.reservationCount,
    required this.selectedSeats,
    required this.partTime,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    phoneNumber,
    reservationDateTime,
    reservationCount,
    selectedSeats,
    partTime,
  ];
}