import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/notice/notice_model.dart';
import 'package:reservation_app/domain/usecase/notice/get_all_notice_list_use_case.dart';

part 'content_notice_tab_event.dart';

part 'content_notice_tab_state.dart';

class ContentNoticeTabBloc
    extends Bloc<ContentNoticeTabEvent, ContentNoticeTabState> {
  final GetAllNoticeListUseCase _getAllNoticeListUseCase;

  ContentNoticeTabBloc(this._getAllNoticeListUseCase)
      : super(ContentNoticeTabInitial()) {
    on<ContentNoticeTabNoticeListEvent>(
      (event, emit) => _getNoticeList(event, emit),
    );
  }

  void _getNoticeList(
    ContentNoticeTabNoticeListEvent event,
    Emitter<ContentNoticeTabState> emit,
  ) async {
    emit(const ContentNoticeTabStateLoading());

    final response = await _getAllNoticeListUseCase.invoke();

    if (response is DataSuccess) {
      emit(
        ContentNoticeTabStateNoticeList(
          noticeList: response.data ?? [],
        ),
      );
    } else if (response is DataError) {
      debugPrint(
        "🌹 ContentNoticeTabBloc DataError message 👉 ${response.error?.message}",
      );
      emit(
        ContentNoticeTabStateNoticeListFailed(
          message: '알 수 없는 오류가 발생하였습니다. \n 잠시 후 다시 시도해주세요.',
        ),
      );
    } else if (response is DataNetworkError) {
      debugPrint(
        "🌹 ContentNoticeTabBloc DataNetworkError message 👉 ${response.error?.message}",
      );
      emit(
        ContentNoticeTabStateNoticeListFailed(
          message: '네트워크가 원활하지 않습니다. \n 잠시 후 다시 시도해주세요.',
        ),
      );
    } else {
      debugPrint(
        "🌹 ContentNoticeTabBloc DataError message 👉 ${response.error?.message}",
      );
      emit(
        ContentNoticeTabStateNoticeListFailed(
          message: '알 수 없는 오류가 발생하였습니다. \n 잠시 후 다시 시도해주세요.',
        ),
      );
    }
  }
}
