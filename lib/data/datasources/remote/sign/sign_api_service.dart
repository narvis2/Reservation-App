
import 'package:dio/dio.dart';
import 'package:reservation_app/data/common/response/response_base.dart';
import 'package:reservation_app/data/model/sign/phone_auth_request.dart';
import 'package:retrofit/http.dart';

part 'sign_api_service.g.dart';

@RestApi()
abstract class SignApiService {
  factory SignApiService(Dio dio, {String? baseUrl}) = _SignApiService;

  @POST("/sign/phone")
  Future<BaseResponse> requestAuthPhoneNumber(
    @Body() PhoneAuthRequest request
  );
}