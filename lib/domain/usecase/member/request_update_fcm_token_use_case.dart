
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/repository/member/member_repository.dart';

class RequestUpdateFcmTokenUseCase {
  final MemberRepository _memberRepository;

  RequestUpdateFcmTokenUseCase(this._memberRepository);

  Future<DataState<bool>> invoke() {
    return _memberRepository.requestUpdateFcmToken();
  }
}