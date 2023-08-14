// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_filter_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReservationFilterListResponse _$$_ReservationFilterListResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ReservationFilterListResponse(
      totalCount: json['totalCount'] as int,
      totalPages: json['totalPages'] as int,
      hasNext: json['hasNext'] as bool,
      reservationList: (json['reservationList'] as List<dynamic>)
          .map((e) =>
              ReservationFilterResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ReservationFilterListResponseToJson(
        _$_ReservationFilterListResponse instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'totalPages': instance.totalPages,
      'hasNext': instance.hasNext,
      'reservationList': instance.reservationList,
    };
