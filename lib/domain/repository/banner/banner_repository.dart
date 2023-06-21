
import 'package:reservation_app/domain/model/banner/banner_image_model.dart';

import '../../model/base/data_state.dart';

abstract class BannerRepository {
  Future<DataState<List<BannerImageModel>>> getAllBannerImage();
}