import 'dart:async';

import 'package:dio/dio.dart';
import 'package:reservation_app/data/model/member/member_info_response.dart';
import 'package:reservation_app/data/model/sign/sign_in_request.dart';
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/member/member_model.dart';
import 'package:reservation_app/domain/model/sign/sign_in_request_model.dart';

extension MemberInfoResponseExtension on MemberInfoResponse {
  MemberModel toMemberModel() {
    return MemberModel(
      id: id,
      email: email,
      role: roleType.name,
    );
  }
}

extension SignInRequestModelExtension on SignInRequestModel {
  SignInRequest toSignInRequest() {
    return SignInRequest(
      email: email,
      password: password,
    );
  }
}
