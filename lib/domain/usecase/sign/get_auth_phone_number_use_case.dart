
import 'package:reservation_app/data/model/sign/phone_auth_request.dart';
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/repository/sign/sign_repository.dart';

class GetAuthPhoneNumberUseCase {
  final SignRepository _signRepository;

  GetAuthPhoneNumberUseCase(this._signRepository);

  Future<DataState<bool>> invoke(PhoneAuthRequest request) {
    return _signRepository.getAuthenticationNumber(request);
  }
}