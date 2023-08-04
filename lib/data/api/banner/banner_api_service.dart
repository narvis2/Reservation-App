import 'package:dio/dio.dart';
import 'package:reservation_app/data/common/response/response_list_base.dart';
import 'package:reservation_app/domain/model/banner/banner_image_model.dart';
import 'package:retrofit/retrofit.dart';

// part 'banner_api_service.g.dart';
part 'banner_api_service.g.dart';

@RestApi()
abstract class BannerApiService {
  factory BannerApiService(Dio dio, {String? baseUrl}) = _BannerApiService;

  @GET("/banner/images")
  Future<BaseListResponse<BannerImageModel>> getAllBannerImage();
}