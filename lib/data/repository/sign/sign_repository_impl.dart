import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:reservation_app/data/datasources/remote/sign/sign_api_service.dart';
import 'package:reservation_app/data/mapper/object_mapper.dart';
import 'package:reservation_app/data/model/sign/phone_auth_check_request.dart';
import 'package:reservation_app/data/model/sign/phone_auth_request.dart';
import 'package:reservation_app/data/model/sign/sign_in_response.dart';
import 'package:reservation_app/data/model/sign/sign_out_request.dart';
import 'package:reservation_app/di/prefs/shared_pref_module.dart';
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/sign/sign_in_request_model.dart';
import 'package:reservation_app/domain/repository/sign/sign_repository.dart';

class SignRepositoryImpl implements SignRepository {
  final SignApiService _signApiService;
  final SharedPreferenceModule _pref;

  SignRepositoryImpl(this._signApiService, this._pref);

  @override
  Future<DataState<bool>> requestSignIn(
    SignInRequestModel request,
  ) async {
    try {
      final response = await _signApiService.requestSignIn(
        request.toSignInRequest(),
      );
      final SignInResponse? resultData = response.data;

      if (response.success && resultData != null) {
        debugPrint("⭐️ [/sign/signIn] API 호출성공 👉 $resultData");
        _pref.saveFcmToken(resultData.token);
        _pref.saveRefreshToken(resultData.refreshToken);
        return DataSuccess(true);
      }

      return DataNetworkError(response.resultMsg);
    } on DioException catch (error) {
      debugPrint("🌹 [/sign/signIn] API DioException 👉 ${error.message}");
      return error.toState();
    }
  }

  @override
  Future<DataState<bool>> requestSignOut() async {
    try {
      final String? accessToken = await _pref.accessToken;

      final response = await _signApiService.requestSignOut(
        SignOutRequest(accessToken: accessToken),
      );

      if (response.success && response.code == 200) {
        return DataSuccess(
          response.resultMsg != null && response.resultMsg == "응답 성공",
        );
      }

      return DataNetworkError(response.resultMsg);
    } on DioException catch (error) {
      debugPrint("🌹 [/sign/signOut] API DioException 👉 ${error.message}");
      return error.toState();
    }
  }

  @override
  Future<DataState<bool>> getAuthenticationNumber(
    PhoneAuthRequest request,
  ) async {
    try {
      final response = await _signApiService.requestAuthPhoneNumber(request);

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
      final response = await _signApiService.requestAuthPhoneNumberCheck(
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
