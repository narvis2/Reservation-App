import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:reservation_app/data/datasource/remote_data_source.dart';
import 'package:reservation_app/data/mapper/object_mapper.dart';
import 'package:reservation_app/data/model/reservation/page/reservation_filter_list_response.dart';
import 'package:reservation_app/data/model/reservation/reservation_create_request.dart';
import 'package:reservation_app/data/model/reservation/reservation_detail_response.dart';
import 'package:reservation_app/data/model/reservation/reservation_non_auth_response.dart';
import 'package:reservation_app/data/model/reservation/reservation_range_section_response.dart';
import 'package:reservation_app/data/model/reservation/reservation_target_date_response.dart';
import 'package:reservation_app/di/prefs/shared_pref_module.dart';
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/reservation/enum/part_time.dart';
import 'package:reservation_app/domain/model/reservation/enum/reservation_filter_type.dart';
import 'package:reservation_app/domain/model/reservation/page/reservation_filter_list_model.dart';
import 'package:reservation_app/domain/model/reservation/part_time_seat_list.dart';
import 'package:reservation_app/domain/model/reservation/request/reservation_approval_check_request_model.dart';
import 'package:reservation_app/domain/model/reservation/request/reservation_create_request_model.dart';
import 'package:reservation_app/domain/model/reservation/request/reservation_date_range_req_model.dart';
import 'package:reservation_app/domain/model/reservation/reservation_detail_model.dart';
import 'package:reservation_app/domain/model/reservation/reservation_non_auth_model.dart';
import 'package:reservation_app/domain/model/reservation/reservation_range_section_model.dart';
import 'package:reservation_app/domain/model/reservation/reservation_target_date_model.dart';
import 'package:reservation_app/domain/model/reservation/reservation_target_part_time_seat_model.dart';
import 'package:reservation_app/domain/model/seat/enum/seat_type.dart';
import 'package:reservation_app/presentation/utils/date_time_utils.dart';

import '../../../domain/repository/reservation/reservation_repository.dart';

class ReservationRepositoryImpl implements ReservationRepository {
  final RemoteDataSource _remoteDataSource;
  final SharedPreferenceModule _pref;

  ReservationRepositoryImpl(
    this._remoteDataSource,
    this._pref,
  );

  @override
  Future<DataState<List<ReservationTargetDateModel>>> getTargetDateReservation(
      DateTime date) async {
    try {
      final response = await _remoteDataSource
          .getTargetDateReservation(_dateTimeToString(date));
      final List<ReservationTargetDateResponse>? responseData = response.data;

      if (response.success && responseData != null) {
        if (responseData.isNotEmpty) {
          /// 📌 서버에서 넘어온 원본 Response 를
          /// 📌 사용자에게 실제로 보여줄 Model 로 파싱
          List<ReservationTargetDateModel> filteredList =
              responseData.map((item) {
            List<SeatType> seatAList =
                _parseByPartTime(item.remainsSeatList, 'a');
            List<SeatType> seatBList =
                _parseByPartTime(item.remainsSeatList, 'b');
            List<SeatType> seatCList =
                _parseByPartTime(item.remainsSeatList, 'c');

            List<PartTimeSeatList> remainsSeatList = [
              PartTimeSeatList(
                seatCategory: '1 인석',
                seatCount: seatAList.length,
              ),
              PartTimeSeatList(
                seatCategory: '4 ~ 5 인석',
                seatCount: seatBList.length,
              ),
              PartTimeSeatList(
                seatCategory: '6 인석',
                seatCount: seatCList.length,
              ),
            ];

            return ReservationTargetDateModel(
              partTime: item.partTime,
              remainsSeatList: remainsSeatList,
            );
          }).toList();

          debugPrint("filteredList 👇 \n ${filteredList.toString()}");
          return DataSuccess(filteredList);
        }

        return DataSuccess([]);
      }

      return DataNetworkError(response.resultMsg);
    } on DioException catch (error) {
      debugPrint("🌹 DioException 👉 ${error.message}");
      return DataError(error);
    }
  }

