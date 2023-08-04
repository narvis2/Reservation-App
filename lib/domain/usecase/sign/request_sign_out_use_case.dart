
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/sign/sign_out_request_model.dart';
import 'package:reservation_app/domain/repository/sign/sign_repository.dart';

class RequestSignOutUseCase {
  final SignRepository _signRepository;

  RequestSignOutUseCase(this._signRepository);

  Future<DataState<bool>> invoke(SignOutRequestModel request) {
    return _signRepository.requestSignOut(request);
  }
}