import 'package:intl/intl.dart';
import 'package:reservation_app/domain/model/reservation/enum/part_time.dart';

class DateTimeUtils {
  static List<DateTime> disablePastTime() {
    List<DateTime> listDateDisabled = [];

    DateTime currentDate = DateTime.now();
    DateTime oldestDate = currentDate.subtract(Duration(days: 20));

    if (oldestDate.isBefore(currentDate)) {
      DateTime disabledDate = oldestDate.subtract(Duration(days: 2));
      while (disabledDate.isBefore(currentDate)) {
        listDateDisabled.add(disabledDate);
        disabledDate = disabledDate.subtract(Duration(days: 2));
      }
    }

    return listDateDisabled;
  }

  static String dateTimeToString(
      {required String pattern, required DateTime date}) {
    return DateFormat(pattern).format(date);
  }

  // 현재 날짜에 맞는 "요일" 가져오기
  static String dateTimeToWeekDay({required DateTime date}) {
    return DateFormat('EEEE', 'ko_KR').format(date);
  }

  static String formatDuration(int durationInSeconds) {
    int minutes = durationInSeconds ~/ 60;
    int seconds = durationInSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  static DateTime dateTimeWithPartTime(DateTime date, PartTime partTime) {
    final partTimeToString = partTime == PartTime.partA
        ? '13:00'
        : partTime == PartTime.partB
            ? '17:50'
            : partTime == PartTime.partC
                ? '20:00'
                : '00:00';

    DateFormat formatter = DateFormat('yyyy-MM-dd\'T\'$partTimeToString');
    return DateTime.parse(formatter.format(date));
  }

  /// 📌 주어진 시간이 현재 시간보다 이전인 경우 false
  /// - 주어진 시간이 현재 시간보다 미래이고 그 차이가 1 보다 크면 true
  /// - 즉, 선택한 시간이 현재 시간보다 2시간 이상 차이가 날 경우 true
  static bool isDateWithinOneHour(DateTime date) {
    final now = DateTime.now();

    if (date.isAfter(now)) {
      final difference = date.difference(now);
      return difference.inHours > 1;
    } else {
      return false;
    }
  }
}
