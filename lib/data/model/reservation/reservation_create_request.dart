import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:reservation_app/domain/model/reservation/enum/part_time.dart';
import 'package:reservation_app/domain/model/seat/enum/seat_type.dart';

part 'reservation_create_request.g.dart';

@JsonSerializable()
class ReservationCreateRequest extends Equatable {
  final String name;
  final String phoneNumber;
  final String reservationDateTime;
  final int reservationCount;
  final PartTime timeType;
  final bool isTermAllAgree;
  final bool isUserValidation;
  final List<SeatType> seat;
  final String? fcmToken;

  const ReservationCreateRequest({
    required this.name,
    required this.phoneNumber,
    required this.reservationDateTime,
    required this.reservationCount,
    required this.timeType,
    required this.isTermAllAgree,
    required this.isUserValidation,
    required this.seat,
    this.fcmToken,
  });

  factory ReservationCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$ReservationCreateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationCreateRequestToJson(this);

  @override
  List<Object?> get props => [
        name,
        phoneNumber,
        reservationDateTime,
        reservationCount,
        timeType,
        isTermAllAgree,
        seat,
        fcmToken,
      ];

  @override
  bool? get stringify => true;
}
