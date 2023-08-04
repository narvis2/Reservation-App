import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/member/member_model.dart';

abstract class MemberRepository {
  Future<DataState<MemberModel>> getMyUserInfo();

  Future<DataState<bool>> requestUpdateFcmToken();
}
