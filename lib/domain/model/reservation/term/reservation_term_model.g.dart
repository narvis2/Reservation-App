// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_term_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationTermModel _$ReservationTermModelFromJson(
        Map<String, dynamic> json) =>
    ReservationTermModel(
      title: json['title'] as String,
      isChecked: json['isChecked'] as bool,
    );

Map<String, dynamic> _$ReservationTermModelToJson(
        ReservationTermModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'isChecked': instance.isChecked,
    };
