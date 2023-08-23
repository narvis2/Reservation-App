import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:reservation_app/domain/model/notice/notice_model.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/details/reservation_check_tab_details_screen.dart';
import 'package:reservation_app/presentation/views/notice/notice_detail_screen.dart';

import '../../views/main/main_screen.dart';
import '../../views/notice/notice_screen.dart';
import '../../views/reservation/reservation_screen.dart';
import '../../views/splash/splash_screen.dart';
import 'guard/duplicate_guard.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          path: '/',
          initial: true,
        ),
        AutoRoute(
          page: MainRoute.page,
          guards: [
            DuplicateGuard(),
          ],
        ),
        AutoRoute(
          page: NoticeRoute.page,
          guards: [
            DuplicateGuard(),
          ],
        ),
        AutoRoute(
          page: NoticeDetailRoute.page,
          guards: [
            DuplicateGuard(),
          ],
        ),
        AutoRoute(
          page: ReservationRoute.page,
          guards: [
            DuplicateGuard(),
          ],
        ),
        AutoRoute(
          page: ReservationCheckTabDetailsRoute.page,
          guards: [
            DuplicateGuard(),
          ],
        )
      ];
}

final appRouter = AppRouter();
