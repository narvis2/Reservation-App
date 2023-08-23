import 'package:reservation_app/data/api/banner/banner_api_service.dart';
import 'package:reservation_app/data/api/member/member_api_service.dart';
import 'package:reservation_app/data/api/notice/notice_api_service.dart';
import 'package:reservation_app/data/api/reservation/reservation_api_service.dart';
import 'package:reservation_app/data/api/sign/sign_api_service.dart';
import 'package:reservation_app/data/common/response/response_base.dart';
import 'package:reservation_app/data/common/response/response_list_base.dart';
import 'package:reservation_app/data/datasource/remote_data_source.dart';
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

class RemoteDataSourceImpl implements RemoteDataSource {
  final BannerApiService _bannerApiService;
  final MemberApiService _memberApiService;
  final NoticeApiService _noticeApiService;
  final ReservationApiService _reservationApiService;
  final SignApiService _signApiService;

  RemoteDataSourceImpl(
    this._bannerApiService,
    this._memberApiService,
    this._noticeApiService,
    this._reservationApiService,
    this._signApiService,
  );

  @override
  Future<BaseListResponse<BannerImageModel>> getAllBannerImage() {
    return _bannerApiService.getAllBannerImage();
  }

  @override
  Future<BaseResponse<MemberInfoResponse>> requestMemberInfo() {
    return _memberApiService.requestMemberInfo();
  }

  @override
  Future<BaseResponse> requestMemberUpdateFcmToken(
    MemberUpdateFcmTokenRequest request,
  ) {
    return _memberApiService.requestMemberUpdateFcmToken(request);
  }

  @override
  Future<BaseListResponse<NoticeModel>> getAllNoticeList() {
    return _noticeApiService.getAllNoticeList();
  }

  @override
  Future<BaseListResponse<ReservationTargetDateResponse>>
      getTargetDateReservation(
    String date,
  ) {
    return _reservationApiService.getTargetDateReservation(date);
  }

  @override
  Future<BaseListResponse<SeatType>> getTargetPartTimeDateReservation(
    PartTime partTime,
    String date,
  ) {
    return _reservationApiService.getTargetPartTimeDateReservation(
      partTime,
      date,
    );
  }

  @override
  Future<BaseResponse> requestCreateReservation(
    ReservationCreateRequest request,
  ) {
    return _reservationApiService.requestCreateReservation(request);
  }

  @override
  Future<BaseListResponse<ReservationNonAuthResponse>>
      getNonAuthReservationList() {
    return _reservationApiService.getNonAuthReservationList();
  }

  @override
  Future<BaseResponse<ReservationFilterListResponse>>
      requestReservationFilterList(
    int page,
    int limit,
    ReservationFilterType filterType,
  ) {
    return _reservationApiService.requestReservationFilterList(
      page,
      limit,
      filterType,
    );
  }

  @override
  Future<BaseResponse> requestApprovalCheck(
    int id,
    ReservationApprovalCheckRequest request,
  ) {
    return _reservationApiService.requestApprovalCheck(id, request);
  }

  @override
  Future<BaseResponse<SignInResponse>> requestSignIn(
    SignInRequest request,
  ) {
    return _signApiService.requestSignIn(request);
  }

  @override
  Future<BaseResponse> requestSignOut() {
    return _signApiService.requestSignOut();
  }

  @override
  Future<BaseResponse> requestAuthPhoneNumber(PhoneAuthRequest request) {
    return _signApiService.requestAuthPhoneNumber(request);
  }

  @override
  Future<BaseResponse> requestAuthPhoneNumberCheck(
    PhoneAuthCheckRequest request,
  ) {
    return _signApiService.requestAuthPhoneNumberCheck(request);
  }
}
