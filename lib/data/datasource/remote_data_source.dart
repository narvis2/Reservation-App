import 'package:reservation_app/data/common/response/response_base.dart';
import 'package:reservation_app/data/common/response/response_list_base.dart';
import 'package:reservation_app/data/model/member/member_info_response.dart';
import 'package:reservation_app/data/model/member/member_update_fcm_token_request.dart';
import 'package:reservation_app/data/model/reservation/page/reservation_filter_list_response.dart';
import 'package:reservation_app/data/model/reservation/reservation_approval_check_request.dart';
import 'package:reservation_app/data/model/reservation/reservation_create_request.dart';
import 'package:reservation_app/data/model/reservation/reservation_non_auth_response.dart';
import 'package:reservation_app/data/model/reservation/reservation_target_date_response.dart';
import 'package:reservation_app/data/model/sign/phone_auth_check_request.dart';
import 'package:reservation_app/data/model/sign/phone_auth_request.dart';
import 'package:reservation_app/data/model/sign/sign_in_request.dart';
import 'package:reservation_app/data/model/sign/sign_in_response.dart';
import 'package:reservation_app/domain/model/banner/banner_image_model.dart';
import 'package:reservation_app/domain/model/notice/notice_model.dart';
import 'package:reservation_app/domain/model/reservation/enum/part_time.dart';
import 'package:reservation_app/domain/model/reservation/enum/reservation_filter_type.dart';
import 'package:reservation_app/domain/model/seat/enum/seat_type.dart';

abstract class RemoteDataSource {
  // Banner
  Future<BaseListResponse<BannerImageModel>> getAllBannerImage();

  // Member
  Future<BaseResponse<MemberInfoResponse>> requestMemberInfo();

  Future<BaseResponse> requestMemberUpdateFcmToken(
    MemberUpdateFcmTokenRequest request,
  );

  // Notice
  Future<BaseListResponse<NoticeModel>> getAllNoticeList();

  // Reservation
  Future<BaseListResponse<ReservationTargetDateResponse>>
      getTargetDateReservation(
    String date,
  );

  Future<BaseListResponse<SeatType>> getTargetPartTimeDateReservation(
    PartTime partTime,
    String date,
  );

  Future<BaseResponse> requestCreateReservation(
    ReservationCreateRequest request,
  );

  Future<BaseListResponse<ReservationNonAuthResponse>>
      getNonAuthReservationList();

  Future<BaseResponse<ReservationFilterListResponse>>
      requestReservationFilterList(
    int page,
    int limit,
    ReservationFilterType filterType,
  );

  Future<BaseResponse> requestApprovalCheck(
    int id,
    ReservationApprovalCheckRequest request,
  );

  // Sign
  Future<BaseResponse<SignInResponse>> requestSignIn(
    SignInRequest request,
  );

  Future<BaseResponse> requestSignOut();

  Future<BaseResponse> requestAuthPhoneNumber(
    PhoneAuthRequest request,
  );

  Future<BaseResponse> requestAuthPhoneNumberCheck(
    PhoneAuthCheckRequest request,
  );
}
