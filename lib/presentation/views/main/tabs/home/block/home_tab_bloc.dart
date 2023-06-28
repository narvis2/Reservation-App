import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../domain/model/banner/banner_image_model.dart';
import '../../../../../../domain/model/base/data_state.dart';
import '../../../../../../domain/usecase/banner/get_all_banner_image_use_case.dart';

part 'home_tab_event.dart';
part 'home_tab_state.dart';

class HomeTabBloc extends Bloc<HomeTabEvent, HomeTabState> {
  final GetAllBannerImageUseCase getAllBannerImageUseCase;

  // Event 등록
  HomeTabBloc(this.getAllBannerImageUseCase) : super(HomeTabInitial()) {
    on<HomeTabEventBannerImage>((event, emit) =>_getBannerImageEvent(event, emit));
  }

  // 📌 배너 이미지를 전부 가져옴
  void _getBannerImageEvent(
    HomeTabEventBannerImage event,
    Emitter<HomeTabState> emit
  ) async {
    emit(const HomeTabStateLoading());

    final response = await getAllBannerImageUseCase.invoke();

    if (response is DataSuccess) {
      emit(HomeTabStateBannerImages(bannerImages: response.data ?? []));
    } else if (response is DataError) {
      debugPrint("🌹 HomeTabBloc DataError message 👉 ${response.error?.message}");
      emit(HomeTabStateBannerImagesFailed(message: '알 수 없는 오류가 발생하였습니다. \n 잠시 후 다시 시도해주세요.'));
    } else if (response is DataNetworkError) {
      debugPrint("🌹 HomeTabBloc DataNetworkError message 👉 ${response.message}");
      emit(HomeTabStateBannerImagesFailed(message: '네트워크가 원활하지 않습니다. \n 잠시 후 다시 시도해주세요.'));
    } else {
      debugPrint("🌹 HomeTabBloc DataError message 👉 ${response.error?.message}");
      emit(HomeTabStateBannerImagesFailed(message: '알 수 없는 오류가 발생하였습니다. \n 잠시 후 다시 시도해주세요.'));
    }
  }
}
