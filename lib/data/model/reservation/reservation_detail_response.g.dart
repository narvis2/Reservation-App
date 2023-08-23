// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReservationDetailResponse _$$_ReservationDetailResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ReservationDetailResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      reservationDateTime: json['reservationDateTime'] as String,
      reservationCount: json['reservationCount'] as int,
      isTermAllAgree: json['isTermAllAgree'] as bool,
      isUserValidation: json['isUserValidation'] as bool,
      seats: (json['seats'] as List<dynamic>)
          .map((e) => $enumDecode(_$SeatTypeEnumMap, e))
          .toList(),
      certificationNumber: json['certificationNumber'] as String?,
    );

Map<String, dynamic> _$$_ReservationDetailResponseToJson(
        _$_ReservationDetailResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'reservationDateTime': instance.reservationDateTime,
      'reservationCount': instance.reservationCount,
      'isTermAllAgree': instance.isTermAllAgree,
      'isUserValidation': instance.isUserValidation,
      'seats': instance.seats.map((e) => _$SeatTypeEnumMap[e]!).toList(),
      'certificationNumber': instance.certificationNumber,
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
