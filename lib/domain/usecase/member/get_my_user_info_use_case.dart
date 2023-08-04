
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/member/member_model.dart';
import 'package:reservation_app/domain/repository/member/member_repository.dart';

class GetMyUserInfoUseCase {
  final MemberRepository _memberRepository;

  GetMyUserInfoUseCase(this._memberRepository);

  Future<DataState<MemberModel>> invoke() {
    return _memberRepository.getMyUserInfo();
  }
}