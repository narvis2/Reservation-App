
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/repository/sign/sign_repository.dart';

class RequestSignOutUseCase {
  final SignRepository _signRepository;

  RequestSignOutUseCase(this._signRepository);

  Future<DataState<bool>> invoke() {
    return _signRepository.requestSignOut();
  }
}