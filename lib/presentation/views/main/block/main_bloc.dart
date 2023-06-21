import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/domain/usecase/banner/get_all_banner_image_use_case.dart';

import '../../../../domain/model/banner/banner_image_model.dart';
import '../../../../domain/model/base/data_state.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final GetAllBannerImageUseCase getAllBannerImageUseCase;

  // Event 등록
  MainBloc(this.getAllBannerImageUseCase) : super(MainStateInitial()) {
    on<MainEventBannerImages>(
        (event, emit) => _getBannerImageEvent(event, emit));
  }

  // 📌 배너 이미지를 전부 가져옴
  void _getBannerImageEvent(
      MainEventBannerImages event, Emitter<MainState> emit) async {
    emit(const MainStateLoading());

    final response = await getAllBannerImageUseCase.invoke();

    if (response is DataSuccess) {
      emit(MainStateBannerImages(bannerImages: response.data ?? []));
    } else if (response is DataError) {
      print("🌹 MainBlock DataError message 👉 ${response.error?.message}");
      emit(MainStateBannerImagesFailed(message: '알 수 없는 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.'));
    } else if (response is DataNetworkError) {
      print("🌹 MainBlock DataNetworkError message 👉 ${response.message}");
      emit(MainStateBannerImagesFailed(message: '네트워크가 원활하지 않습니다. 잠시 후 다시 시도해주세요.'));
    } else {
      print("🌹 MainBlock DataError message 👉 ${response.error?.message}");
      emit(MainStateBannerImagesFailed(message: '알 수 없는 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.'));
    }
  }
}
