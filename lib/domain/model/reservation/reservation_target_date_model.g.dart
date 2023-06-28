// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_target_date_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationTargetDateModel _$ReservationTargetDateModelFromJson(
        Map<String, dynamic> json) =>
    ReservationTargetDateModel(
      partTime: json['partTime'] as String,
      remainsSeatList: (json['remainsSeatList'] as List<dynamic>)
          .map((e) => PartTimeSeatList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReservationTargetDateModelToJson(
        ReservationTargetDateModel instance) =>
    <String, dynamic>{
      'partTime': instance.partTime,
      'remainsSeatList': instance.remainsSeatList,
    };
