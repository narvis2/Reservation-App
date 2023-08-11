// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_non_auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationNonAuthResponse _$ReservationNonAuthResponseFromJson(
        Map<String, dynamic> json) =>
    ReservationNonAuthResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      reservationDateTime: json['reservationDateTime'] as String,
      reservationCount: json['reservationCount'] as int,
      selectedSeats:
          (json['seats'] as List<dynamic>).map((e) => e as String).toList(),
      partTime: $enumDecode(_$PartTimeEnumMap, json['timeType']),
    );

Map<String, dynamic> _$ReservationNonAuthResponseToJson(
        ReservationNonAuthResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'reservationDateTime': instance.reservationDateTime,
      'reservationCount': instance.reservationCount,
      'seats': instance.selectedSeats,
      'timeType': _$PartTimeEnumMap[instance.partTime]!,
    };

const _$PartTimeEnumMap = {
  PartTime.partA: 'PART_A',
  PartTime.partB: 'PART_B',
  PartTime.partC: 'PART_C',
};
