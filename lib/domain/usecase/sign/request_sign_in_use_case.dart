
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/sign/sign_in_request_model.dart';
import 'package:reservation_app/domain/repository/sign/sign_repository.dart';

class RequestSignInUseCase {
  final SignRepository _signRepository;

  RequestSignInUseCase(this._signRepository);

  Future<DataState<bool>> invoke(SignInRequestModel request) {
    return _signRepository.requestSignIn(request);
  }
}