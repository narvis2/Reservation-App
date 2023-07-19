
import 'package:reservation_app/data/model/sign/phone_auth_request.dart';
import 'package:reservation_app/domain/model/base/data_state.dart';

abstract class SignRepository {
  Future<DataState<bool>> getAuthenticationNumber(PhoneAuthRequest request);
}