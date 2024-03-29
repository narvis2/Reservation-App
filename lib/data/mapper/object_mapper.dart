import 'package:reservation_app/data/model/member/member_info_response.dart';
import 'package:reservation_app/data/model/reservation/page/reservation_filter_list_response.dart';
import 'package:reservation_app/data/model/reservation/page/reservation_filter_response.dart';
import 'package:reservation_app/data/model/reservation/reservation_approval_check_request.dart';
import 'package:reservation_app/data/model/reservation/reservation_detail_response.dart';
import 'package:reservation_app/data/model/reservation/reservation_non_auth_response.dart';
import 'package:reservation_app/data/model/reservation/reservation_range_section_data_response.dart';
import 'package:reservation_app/data/model/reservation/reservation_range_section_response.dart';
import 'package:reservation_app/data/model/sign/sign_in_request.dart';
import 'package:reservation_app/data/model/sign/sign_out_request.dart';
import 'package:reservation_app/domain/model/member/member_model.dart';
import 'package:reservation_app/domain/model/reservation/page/reservation_filter_list_model.dart';
import 'package:reservation_app/domain/model/reservation/page/reservation_filter_model.dart';
import 'package:reservation_app/domain/model/reservation/request/reservation_approval_check_request_model.dart';
import 'package:reservation_app/domain/model/reservation/reservation_detail_model.dart';
import 'package:reservation_app/domain/model/reservation/reservation_non_auth_model.dart';
import 'package:reservation_app/domain/model/reservation/reservation_range_section_data_model.dart';
import 'package:reservation_app/domain/model/reservation/reservation_range_section_model.dart';
import 'package:reservation_app/domain/model/sign/request/sign_out_request_model.dart';
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

extension ReservationDetailResponseExtension on ReservationDetailResponse {
  ReservationDetailModel toReservationDetailModel() {
    return ReservationDetailModel(
      id: id,
      name: name,
      phoneNumber: phoneNumber,
      reservationDateTime: reservationDateTime,
      reservationCount: reservationCount,
      isTermAllAgree: isTermAllAgree,
      isUserValidation: isUserValidation,
      seats: seats,
      certificationNumber: certificationNumber,
    );
  }
}

extension SignOutRequestModelExtenstion on SignOutRequestModel {
  SignOutRequest toSignOutRequest() {
    return SignOutRequest(
      memberId: memberId,
    );
  }
}

extension ReservationRangeSectionResponseExtension on ReservationRangeSectionResponse {
  ReservationRangeSectionModel toReservationRangeSectionModel() {
    return ReservationRangeSectionModel(
      sectionTitle: sectionTitle,
      partTime: partTime,
      list: list.map((item) => item.toReservationRangeSectionDataModel()).toList()
    );
  }
}

extension ReservationRangeSectionDataResponseExtenstion on ReservationRangeSectionDataResponse {
  ReservationRangeSectionDataModel toReservationRangeSectionDataModel() {
    return ReservationRangeSectionDataModel(
      id: id,
      name: name,
        phoneNumber: phoneNumber,
        reservationDateTime: reservationDateTime,
        reservationCount: reservationCount,
        isTermAllAgree: isTermAllAgree,
        isUserValidation: isUserValidation,
        certificationNumber: certificationNumber,
        partTime: partTime,
    );
  }
}