
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'member_update_fcm_token_request.g.dart';

@JsonSerializable()
class MemberUpdateFcmTokenRequest extends Equatable {
  final String? fcmToken;

  MemberUpdateFcmTokenRequest({
    this.fcmToken,
  });

  factory MemberUpdateFcmTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$MemberUpdateFcmTokenRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MemberUpdateFcmTokenRequestToJson(this);

  @override
  List<Object?> get props => [fcmToken];
}