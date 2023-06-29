
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:reservation_app/data/datasources/remote/banner/banner_api_service.dart';
import 'package:reservation_app/domain/model/banner/banner_image_model.dart';
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/repository/banner/banner_repository.dart';

class BannerRepositoryImpl implements BannerRepository {
  final BannerApiService _bannerApiService;
  BannerRepositoryImpl(this._bannerApiService);

  @override
  Future<DataState<List<BannerImageModel>>> getAllBannerImage() async {
    try {
      final response = await _bannerApiService.getAllBannerImage();
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