  @override
  Future<DataState<List<ReservationTargetPartTimeSeatModel>>>
      getTargetPartTimeReservation(
    PartTime partTime,
    DateTime date,
    int count,
  ) async {
    try {
      final response = await _remoteDataSource.getTargetPartTimeDateReservation(
        partTime,
        _dateTimeToStringWithPartTime(
          date,
          partTime,
        ),
      );
      final List<SeatType>? responseData = response.data;

      if (response.success && responseData != null) {
        if (responseData.isNotEmpty) {
          String prefix = count <= 3
              ? 'a'
              : count >= 4 && count < 6
                  ? 'b'
                  : 'c';
          final seatList = _parseByPartTime(
            responseData,
            prefix,
          );

          if (prefix == 'a' && seatList.length < count) {
            return DataSuccess([]);
          }

          final mappingList = seatList
              .map(
                (item) => ReservationTargetPartTimeSeatModel(
                    remainSeatList: item, isSelected: false),
              )
              .toList();

          debugPrint("mappingList 👇 \n ${mappingList.toString()}");
          return DataSuccess(mappingList);
        }

        return DataSuccess([]);
      }

      return DataNetworkError(response.resultMsg);
    } on DioException catch (error) {
      debugPrint("🌹 DioException 👉 ${error.message}");
      return DataError(error);
    }
  }

  @override
  Future<DataState<bool>> requestCreateReservation(
    ReservationCreateRequestModel request,
  ) async {
    try {
      final String? fcmToken = await _pref.fcmToken;

      final response = await _remoteDataSource.requestCreateReservation(
        _createMapper(request, fcmToken),
      );

      if (response.success && response.code == 200) {
        return DataSuccess(
          response.resultMsg != null && response.resultMsg == "응답 성공",
        );
      }

      return DataNetworkError(response.resultMsg);
    } on DioException catch (error) {
      debugPrint("🌹 POST [/reservation] API DioException 👉 ${error.message}");
      final Map<String, dynamic>? responseData = error.response?.data;

      if (responseData != null) {
        final String? resultMsg = responseData['resultMsg'];
        if (resultMsg != null) {
          return DataNetworkError(resultMsg);
        }
      }

      return DataError(error);
    }
  }

  @override
  Future<DataState<List<ReservationNonAuthModel>>>
      getReservationNonAuthList() async {
    try {
      final response = await _remoteDataSource.getNonAuthReservationList();

      final List<ReservationNonAuthResponse>? nonAuthReservationList =
          response.data;

      if (response.success &&
          response.code == 200 &&
          nonAuthReservationList != null) {
        return DataSuccess(
          nonAuthReservationList
              .map((item) => item.toReservationNonAuthModel())
              .toList(),
        );
      }

      return DataNetworkError(response.resultMsg);
    } on DioException catch (error) {
      debugPrint(
          "🌹 GET [/reservation/non-auth] API DioException 👉 ${error.message}");
      final Map<String, dynamic>? responseData = error.response?.data;

      if (responseData != null) {
        final String? resultMsg = responseData['resultMsg'];
        if (resultMsg != null) {
          return DataNetworkError(resultMsg);
        }
      }

      return DataError(error);
    }
  }

  @override
  Future<DataState<ReservationFilterListModel>> getReservationFilterPageList(
    int page,
    int limit,
    ReservationFilterType filterType,
  ) async {
    try {
      final response = await _remoteDataSource.requestReservationFilterList(
        page,
        limit,
        filterType,
      );

      final ReservationFilterListResponse? resultData = response.data;

      if (response.success && response.code == 200 && resultData != null) {
        return DataSuccess(resultData.toReservationFilterListModel());
      }

      return DataNetworkError(response.resultMsg);
    } on DioException catch (error) {
      debugPrint(
          "🌹 GET [/reservation/filter] API DioException 👉 ${error.message}");
      final Map<String, dynamic>? responseData = error.response?.data;

      if (responseData != null) {
        final String? resultMsg = responseData['resultMsg'];
        if (resultMsg != null) {
          return DataNetworkError(resultMsg);
        }
      }

      return DataError(error);
    }
  }

  @override
  Future<DataState> requestApprovalCheckReservation(
    ReservationApprovalCheckRequestModel request,
  ) async {
    try {
      final response = await _remoteDataSource.requestApprovalCheck(
        request.id,
        request.toReservationApprovalCheckRequest(),
      );

      if (response.success && response.code == 200) {
        return DataSuccess(true);
      }

      return DataNetworkError(response.resultMsg);
    } on DioException catch (error) {
      debugPrint(
          "🌹 PUT [/reservation/check-auth/{id}] API DioException 👉 ${error.message}");
      final Map<String, dynamic>? responseData = error.response?.data;

      if (responseData != null) {
        final String? resultMsg = responseData['resultMsg'];
        if (resultMsg != null) {
          return DataNetworkError(resultMsg);
        }
      }

      return DataError(error);
    }
  }

