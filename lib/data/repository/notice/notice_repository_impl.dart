
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:reservation_app/data/datasources/remote/notice/notice_api_service.dart';
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/notice/notice_model.dart';
import 'package:reservation_app/domain/repository/notice/notice_repository.dart';

class NoticeRepositoryImpl implements NoticeRepository {
  final NoticeApiService _noticeApiService;
  NoticeRepositoryImpl(this._noticeApiService);

  @override
  Future<DataState<List<NoticeModel>>> getAllNoticeList() async {
    try {
      final response = await _noticeApiService.getAllNoticeList();
      final List<NoticeModel>? responseData = response.data;

      if (response.success && responseData != null) {
        if (responseData.isNotEmpty) {
          debugPrint("noticeList 👇 \n ${responseData.toString()}");
          return DataSuccess(responseData);
        }

        return DataSuccess([]);
      }

      return DataNetworkError(response.resultMsg);
    } on DioException catch (error) {
      debugPrint("🌹 DioException 👉 ${error.message}");
      return DataError(error);
    }
  }
}