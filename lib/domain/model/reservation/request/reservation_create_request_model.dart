import 'package:equatable/equatable.dart';
import 'package:reservation_app/domain/model/seat/enum/seat_type.dart';

class ReservationCreateRequestModel extends Equatable {
  final String name;
  final String phoneNumber;
  final DateTime reservationDateTime;
  final int reservationCount;
  final int timeType;
  final bool isTermAllAgree;
  final bool isUserValidation;
  final List<SeatType> seat;

  const ReservationCreateRequestModel({
    required this.name,
    required this.phoneNumber,
    required this.reservationDateTime,
    required this.reservationCount,
    required this.timeType,
    required this.isTermAllAgree,
    required this.isUserValidation,
    required this.seat,
  });

  @override
  List<Object?> get props => [
    name,
    phoneNumber,
    reservationDateTime,
    reservationCount,
    timeType,
    isTermAllAgree,
    isUserValidation,
    seat,
  ];

  @override
  bool? get stringify => false;
}
