import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:reservation_app/data/datasources/remote/reservation/reservation_api_service.dart';
import 'package:reservation_app/data/model/reservation/reservation_create_request.dart';
import 'package:reservation_app/data/model/reservation/reservation_target_date_response.dart';
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/reservation/enum/part_time.dart';
import 'package:reservation_app/domain/model/reservation/part_time_seat_list.dart';
import 'package:reservation_app/domain/model/reservation/request/reservation_create_request_model.dart';
import 'package:reservation_app/domain/model/reservation/reservation_target_date_model.dart';
import 'package:reservation_app/domain/model/reservation/reservation_target_part_time_seat_model.dart';
import 'package:reservation_app/domain/model/seat/enum/seat_type.dart';

import '../../../domain/repository/reservation/reservation_repository.dart';

class ReservationRepositoryImpl implements ReservationRepository {
  final ReservationApiService _reservationApiService;

  ReservationRepositoryImpl(this._reservationApiService);

  @override
  Future<DataState<List<ReservationTargetDateModel>>> getTargetDateReservation(
      DateTime date) async {
    try {
      final response = await _reservationApiService
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
      final response =
          await _reservationApiService.getTargetPartTimeDateReservation(
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
      final response = await _reservationApiService.requestCreateReservation(
        _createMapper(request),
      );

      if (response.success && response.code == 200) {
        return DataSuccess(
          response.resultMsg != null && response.resultMsg == "응답 성공",
        );
      }

      return DataNetworkError(response.resultMsg);
    } on DioException catch (error) {
      debugPrint("🌹 [/reservation] API DioException 👉 ${error.message}");
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
