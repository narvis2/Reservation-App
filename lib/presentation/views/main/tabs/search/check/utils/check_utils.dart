import 'package:reservation_app/domain/model/reservation/enum/reservation_filter_type.dart';

class CheckUtils {
  static String mappingFilterType(ReservationFilterType filterType) {
    return filterType == ReservationFilterType.all
        ? "전체"
        : filterType == ReservationFilterType.nonAuth
            ? "비인증"
            : filterType == ReservationFilterType.auth
                ? "인증"
                : "전체";
  }
}
