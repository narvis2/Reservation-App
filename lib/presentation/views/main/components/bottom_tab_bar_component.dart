
import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';

import '../../../utils/color_constants.dart';

class BottomTabBarComponent extends StatelessWidget {
  final TabController tabController;

  const BottomTabBarComponent({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MotionTabBar(
      initialSelectedTab: "Home",
      labels: const ["Home", "Search", "Setting"],
      icons: const [Icons.home, Icons.search, Icons.settings],
      tabSize: 50,
      tabBarHeight: 55,
      textStyle: const TextStyle(
        fontSize: 12,
        color: ColorsConstants.primary,
        fontWeight: FontWeight.w500,
      ),
      tabIconColor: ColorsConstants.primary,
      tabIconSize: 28.0,
      tabIconSelectedSize: 26.0,
      tabSelectedColor: ColorsConstants.primary,
      tabIconSelectedColor: ColorsConstants.tabBarBackground,
      tabBarColor: ColorsConstants.tabBarBackground,
      onTabItemSelected: (int value) {
        tabController.index = value;
      },
    );
  }
}