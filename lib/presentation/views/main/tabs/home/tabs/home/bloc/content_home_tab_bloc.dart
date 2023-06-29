import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/model/reservation/reservation_target_date_model.dart';
import 'package:reservation_app/domain/usecase/reservation/get_tartget_date_reservation_use_case.dart';

part 'content_home_tab_event.dart';

part 'content_home_tab_state.dart';

class ContentHomeTabBloc
    extends Bloc<ContentHomeTabEvent, ContentHomeTabState> {
  final GetTargetDateReservationUseCase getTargetDateReservationUseCase;

  ContentHomeTabBloc(this.getTargetDateReservationUseCase)
      : super(ContentHomeTabInitial()) {
    on<ContentHomeTabTargetReservation>(
      (event, emit) => _getTargetReservationList(event, emit),
    );
  }

  void _getTargetReservationList(
    ContentHomeTabTargetReservation event,
    Emitter<ContentHomeTabState> emit,
  ) async {
    emit(const ContentHomeTabStateLoading());

    final response =
        await getTargetDateReservationUseCase.invoke(DateTime.now());

    if (response is DataSuccess) {
      emit(
        ContentHomeTabStateTargetReservation(
          targetReservationList: response.data ?? [],
        ),
      );
    } else if (response is DataError) {
      debugPrint(
          "🌹 ContentHomeTabBloc DataError message 👉 ${response.error?.message}");
      emit(
        ContentHomeTabStateTargetReservationFailed(
          message: '알 수 없는 오류가 발생하였습니다. \n 잠시 후 다시 시도해주세요.',
        ),
      );
    } else if (response is DataNetworkError) {
      debugPrint(
          "🌹 ContentHomeTabBloc DataNetworkError message 👉 ${response.message}");
      emit(
        ContentHomeTabStateTargetReservationFailed(
          message: '네트워크가 원활하지 않습니다. \n 잠시 후 다시 시도해주세요.',
        ),
      );
    } else {
      debugPrint(
          "🌹 ContentHomeTabBloc DataError message 👉 ${response.error?.message}");
      emit(
        ContentHomeTabStateTargetReservationFailed(
          message: '알 수 없는 오류가 발생하였습니다. \n 잠시 후 다시 시도해주세요.',
        ),
      );
    }
  }
}
