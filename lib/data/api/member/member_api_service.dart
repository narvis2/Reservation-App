
import 'package:dio/dio.dart';
import 'package:reservation_app/data/common/response/response_base.dart';
import 'package:reservation_app/data/model/member/member_info_response.dart';
import 'package:reservation_app/data/model/member/member_update_fcm_token_request.dart';
import 'package:retrofit/http.dart';

part 'member_api_service.g.dart';

@RestApi()
abstract class MemberApiService {
  factory MemberApiService(Dio dio, {String? baseUrl}) = _MemberApiService;

  /// 📌 로그인 되어있는 나의 정보 가져오기
  @GET("/member")
  Future<BaseResponse<MemberInfoResponse>> requestMemberInfo();

  /// 📌 fcmToken Update
  @PUT("/member/fcm-token")
  Future<BaseResponse> requestMemberUpdateFcmToken(
    @Body() MemberUpdateFcmTokenRequest request
  );
}