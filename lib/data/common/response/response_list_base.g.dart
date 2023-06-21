// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_list_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseListResponse<T> _$BaseListResponseFromJson<T extends Equatable>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseListResponse<T>(
      success: json['success'] as bool,
      resultMsg: json['resultMsg'] as String?,
      code: json['code'] as int,
      data: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList(),
    );

Map<String, dynamic> _$BaseListResponseToJson<T extends Equatable>(
  BaseListResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'success': instance.success,
      'resultMsg': instance.resultMsg,
      'code': instance.code,
      'data': instance.data?.map(toJsonT).toList(),
    };
