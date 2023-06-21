// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T> _$BaseResponseFromJson<T extends Equatable>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseResponse<T>(
      success: json['success'] as bool,
      resultMsg: json['resultMsg'] as String?,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      code: json['code'] as int,
    );

Map<String, dynamic> _$BaseResponseToJson<T extends Equatable>(
  BaseResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'success': instance.success,
      'resultMsg': instance.resultMsg,
      'code': instance.code,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
