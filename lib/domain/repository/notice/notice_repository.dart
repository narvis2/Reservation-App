
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/notice/notice_model.dart';

abstract class NoticeRepository {
  Future<DataState<List<NoticeModel>>> getAllNoticeList();
}