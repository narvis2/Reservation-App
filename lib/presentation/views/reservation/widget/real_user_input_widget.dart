import 'package:flutter/material.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';

class RealUserInputWidget extends StatelessWidget {
  final bool isVisible;
  final int realSelectedUser;

  final Function() onClickPlus;
  final Function() onClickMinus;

  const RealUserInputWidget({
    Key? key,
    required this.isVisible,
    required this.realSelectedUser,
    required this.onClickPlus,
    required this.onClickMinus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Container(
        padding: EdgeInsets.only(left: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.label_important_outline,
                  size: 20,
                  color: ColorsConstants.inProgressColor,
                ),
                SizedBox(width: 5),
                Text(
                  "자세한 인원수 입력: ",
                  style: TextStyle(
                    fontSize: 14,
                    color: ColorsConstants.divider,
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: ColorsConstants
                            .calendarPickerColor, // 테두리 색상 설정
                        width: 1.0, // 테두리 너비 설정
                      ),
                    ),
                  ),
                  child: Text(
                    "$realSelectedUser",
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorsConstants.divider,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: onClickPlus,
                  icon: Icon(
                    Icons.plus_one_outlined,
                    size: 20,
                  ),
                  color: ColorsConstants.inProgressColor,
                ),
                Container(
                  color: ColorsConstants.divider,
                  width: 1,
                  height: 10,
                  // 구분선의 높이 설정
                  child: VerticalDivider(),
                ),
                IconButton(
                  onPressed: onClickMinus,
                  icon: Icon(
                    Icons.exposure_minus_1_outlined,
                    size: 20,
                  ),
                  color: ColorsConstants.primary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
