import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:reservation_app/data/datasource/remote_data_source.dart';
import 'package:reservation_app/data/mapper/object_mapper.dart';
import 'package:reservation_app/data/model/member/member_info_response.dart';
import 'package:reservation_app/data/model/member/member_update_fcm_token_request.dart';
import 'package:reservation_app/di/prefs/shared_pref_module.dart';
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/member/member_model.dart';
import 'package:reservation_app/domain/repository/member/member_repository.dart';

class MemberRepositoryImpl implements MemberRepository {
  final RemoteDataSource _remoteDataSource;
  final SharedPreferenceModule _pref;

  MemberRepositoryImpl(
    this._remoteDataSource,
    this._pref,
  );

  @override
  Future<DataState<MemberModel>> getMyUserInfo() async {
    try {
      final response = await _remoteDataSource.requestMemberInfo();
      final MemberInfoResponse? resultData = response.data;

      if (response.success && resultData != null) {
        debugPrint("📌 getMyUserInfo 원본 데이터 👉 $resultData");
        return DataSuccess(resultData.toMemberModel());
      }

      return DataNetworkError(response.resultMsg);
    } on DioException catch (error) {
      debugPrint("🌹 [/member] DioException 👉 ${error.message}");
      return error.toState();
    }
  }

  @override
  Future<DataState<bool>> requestUpdateFcmToken() async {
    try {
      final String? fcmToken = await _pref.fcmToken;

      final response = await _remoteDataSource.requestMemberUpdateFcmToken(
        MemberUpdateFcmTokenRequest(fcmToken: fcmToken),
      );

      if (response.success && response.code == 200) {
        return DataSuccess(
          response.resultMsg != null && response.resultMsg == "응답 성공",
        );
      }

      return DataNetworkError(response.resultMsg);
    } on DioException catch (error) {
      debugPrint("🌹 [/member/fcm-token] DioException 👉 ${error.message}");
      return error.toState();
    }
  }
}
