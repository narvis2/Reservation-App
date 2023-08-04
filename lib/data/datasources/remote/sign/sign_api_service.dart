import 'package:dio/dio.dart';
import 'package:reservation_app/data/common/response/response_base.dart';
import 'package:reservation_app/data/model/sign/phone_auth_check_request.dart';
import 'package:reservation_app/data/model/sign/phone_auth_request.dart';
import 'package:reservation_app/data/model/sign/sign_in_request.dart';
import 'package:reservation_app/data/model/sign/sign_in_response.dart';
import 'package:reservation_app/data/model/sign/sign_out_request.dart';
import 'package:retrofit/http.dart';

part 'sign_api_service.g.dart';

@RestApi()
abstract class SignApiService {
  factory SignApiService(Dio dio, {String? baseUrl}) = _SignApiService;

  @POST("/sign/signIn")
  Future<BaseResponse<SignInResponse>> requestSignIn(
    @Body() SignInRequest request,
  );

  @POST("/sign/signOut")
  Future<BaseResponse> requestSignOut(
    @Body() SignOutRequest request,
  );

  @POST("/sign/phone")
  Future<BaseResponse> requestAuthPhoneNumber(
    @Body() PhoneAuthRequest request,
  );

  @POST("/sign/phone/check")
  Future<BaseResponse> requestAuthPhoneNumberCheck(
    @Body() PhoneAuthCheckRequest request,
  );
}
