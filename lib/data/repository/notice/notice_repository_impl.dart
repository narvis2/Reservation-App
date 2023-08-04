import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:reservation_app/data/datasource/remote_data_source.dart';
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/notice/notice_model.dart';
import 'package:reservation_app/domain/repository/notice/notice_repository.dart';

class NoticeRepositoryImpl implements NoticeRepository {
  final RemoteDataSource _remoteDataSource;
  NoticeRepositoryImpl(this._remoteDataSource);

  @override
  Future<DataState<List<NoticeModel>>> getAllNoticeList() async {
    try {
      final response = await _remoteDataSource.getAllNoticeList();
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
