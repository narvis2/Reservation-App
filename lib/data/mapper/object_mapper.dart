import 'package:dio/dio.dart';
import 'package:reservation_app/data/model/member/member_info_response.dart';
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/member/member_model.dart';

extension MemberInfoResponseExtension on MemberInfoResponse {
  MemberModel toMemberModel() {
    return MemberModel(
      id: id,
      email: email,
      role: roleType.name,
    );
  }
}

extension DioExceptionExtension on DioException {
  dynamic toState() {
    final Map<String, dynamic>? responseErrorData = response?.data;

    if (responseErrorData != null) {
      final String? resultMsg = responseErrorData['resultMsg'];
      if (resultMsg != null) {
        return DataNetworkError(resultMsg);
      }
    }

    return DataError(this);
  }
}