  @override
  Future<DataState<ReservationDetailModel>> requestReservationDetail(
    int id,
  ) async {
    try {
      final response = await _remoteDataSource.requestReservationDetail(id);
      final ReservationDetailResponse? resultData = response.data;

      if (response.success && resultData != null) {
        return DataSuccess(resultData.toReservationDetailModel());
      }

      return DataNetworkError(response.resultMsg);
    } on DioException catch (error) {
      debugPrint(
          "🌹 GET [/reservation/{id}] API DioException 👉 ${error.message}");
      final Map<String, dynamic>? responseData = error.response?.data;

      if (responseData != null) {
        final String? resultMsg = responseData['resultMsg'];
        if (resultMsg != null) {
          return DataNetworkError(resultMsg);
        }
      }

      return DataError(error);
    }
  }

  @override
  Future<DataState<ReservationDetailModel>> requestReservationDetailByUser(
    String certificationNumber,
  ) async {
    try {
      final response = await _remoteDataSource.requestReservationDetailByUser(
        certificationNumber,
      );
      final ReservationDetailResponse? resultData = response.data;

      if (response.success && resultData != null) {
        return DataSuccess(resultData.toReservationDetailModel());
      }

      return DataNetworkError(response.resultMsg);
    } on DioException catch (error) {
      debugPrint(
          "🌹 GET [/reservation/user] API DioException 👉 ${error.message}");
      final Map<String, dynamic>? responseData = error.response?.data;

      if (responseData != null) {
        final String? resultMsg = responseData['resultMsg'];
        if (resultMsg != null) {
          return DataNetworkError(resultMsg);
        }
      }

      return DataError(error);
    }
  }

  @override
  Future<DataState<List<ReservationRangeSectionModel>>>
      requestReservationRangeSectionList(
    ReservationDateRangeReqModel request,
  ) async {
    try {
      final response = await _remoteDataSource.requestReservationRangeList(
        DateTimeUtils.dateTimeToYearDateString(request.searchStartDate),
        DateTimeUtils.dateTimeToYearDateString(request.searchEndDate),
      );

      final List<ReservationRangeSectionResponse>? resultData = response.data;

      if (response.success && response.code == 200 && resultData != null) {
        return DataSuccess(
          resultData
              .map((item) => item.toReservationRangeSectionModel())
              .toList(),
        );
      }

      return DataNetworkError(response.resultMsg);
    } on DioException catch (error) {
      debugPrint(
          "🌹 GET [/reservation/range] API DioException 👉 ${error.message}");
      final Map<String, dynamic>? responseData = error.response?.data;

      if (responseData != null) {
        final String? resultMsg = responseData['resultMsg'];
        if (resultMsg != null) {
          return DataNetworkError(resultMsg);
        }
      }

      return DataError(error);
    }
  }

  List<SeatType> _parseByPartTime(List<SeatType> seatList, String prefix) {
    return seatList.where((seatType) {
      return seatType.name.startsWith(prefix);
    }).toList();
  }

  List<ReservationTargetPartTimeSeatModel> _parseByCount(
    List<ReservationTargetPartTimeSeatModel> seatList,
    int count,
  ) {
    String prefix = count <= 3
        ? 'a'
        : count >= 4 && count < 6
            ? 'b'
            : 'c';

    return seatList.where((seatType) {
      return seatType.remainSeatList.name.startsWith(prefix);
    }).toList();
  }

  String _dateTimeToString(DateTime date) {
    DateFormat formatter = DateFormat('yyyy-MM-dd\'T\'HH:mm:ss');
    return formatter.format(date);
  }

  String _dateTimeToStringWithPartTime(DateTime date, PartTime partTime) {
    final partTimeToString = partTime == PartTime.partA
        ? '13:00:00'
        : partTime == PartTime.partB
            ? '17:50:00'
            : partTime == PartTime.partC
                ? '20:00:00'
                : '00:00:00';

    DateFormat formatter = DateFormat('yyyy-MM-dd\'T\'$partTimeToString');
    return formatter.format(date);
  }

  ReservationCreateRequest _createMapper(
    ReservationCreateRequestModel model,
    String? fcmToken,
  ) {
    return ReservationCreateRequest(
      name: model.name,
      phoneNumber: model.phoneNumber,
      reservationDateTime: _dateTimeToStringWithPartTime(
        model.reservationDateTime,
        _intToPartTime(model.timeType),
      ),
      reservationCount: model.reservationCount,
      timeType: _intToPartTime(model.timeType),
      isTermAllAgree: model.isTermAllAgree,
      isUserValidation: model.isUserValidation,
      seat: model.seat,
      fcmToken: fcmToken,
    );
  }

  PartTime _intToPartTime(
    int timeType,
  ) {
    return timeType == 0
        ? PartTime.partA
        : timeType == 1
            ? PartTime.partB
            : timeType == 2
                ? PartTime.partC
                : PartTime.partA;
  }
}
