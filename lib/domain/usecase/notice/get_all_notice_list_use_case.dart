
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/notice/notice_model.dart';
import 'package:reservation_app/domain/repository/notice/notice_repository.dart';

class GetAllNoticeListUseCase {
  final NoticeRepository _noticeRepository;
  GetAllNoticeListUseCase(this._noticeRepository);

  Future<DataState<List<NoticeModel>>> invoke() {
    return _noticeRepository.getAllNoticeList();
  }
}