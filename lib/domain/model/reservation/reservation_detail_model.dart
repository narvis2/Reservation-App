
import 'package:equatable/equatable.dart';
import 'package:reservation_app/domain/model/seat/enum/seat_type.dart';

class ReservationDetailModel extends Equatable {
  final int id;
  final String name;
  final String phoneNumber;
  final String reservationDateTime;
  final int reservationCount;
  final bool isTermAllAgree;
  final bool isUserValidation;
  final List<SeatType> seats;
  final String? certificationNumber;

  ReservationDetailModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.reservationDateTime,
    required this.reservationCount,
    required this.isTermAllAgree,
    required this.isUserValidation,
    required this.seats,
    this.certificationNumber
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    name,
    phoneNumber,
    reservationDateTime,
    reservationCount,
    isTermAllAgree,
    isUserValidation,
    seats,
    certificationNumber,
  ];

  @override
  bool? get stringify => true;
}