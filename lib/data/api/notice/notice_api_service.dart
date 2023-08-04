
import 'package:dio/dio.dart';
import 'package:reservation_app/data/common/response/response_list_base.dart';
import 'package:reservation_app/domain/model/notice/notice_model.dart';
import 'package:retrofit/http.dart';

part 'notice_api_service.g.dart';

@RestApi()
abstract class NoticeApiService {
  factory NoticeApiService(Dio dio, {String? baseUrl}) = _NoticeApiService;
  
  @GET("/notices")
  Future<BaseListResponse<NoticeModel>> getAllNoticeList();
}