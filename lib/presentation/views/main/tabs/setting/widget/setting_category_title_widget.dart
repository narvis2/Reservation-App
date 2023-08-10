import 'package:flutter/material.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';

class SettingCategoryTitleWidget extends StatelessWidget {
  final String title;

  const SettingCategoryTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      color: ColorsConstants.settingDivider,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        title,
        style: TextStyle(
          color: ColorsConstants.guideText,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
