import 'package:cupertino_tabbar/cupertino_tabbar.dart' as ctb;
import 'package:flutter/material.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';

import '../tabs/home/content_home_tab_screen.dart';

class CustomTabBarWidget extends StatefulWidget {
  const CustomTabBarWidget({Key? key}) : super(key: key);

  @override
  State<CustomTabBarWidget> createState() => _CustomTabBarWidgetState();
}

class _CustomTabBarWidgetState extends State<CustomTabBarWidget>
    with TickerProviderStateMixin {
  int cupertinoTabBarVIIIValue = 0;
  int cupertinoTabBarVIIIValueGetter() => cupertinoTabBarVIIIValue;

  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  Widget get _tabBar {
    List<Widget> titles = [];

    titles.add(Text(
      "홈",
      style: TextStyle(
        color: cupertinoTabBarVIIIValue == 0 ? Colors.white : Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.center,
    ));

    titles.add(Text(
      "예약",
      style: TextStyle(
        color: cupertinoTabBarVIIIValue == 1 ? Colors.white : Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.center,
    ));

    titles.add(
      Text(
        "공지사항",
        style: TextStyle(
          color: cupertinoTabBarVIIIValue == 2 ? Colors.white : Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );

    titles.add(
      Text(
        "알림",
        style: TextStyle(
          color: cupertinoTabBarVIIIValue == 3 ? Colors.white : Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );

    titles.add(
      Text(
        "오시는길",
        style: TextStyle(
          color: cupertinoTabBarVIIIValue == 4 ? Colors.white : Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );

    return ctb.CupertinoTabBar(
      Colors.transparent,
      ColorsConstants.tabBarSubBackground,
      titles,
      cupertinoTabBarVIIIValueGetter,
      (int index) {
        setState(() {
          cupertinoTabBarVIIIValue = index;
          _tabController.index = index;
        });
      },
      useSeparators: true,
      allowExpand: true,
      innerVerticalPadding: 12.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _tabBar,
        Expanded(
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              ContentHomeTabScreen(),
              Center(child: Text("예약")),
              Center(child: Text("공지사항")),
              Center(child: Text("알림")),
              Center(child: Text("오시는길")),
            ],
          ),
        ),
      ],
    );
  }
}
