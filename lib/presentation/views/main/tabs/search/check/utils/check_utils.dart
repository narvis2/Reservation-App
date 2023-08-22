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

  static String makePhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 10) {
      return "${phoneNumber.substring(0, 3)}-${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6)}";
    } else if (phoneNumber.length == 11) {
      return "${phoneNumber.substring(0, 3)}-${phoneNumber.substring(3, 7)}-${phoneNumber.substring(7)}";
    } else {
      return phoneNumber;
    }
  }

  static String makeReservationCount(int count) {
    if (count < 4) {
      return "$count명 (1 인석)";
    } else if (count >= 4 && count < 6) {
      return "$count 명 (4~5 인석)";
    } else if (count >= 6) {
      return "$count 명 (6 인석)}";
    }

    return '';
  }
}
