import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:reservation_app/data/datasources/remote/sign/sign_api_service.dart';
import 'package:reservation_app/data/model/sign/phone_auth_check_request.dart';
import 'package:reservation_app/data/model/sign/phone_auth_request.dart';
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/repository/sign/sign_repository.dart';

class SignRepositoryImpl implements SignRepository {
  final SignApiService _signApiService;

  SignRepositoryImpl(this._signApiService);

  @override
  Future<DataState<bool>> getAuthenticationNumber(
    PhoneAuthRequest request,
  ) async {
    try {
      final response = await _signApiService.requestAuthPhoneNumber(request);

      if (response.success && response.code == 200) {
        if (response.resultMsg != null && response.resultMsg == "응답 성공") {
          return DataSuccess(true);
        }

        return DataSuccess(false);
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
      final response = await _signApiService.requestAuthPhoneNumberCheck(request);

      if (response.success && response.code == 200) {
        if (response.resultMsg != null && response.resultMsg == "응답 성공") {
          return DataSuccess(true);
        }

        return DataSuccess(false);
      }

      return DataNetworkError(response.resultMsg);
    } on DioException catch (error) {
      debugPrint("🌹 [/sign/phone/check] API DioException 👉 ${error.message}");
      return DataError(error);
    }
  }
}
