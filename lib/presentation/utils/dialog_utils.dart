import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';

class DialogUtils {
  static showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: Lottie.asset(
          'assets/lottie/loading_animation.json',
          animate: true,
          width: 73,
          height: 73,
          repeat: true,
        ),
      ),
    );
  }

  static Future<DateTime?> showDatePickerDialog({
    required BuildContext context,
    required bool Function(
      DateTime dateTime,
      bool available,
    ) onTabDay,
  }) async {
    return await showRoundedDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 1),
      onTapDay: onTabDay,
      styleDatePicker: MaterialRoundedDatePickerStyle(
        backgroundHeader: ColorsConstants.calendarPickerColor,
        textStyleDayButton: TextStyle(
          fontSize: 0,
        ),
        textStyleMonthYearHeader: TextStyle(
          fontSize: 20,
          color: ColorsConstants.background,
          fontWeight: FontWeight.bold,
        ),
        textStyleYearButton: TextStyle(
          fontSize: 0,
        ),
        textStyleButtonNegative: TextStyle(
          fontSize: 14,
          color: ColorsConstants.background,
          fontWeight: FontWeight.w600,
        ),
        textStyleButtonPositive: TextStyle(
          fontSize: 14,
          color: ColorsConstants.background,
          fontWeight: FontWeight.bold,
        ),
        textStyleDayHeader: TextStyle(
          fontSize: 14,
          color: ColorsConstants.background,
          fontWeight: FontWeight.w600,
        ),
        decorationDateSelected: BoxDecoration(
          color: Colors.orange,
          shape: BoxShape.circle,
        ),
        textStyleDayOnCalendar: TextStyle(
          fontSize: 14,
          color: ColorsConstants.background,
        ),
        textStyleDayOnCalendarSelected: TextStyle(
          color: ColorsConstants.background,
          fontWeight: FontWeight.bold,
        ),
        textStyleCurrentDayOnCalendar: TextStyle(
            color: ColorsConstants.calendarCurrentColor,
            fontSize: 14,
            fontWeight: FontWeight.bold),
        colorArrowNext: ColorsConstants.background,
        colorArrowPrevious: ColorsConstants.background,
        paddingDatePicker: EdgeInsets.all(0),
        paddingActionBar: EdgeInsets.all(0),
        paddingDateYearHeader: EdgeInsets.all(10),
        backgroundHeaderMonth: ColorsConstants.calendarSideColor,
        backgroundActionBar: ColorsConstants.calendarSideColor,
        backgroundPicker: ColorsConstants.calendarPickerColor,
      ),
      textPositiveButton: "선택",
      borderRadius: 16,
      listDateDisabled: [],
      barrierDismissible: true,
      height: 300,
    );
  }
}
