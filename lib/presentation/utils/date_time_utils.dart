import 'package:intl/intl.dart';

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

  static String dateTimeToString({required String pattern, required DateTime date}) {
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
}