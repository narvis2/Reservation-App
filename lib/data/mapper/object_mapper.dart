import 'package:reservation_app/data/model/member/member_info_response.dart';
import 'package:reservation_app/data/model/reservation/page/reservation_filter_list_response.dart';
import 'package:reservation_app/data/model/reservation/page/reservation_filter_response.dart';
import 'package:reservation_app/data/model/reservation/reservation_approval_check_request.dart';
import 'package:reservation_app/data/model/reservation/reservation_non_auth_response.dart';
import 'package:reservation_app/data/model/sign/sign_in_request.dart';
import 'package:reservation_app/domain/model/member/member_model.dart';
import 'package:reservation_app/domain/model/reservation/page/reservation_filter_list_model.dart';
import 'package:reservation_app/domain/model/reservation/page/reservation_filter_model.dart';
import 'package:reservation_app/domain/model/reservation/request/reservation_approval_check_request_model.dart';
import 'package:reservation_app/domain/model/reservation/reservation_non_auth_model.dart';
import 'package:reservation_app/domain/model/sign/sign_in_request_model.dart';

extension MemberInfoResponseExtension on MemberInfoResponse {
  MemberModel toMemberModel() {
    return MemberModel(
      id: id,
      email: email,
      role: role.name,
      name: name,
      isEnablePush: isEnablePush,
      phoneNumber: phoneNumber,
    );
  }
}

extension SignInRequestModelExtension on SignInRequestModel {
  SignInRequest toSignInRequest() {
    return SignInRequest(
      email: email,
      password: password,
    );
  }
}

extension ReservationNonAuthResponseExtension on ReservationNonAuthResponse {
  ReservationNonAuthModel toReservationNonAuthModel() {
    return ReservationNonAuthModel(
      id: id,
      name: name,
      phoneNumber: phoneNumber,
      reservationDateTime: reservationDateTime,
      reservationCount: reservationCount,
      selectedSeats: selectedSeats,
      partTime: partTime,
    );
  }
}

extension ReservationFilterListResponseExtension
    on ReservationFilterListResponse {
  ReservationFilterListModel toReservationFilterListModel() {
    return ReservationFilterListModel(
      totalCount: totalCount,
      totalPages: totalPages,
      hasNext: hasNext,
      reservationList: reservationList
          .map((item) => item.toReservationFilterModel())
          .toList(),
    );
  }
}

extension ReservationFilterResponseExtension on ReservationFilterResponse {
  ReservationFilterModel toReservationFilterModel() {
    return ReservationFilterModel(
      id: id,
      name: name,
      phoneNumber: phoneNumber,
      reservationTime: reservationDateTime,
      reservationCount: reservationCount,
      partTime: partTime,
      createdAt: createdAt,
      isAuthUser: certificationNumber != null,
    );
  }
}

extension ReservationApprovalCheckRequestModelExtension
    on ReservationApprovalCheckRequestModel {
  ReservationApprovalCheckRequest toReservationApprovalCheckRequest() {
    return ReservationApprovalCheckRequest(isApproved: isAgree);
  }
}
