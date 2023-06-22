import 'package:reservation_app/domain/model/banner/banner_image_model.dart';
import 'package:reservation_app/domain/repository/banner/banner_repository.dart';

import '../../model/base/data_state.dart';

class GetAllBannerImageUseCase {
  final BannerRepository getBannerImageRepository;

  GetAllBannerImageUseCase(this.getBannerImageRepository);

  Future<DataState<List<BannerImageModel>>> invoke() {
    return getBannerImageRepository.getAllBannerImage();
  }
}
