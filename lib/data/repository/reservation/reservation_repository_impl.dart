import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:reservation_app/data/datasources/remote/reservation/reservation_api_service.dart';
import 'package:reservation_app/data/model/reservation/reservation_target_date_response.dart';
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/reservation/enum/part_time.dart';
import 'package:reservation_app/domain/model/reservation/part_time_seat_list.dart';
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
                  seatCategory: '1 인석', seatCount: seatAList.length),
              PartTimeSeatList(
                  seatCategory: '4 ~ 5 인석', seatCount: seatBList.length),
              PartTimeSeatList(
                  seatCategory: '6 인석', seatCount: seatCList.length),
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
      final response = await _reservationApiService
          .getTargetPartTimeDateReservation(partTime, _dateTimeToString(date));
      final List<SeatType>? responseData =
          response.data;

      if (response.success && responseData != null) {
        if (responseData.isNotEmpty) {
          String prefix = count <= 3 ? 'a' : count >= 4 && count < 6 ? 'b' : 'c';
          final seatList = _parseByPartTime(responseData, prefix,);

          final mappingList = seatList
              .map(
                (item) => ReservationTargetPartTimeSeatModel(
                  remainSeatList: item,
                  isSelected: false
                ),
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

  List<SeatType> _parseByPartTime(List<SeatType> seatList, String prefix) {
    return seatList.where((seatType) {
      return seatType.name.startsWith(prefix);
    }).toList();
  }

  List<ReservationTargetPartTimeSeatModel> _parseByCount(
    List<ReservationTargetPartTimeSeatModel> seatList,
    int count,
  ) {
    String prefix = count <= 3 ? 'a' : count >= 4 && count < 6 ? 'b' : 'c';

    return seatList.where((seatType) {
      return seatType.remainSeatList.name.startsWith(prefix);
    }).toList();
  }

  String _dateTimeToString(DateTime date) {
    DateFormat formatter = DateFormat('yyyy-MM-dd\'T\'HH:mm:ss');
    return formatter.format(date);
  }
}
