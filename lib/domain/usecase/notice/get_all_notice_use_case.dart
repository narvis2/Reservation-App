import 'package:reservation_app/domain/repository/notice/notice_repository.dart';
import '../../model/base/data_state.dart';
import '../../model/notice/notice_model.dart';

class GetAllNoticeUseCase {
  final NoticeRepository noticeRepository;

  GetAllNoticeUseCase(this.noticeRepository);

  Future<DataState<List<NoticeModel>>> invoke() {
    return noticeRepository.getAllNotice();
  }
}
