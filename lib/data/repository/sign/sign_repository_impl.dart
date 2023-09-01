import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:reservation_app/data/datasource/remote_data_source.dart';
import 'package:reservation_app/data/mapper/object_mapper.dart';
import 'package:reservation_app/data/model/sign/phone_auth_check_request.dart';
import 'package:reservation_app/data/model/sign/phone_auth_request.dart';
import 'package:reservation_app/data/model/sign/sign_in_response.dart';
import 'package:reservation_app/di/prefs/shared_pref_module.dart';
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/sign/request/sign_out_request_model.dart';
import 'package:reservation_app/domain/model/sign/sign_in_request_model.dart';
import 'package:reservation_app/domain/repository/sign/sign_repository.dart';

class SignRepositoryImpl implements SignRepository {
  final RemoteDataSource _remoteDataSource;
  final SharedPreferenceModule _pref;

  SignRepositoryImpl(this._remoteDataSource, this._pref);

  @override
  Future<DataState<bool>> requestSignIn(
    SignInRequestModel request,
  ) async {
    try {
      final response = await _remoteDataSource.requestSignIn(
        request.toSignInRequest(),
      );
      final SignInResponse? resultData = response.data;

      if (response.success && resultData != null) {
        debugPrint("⭐️ [/sign/signIn] API 호출성공 👉 $resultData");
        await _pref.saveJWTToken(resultData.token);
        await _pref.saveRefreshToken(resultData.refreshToken);
        return DataSuccess(true);
      }

      return DataNetworkError(response.resultMsg);
    } on DioException catch (error) {
      debugPrint("🌹 [/sign/signIn] API DioException 👉 ${error.message}");
      final Map<String, dynamic>? responseErrorData = error.response?.data;

      if (responseErrorData != null) {
        final String? resultMsg = responseErrorData['resultMsg'];
        if (resultMsg != null) {
          return DataNetworkError(resultMsg);
        }
      }

      return DataError(error);
    }
  }

  @override
  Future<DataState<bool>> requestSignOut(SignOutRequestModel request) async {
    try {
      final response = await _remoteDataSource.requestSignOut(
        request.toSignOutRequestModel(),
      );

      if (response.success && response.code == 200) {
        await Future.wait([
          _pref.clearJWTToken(),
          _pref.clearRefreshToken(),
          _pref.clearIsAutoLogin(),
          _pref.clearEnablePush(),
        ]);

        return DataSuccess(
          response.resultMsg != null && response.resultMsg == "응답 성공",
        );
      }

      return DataNetworkError(response.resultMsg);
    } on DioException catch (error) {
      debugPrint("🌹 [/sign/signOut] API DioException 👉 ${error.message}");
      final Map<String, dynamic>? responseErrorData = error.response?.data;

      if (responseErrorData != null) {
        final String? resultMsg = responseErrorData['resultMsg'];
        if (resultMsg != null) {
          return DataNetworkError(resultMsg);
        }
      }

      return DataError(error);
    }
  }

  @override
  Future<DataState<bool>> getAuthenticationNumber(
    PhoneAuthRequest request,
  ) async {
    try {
      final response = await _remoteDataSource.requestAuthPhoneNumber(request);

      if (response.success && response.code == 200) {
        return DataSuccess(
          response.resultMsg != null && response.resultMsg == "응답 성공",
        );
      }

      return DataNetworkError(response.resultMsg);
    } on DioException catch (error) {
      debugPrint("🌹 [/sign/phone] API DioException 👉 ${error.message}");
      return DataError(error);
    }
  }

  @override
  Future<DataState<bool>> getAuthenticationNumberCheck(
    PhoneAuthCheckRequest request,
  ) async {
    try {
      final response = await _remoteDataSource.requestAuthPhoneNumberCheck(
        request,
      );

      if (response.success && response.code == 200) {
        return DataSuccess(
          response.resultMsg != null && response.resultMsg == "응답 성공",
        );
      }

      return DataNetworkError(response.resultMsg);
    } on DioException catch (error) {
      debugPrint("🌹 [/sign/phone/check] API DioException 👉 ${error.message}");
      return DataError(error);
    }
  }
}
