import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response_base.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  bool success;
  String? resultMsg;
  int code;
  T? data;

  BaseResponse({
    required this.success,
    required this.resultMsg,
    required this.data,
    required this.code,
  });

  factory BaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$BaseResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);
}
