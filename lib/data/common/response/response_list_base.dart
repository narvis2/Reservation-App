import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response_list_base.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseListResponse<T extends Equatable> {
  bool success;
  String? resultMsg;
  int code;
  List<T>? data;

  BaseListResponse(
      {required this.success,
      required this.resultMsg,
      required this.code,
      this.data});

  factory BaseListResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$BaseListResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BaseListResponseToJson(this, toJsonT);
}
