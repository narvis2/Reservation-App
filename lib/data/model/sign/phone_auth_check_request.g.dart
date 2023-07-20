// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_auth_check_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneAuthCheckRequest _$PhoneAuthCheckRequestFromJson(
        Map<String, dynamic> json) =>
    PhoneAuthCheckRequest(
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      authenticationCode: json['authenticationCode'] as String,
    );

Map<String, dynamic> _$PhoneAuthCheckRequestToJson(
        PhoneAuthCheckRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'authenticationCode': instance.authenticationCode,
    };
