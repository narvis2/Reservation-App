
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_out_request.g.dart';

@JsonSerializable()
class SignOutRequest extends Equatable {
  final String? accessToken;

  SignOutRequest({this.accessToken});

  factory SignOutRequest.fromJson(Map<String, dynamic> json) =>
      _$SignOutRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignOutRequestToJson(this);

  @override
  List<Object?> get props => [accessToken];
}