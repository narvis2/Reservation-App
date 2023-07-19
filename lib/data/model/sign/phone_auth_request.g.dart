// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_auth_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneAuthRequest _$PhoneAuthRequestFromJson(Map<String, dynamic> json) =>
    PhoneAuthRequest(
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$PhoneAuthRequestToJson(PhoneAuthRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
    };
