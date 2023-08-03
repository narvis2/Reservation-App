// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_create_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationCreateRequest _$ReservationCreateRequestFromJson(
        Map<String, dynamic> json) =>
    ReservationCreateRequest(
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      reservationDateTime: json['reservationDateTime'] as String,
      reservationCount: json['reservationCount'] as int,
      timeType: $enumDecode(_$PartTimeEnumMap, json['timeType']),
      isTermAllAgree: json['isTermAllAgree'] as bool,
      isUserValidation: json['isUserValidation'] as bool,
      seat: (json['seat'] as List<dynamic>)
          .map((e) => $enumDecode(_$SeatTypeEnumMap, e))
          .toList(),
      fcmToken: json['fcmToken'] as String?,
    );

Map<String, dynamic> _$ReservationCreateRequestToJson(
        ReservationCreateRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'reservationDateTime': instance.reservationDateTime,
      'reservationCount': instance.reservationCount,
      'timeType': _$PartTimeEnumMap[instance.timeType]!,
      'isTermAllAgree': instance.isTermAllAgree,
      'isUserValidation': instance.isUserValidation,
      'seat': instance.seat.map((e) => _$SeatTypeEnumMap[e]!).toList(),
      'fcmToken': instance.fcmToken,
    };

const _$PartTimeEnumMap = {
  PartTime.partA: 'PART_A',
  PartTime.partB: 'PART_B',
  PartTime.partC: 'PART_C',
};

const _$SeatTypeEnumMap = {
  SeatType.a1: 'A_1',
  SeatType.a2: 'A_2',
  SeatType.a3: 'A_3',
  SeatType.a4: 'A_4',
  SeatType.a5: 'A_5',
  SeatType.a6: 'A_6',
  SeatType.a7: 'A_7',
  SeatType.a8: 'A_8',
  SeatType.b: 'B',
  SeatType.c: 'C',
};
