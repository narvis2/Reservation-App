import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'phone_auth_check_request.g.dart';

@JsonSerializable()
class PhoneAuthCheckRequest extends Equatable {
  final String name;
  final String phoneNumber;
  final String authenticationCode;

  const PhoneAuthCheckRequest({
    required this.name,
    required this.phoneNumber,
    required this.authenticationCode,
  });

  factory PhoneAuthCheckRequest.fromJson(Map<String, dynamic> json) => _$PhoneAuthCheckRequestFromJson(json);
  Map<String, dynamic> toJson() => _$PhoneAuthCheckRequestToJson(this);

  @override
  List<Object?> get props => [
    name,
    phoneNumber,
    authenticationCode,
  ];

  @override
  bool? get stringify => false;
}