import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:reservation_app/domain/model/common/bottom_sheet_model.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/utils/list_extensions.dart';
import 'package:reservation_app/presentation/views/sign/signin_signup_screen.dart';

class DialogUtils {
  static showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: false,
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
    required DateTime initDate,
    required bool Function(
      DateTime dateTime,
      bool available,
    ) onTabDay,
  }) async {
    return await showRoundedDatePicker(
      context: context,
      initialDate: initDate,
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

  static showBasicDialog({
    required BuildContext context,
    required String title,
    required String message,
    bool enableCancelBtn = false,
    bool enableAutoCancel = true,
    void Function()? onConfirmClick,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 60),
            decoration: BoxDecoration(
              color: ColorsConstants.background,
              borderRadius: BorderRadius.circular(15),
            ),
            height: 200,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: ColorsConstants.divider,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Divider(
                        height: 1,
                        thickness: 1,
                        indent: 15,
                        endIndent: 15,
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.all(15),
                          alignment: Alignment.center,
                          child: Text(
                            message,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: ColorsConstants.divider,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (enableCancelBtn)
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                ColorsConstants.primary,
                              ),
                            ),
                            child: Text("취소"),
                          ),
                        ),
                      SizedBox(width: enableCancelBtn ? 5 : 0),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (onConfirmClick != null) {
                              onConfirmClick();
                            }

                            Navigator.of(context).pop();
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              ColorsConstants.inProgressColor,
                            ),
                          ),
                          child: Text("확인"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      barrierDismissible: enableAutoCancel,
    );
  }

  static showNetworkErrorDialog({
    required BuildContext context,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/lottie/no_wifi_animation.json',
                animate: true,
                width: 150,
                height: 150,
                repeat: true,
              ),
              DefaultTextStyle(
                style: TextStyle(
                  color: ColorsConstants.background,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                child: Text(
                  "네트워크 상태를 확인해주세요.",
                ),
              ),
            ],
          ),
        );
      },
      barrierDismissible: false,
    );
  }

  static showSignInSignUpDialog({
    required BuildContext context,
  }) async {
    await showGeneralDialog(
      barrierDismissible: true,
      context: context,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: ColorsConstants.dialogBackground,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return SignInSignUpScreen(buildContext: context);
      },
    );
  }

  static showBottomSheetDialog({
    required BuildContext context,
    required List<BottomSheetModel> itemList,
    required void Function(int index) onItemClick,
  }) async {
    await showModalBottomSheet(
      context: context,
      clipBehavior: Clip.hardEdge,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(27),
        ),
      ),
      builder: (context) {
        return SingleChildScrollView(
          child: Wrap(
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: ColorsConstants.settingDivider,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    "더보기",
                    style: TextStyle(
                      color: ColorsConstants.boldColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(bottom: 30),
                child: Column(
                  children: itemList
                      .where((item) => item.enable)
                      .mapIndexed(
                        (item, index) => InkWell(
                          onTap: () {
                            onItemClick(index);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SizedBox(
                              height: 40,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item.title,
                                    style: TextStyle(
                                      color: ColorsConstants.boldColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: ColorsConstants.guideText,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
