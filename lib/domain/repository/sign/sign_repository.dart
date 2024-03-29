
import 'package:reservation_app/data/model/sign/phone_auth_check_request.dart';
import 'package:reservation_app/data/model/sign/phone_auth_request.dart';
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/sign/request/sign_out_request_model.dart';
import 'package:reservation_app/domain/model/sign/sign_in_request_model.dart';

abstract class SignRepository {

  Future<DataState<bool>> requestSignIn(SignInRequestModel request);

  Future<DataState<bool>> requestSignOut(SignOutRequestModel request);

  Future<DataState<bool>> getAuthenticationNumber(PhoneAuthRequest request);

  Future<DataState<bool>> getAuthenticationNumberCheck(PhoneAuthCheckRequest request);
}