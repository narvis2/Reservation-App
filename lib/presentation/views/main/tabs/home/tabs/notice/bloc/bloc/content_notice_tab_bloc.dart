import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/notice/notice_model.dart';
import 'package:reservation_app/domain/usecase/notice/get_all_notice_use_case.dart';

part 'content_notice_tab_event.dart';

part 'content_notice_tab_state.dart';

class ContentNoticeTabBloc
    extends Bloc<ContentNoticeTabEvent, ContentNoticeTabState> {
  final GetAllNoticeUseCase getAllNoticeUseCase;

  ContentNoticeTabBloc(this.getAllNoticeUseCase)
      : super(ContentNoticeTabInitial()) {
    on<ContentNoticeTabAllNotice>(
      (event, emit) => _getNoticeList(event, emit),
    );
  }

  void _getNoticeList(
    ContentNoticeTabAllNotice event,
    Emitter<ContentNoticeTabState> emit,
  ) async {
    emit(const ContentNoticeTabStateLoading());

    final response = await getAllNoticeUseCase.invoke();

    if (response is DataSuccess) {
      emit(
        ContentNoticeTabStateAllNotice(
          noticeList: response.data ?? [],
        ),
      );
    } else if (response is DataError) {
      debugPrint(
          "🌹 ContentHomeTabBloc DataError message 👉 ${response.error?.message}");
      emit(
        ContentNoticeTabStateAllNoticeFailed(
          message: '알 수 없는 오류가 발생하였습니다. \n 잠시 후 다시 시도해주세요.',
        ),
      );
    } else if (response is DataNetworkError) {
      debugPrint(
          "🌹 ContentHomeTabBloc DataNetworkError message 👉 ${response.message}");
      emit(
        ContentNoticeTabStateAllNoticeFailed(
          message: '네트워크가 원활하지 않습니다. \n 잠시 후 다시 시도해주세요.',
        ),
      );
    } else {
      debugPrint(
          "🌹 ContentHomeTabBloc DataError message 👉 ${response.error?.message}");
      emit(
        ContentNoticeTabStateAllNoticeFailed(
          message: '알 수 없는 오류가 발생하였습니다. \n 잠시 후 다시 시도해주세요.',
        ),
      );
    }
  }
}
