
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:reservation_app/data/datasource/remote_data_source.dart';
import 'package:reservation_app/domain/model/banner/banner_image_model.dart';
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/repository/banner/banner_repository.dart';

class BannerRepositoryImpl implements BannerRepository {
  final RemoteDataSource _remoteDataSource;
  BannerRepositoryImpl(this._remoteDataSource);

  @override
  Future<DataState<List<BannerImageModel>>> getAllBannerImage() async {
    try {
      final response = await _remoteDataSource.getAllBannerImage();
      final responseData = response.data;

      if (response.success && responseData != null) {
        return DataSuccess(responseData);
      }

      return DataNetworkError(response.resultMsg);
    } on DioException catch (error) {
      debugPrint("🌹 DioException 👉 ${error.message}");
      return DataError(error);
    }
  }
}