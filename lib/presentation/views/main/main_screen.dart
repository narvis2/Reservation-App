import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/presentation/views/main/block/main_bloc.dart';
import 'package:reservation_app/presentation/views/main/components/bottom_tab_bar_component.dart';
import 'package:reservation_app/presentation/views/main/tabs/home/home_tab_screen.dart';
import 'package:reservation_app/presentation/views/main/tabs/profile/profile_tab_screen.dart';
import 'package:reservation_app/presentation/views/main/tabs/setting/setting_tab_screen.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 1,
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mainBlock = BlocProvider.of<MainBloc>(context);

    return Scaffold(
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: <Widget>[
            HomeTabScreen(),
            ProfileTabScreen(),
            SettingTabScreen()
          ],
        ),
      bottomNavigationBar: BottomTabBarComponent(tabController: _tabController),
    );
  }
}
