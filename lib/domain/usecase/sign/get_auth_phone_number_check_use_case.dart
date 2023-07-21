import 'package:reservation_app/data/model/sign/phone_auth_check_request.dart';
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/repository/sign/sign_repository.dart';

class GetAuthPhoneNumberCheckUseCase {
  final SignRepository _signRepository;

  GetAuthPhoneNumberCheckUseCase(this._signRepository);

  Future<DataState<bool>> invoke(PhoneAuthCheckRequest request) {
    return _signRepository.getAuthenticationNumberCheck(request);
  }
}