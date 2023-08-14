import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:reservation_app/domain/model/reservation/enum/part_time.dart';

part 'reservation_non_auth_response.g.dart';

@JsonSerializable()
class ReservationNonAuthResponse extends Equatable {
  final int id;
  final String name;
  final String phoneNumber;
  final String reservationDateTime;
  final int reservationCount;
  @JsonKey(name: 'seats')
  final List<String> selectedSeats;
  @JsonKey(name: 'timeType')
  final PartTime partTime;

  ReservationNonAuthResponse({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.reservationDateTime,
    required this.reservationCount,
    required this.selectedSeats,
    required this.partTime,
  });

  factory ReservationNonAuthResponse.fromJson(Map<String, dynamic> json) =>
      _$ReservationNonAuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationNonAuthResponseToJson(this);

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
