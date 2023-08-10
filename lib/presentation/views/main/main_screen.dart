import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/domain/model/fcm/enum/notification_type.dart';
import 'package:reservation_app/presentation/utils/dialog_utils.dart';
import 'package:reservation_app/presentation/utils/obj_extensions.dart';
import 'package:reservation_app/presentation/utils/snack_bar_utils.dart';
import 'package:reservation_app/presentation/views/fcm/bloc/fcm_notification_bloc.dart';
import 'package:reservation_app/presentation/views/main/bloc/main_bloc.dart';
import 'package:reservation_app/presentation/views/main/components/bottom_tab_bar_component.dart';
import 'package:reservation_app/presentation/views/main/tabs/home/home_tab_screen.dart';
import 'package:reservation_app/presentation/views/main/tabs/profile/search_tab_screen.dart';
import 'package:reservation_app/presentation/views/main/tabs/setting/setting_tab_screen.dart';
import 'package:reservation_app/presentation/views/network/bloc/network_bloc.dart';
import 'package:reservation_app/presentation/views/user/bloc/user_info_bloc.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late final MainBloc _mainBloc;
  late final NetworkBloc _networkBloc;
  late final UserInfoBloc _userInfoBloc;

  late final NavigatorState _navigator;

  late final TabController _tabController;
  late final StreamSubscription<ConnectivityResult> _networkObservable;

  @override
  void initState() {
    super.initState();
    _mainBloc = BlocProvider.of<MainBloc>(context);
    _networkBloc = BlocProvider.of<NetworkBloc>(context);
    _userInfoBloc = BlocProvider.of<UserInfoBloc>(context);

    _navigator = Navigator.of(context);

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
    _navigator.dispose();
    super.dispose();
  }

  void popBackStack() {
    if (_navigator.canPop()) {
      _navigator.pop();
    }
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
            return previous != current && current.fcmNotificationDataModel != null;
          },
          listener: (context, state) {
            final notification = state.fcmNotificationDataModel;
            if (notification == null) return;
            if (notification.notificationType == NotificationType.foreground) {
              /// Foreground 에서 Notification 을 Click 했을때 처리
              /// TODO:: Notification Data 에 넘어오는 type 을 바탕으로 각 type 에 맞는 화면으로 이동
            } else {
              /// Background 및 Terminate 에서 Notification 을 Click 했을때 처리
              /// TODO:: Notification Data 에 넘어오는 type 을 바탕으로 각 type 에 맞는 화면으로 이동
            }
          },
        ),
        BlocListener<UserInfoBloc, UserInfoState>(
          bloc: _userInfoBloc,
          listenWhen: (previous, current) {
            return previous != current && previous.userInfoStatus != current.userInfoStatus;
          },
          listener: (context, state) {
            if (state.userInfoStatus == UserInfoStatus.loading) {
              DialogUtils.showLoadingDialog(context);
            } else if (state.userInfoStatus == UserInfoStatus.success) {
              popBackStack();
            } else if (state.userInfoStatus == UserInfoStatus.error) {
              popBackStack();
              state.errorMsg?.let((text) {
                SnackBarUtils.showCustomSnackBar(context, text);
              });
            }
          },
        )
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
