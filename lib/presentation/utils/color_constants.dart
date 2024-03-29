
import 'dart:ui';

import 'package:reservation_app/domain/model/reservation/enum/part_time.dart';

class ColorsConstants {
  // App Colors
  static const Color primary = Color(0xffed5463);
  static const Color primaryDark = Color(0xff511958);
  static const Color background = Color(0xFFFFFFFF);

  // Splash
  static const Color splashText = Color(0xFF9B111E);

  // App Bar
  static const Color appBarBackground = Color(0xFFed5463);
  static const Color appBarText = Color(0xffFFFFFF);
  static const Color appBarIcon = Color(0xffFFFFFF);

  // Tab Bar
  static const Color tabBarBackground = Color(0xffFFFFFF);
  static const Color tabBarSubBackground = Color(0xFF9B111E);
  static const Color tabBarSelectedText = Color(0xFFed5463);
  static const Color tabBarUnselectedText = Color(0xFFed5463);
  static const Color tabBarSelectedIcon = Color(0xFFed5463);
  static const Color tabBarUnselectedIcon = Color(0xFFed5463);

  static const Color test = Color(0xffffd7a6);
  static const Color test1 = Color(0xffffdecb);
  static const Color test2 = Color(0xffffc8c3);

  // partTime
  static const Color partTimeA = Color(0xfff0be58);
  static const Color partTimeB = Color(0xffe8ba86);
  static const Color partTimeC = Color(0xffce8477);

  // Texts
  static const Color text = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFFFFFFFF);
  static const Color textLight = Color(0xFFEEEEEE);
  static const Color textExtraLight = Color(0xFFCCCCCC);
  static const Color textHint = Color(0xFFBEC0C7);
  static const Color inputFocus = Color(0xFF01BFB1);

  // Button Primary
  static const Color primaryButtonBackground = Color(0xFFFFFFFF);
  static const Color primaryButtonText = Color(0xffed5463);
  static const Color primaryButtonBackgroundDisabled = Color(0xFFAAAAAA);
  static const Color strokeGray = Color(0xFFD7D7D7);
  static const Color rightActionButton = Color(0xFFA5A5A5);
  static const Color clown = Color(0xFFFFF3B4);
  static const Color currentDate = Color(0xFFB5DCF9);
  static const Color selectedDate = Color(0xFFBCCEF4);

  // Others Widgets
  static const Color card = Color(0x20FFFFFF);
  static const Color divider = Color(0xFF333333);
  static const Color thinDivider = Color(0xFFE6E6E6);
  static const Color settingDivider = Color(0xFFF1F2F6);
  static const Color boldColor = Color(0xFF000000);
  static const Color error = Color(0xfffe0012);
  static const Color success = Color(0xFF04FD7F);
  static const Color delete = Color(0xfffe0012);
  static const Color guideBackground = Color(0xFFF5F5F5);
  static const Color guideText = Color(0xFF777777);

  // Reservation Process Timelines
  static const Color strokeColor = Color(0xFF152348);
  static const Color inProgressColor = Color(0xFF4682B4);
  static const Color completeColor = Color(0xFF87CEEB);
  static const Color todoColor = Color(0xffd1d2d7);

  static const Color calendarPickerColor = Color(0xFF6A92B4);
  static const Color calendarSideColor = Color(0xFF7C9BB4);
  static const Color calendarCurrentColor = Color(0xFFE8CCB4);
  static const Color calendarRangeColor = Color(0xFFE8CCC4);

  // Dialog
  static const Color dialogBackground = Color(0x55000000);

  static Color getParTimeColor(PartTime partTime) {
    switch (partTime) {
      case PartTime.partA:
        return ColorsConstants.partTimeA;
      case PartTime.partB:
        return ColorsConstants.partTimeB;
      case PartTime.partC:
        return ColorsConstants.partTimeC;
      default:
        return ColorsConstants.background;
    }
  }
}