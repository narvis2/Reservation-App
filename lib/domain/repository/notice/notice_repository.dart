import 'package:reservation_app/domain/model/notice/notice_model.dart';

import '../../model/base/data_state.dart';

abstract class NoticeRepository {
  Future<DataState<List<NoticeModel>>> getAllNotice();
}
