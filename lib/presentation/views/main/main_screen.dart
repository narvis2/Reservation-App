import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/domain/model/fcm/enum/notification_type.dart';
import 'package:reservation_app/presentation/utils/dialog_utils.dart';
import 'package:reservation_app/presentation/views/fcm/bloc/fcm_notification_bloc.dart';
import 'package:reservation_app/presentation/views/main/block/main_bloc.dart';
import 'package:reservation_app/presentation/views/main/components/bottom_tab_bar_component.dart';
import 'package:reservation_app/presentation/views/main/tabs/home/home_tab_screen.dart';
import 'package:reservation_app/presentation/views/main/tabs/profile/search_tab_screen.dart';
import 'package:reservation_app/presentation/views/main/tabs/setting/setting_tab_screen.dart';
import 'package:reservation_app/presentation/views/network/bloc/network_bloc.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late final MainBloc _mainBlock;
  late final NetworkBloc _networkBloc;

  late final TabController _tabController;
  late final StreamSubscription<ConnectivityResult> _networkObservable;

  @override
  void initState() {
    super.initState();
    _mainBlock = BlocProvider.of<MainBloc>(context);
    _networkBloc = BlocProvider.of<NetworkBloc>(context);

    _tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );

    // 앱 초기 진입시 네트워크 상태 체크
    Connectivity().checkConnectivity().then((value) {
      _networkBloc.add(
        NetworkNotifyEvent(isConnected: value != ConnectivityResult.none),
      );
    });

    /// 네트워크 상태가 변경되었을때만 호출됨
    /// 즉, 처음 들어왔을때 네트워크의 상태값은 Callback 되지 않음
    _networkObservable = Connectivity().onConnectivityChanged.listen(
          (ConnectivityResult result) {
        _networkBloc.add(
          NetworkNotifyEvent(isConnected: result != ConnectivityResult.none),
        );
      },
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _networkObservable.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<NetworkBloc, NetworkState>(
          listener: (context, state) {
            if (state.networkStatus == NetworkStatus.success &&
                state.isConnected) {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              }
            }

            if (state.networkStatus == NetworkStatus.failure &&
                !state.isConnected) {
              DialogUtils.showNetworkErrorDialog(context: context);
            }
          },
        ),
        BlocListener<FcmNotificationBloc, FcmNotificationState>(
          listenWhen: (previous, current) {
            return previous != current && current.fcmNotificationModel != null;
          },
          listener: (context, state) {
            final notification = state.fcmNotificationModel;
            if (notification == null) return;

            if (notification.notificationType == NotificationType.foreground) {
              // Foreground Notification 처리
            } else {
              // Background 및 Terminated Notification 처리
            }
          },
        ),
      ],
      child: Scaffold(
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: <Widget>[
            HomeTabScreen(),
            SearchTabScreen(),
            SettingTabScreen()
          ],
        ),
        bottomNavigationBar: BottomTabBarComponent(
          tabController: _tabController,
        ),
      ),
    );
  }
}
