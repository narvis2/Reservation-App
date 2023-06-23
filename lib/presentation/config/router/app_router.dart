import 'package:auto_route/auto_route.dart';

import '../../views/main/main_screen.dart';
import '../../views/notice/notice_screen.dart';
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
      initial: true
    ),
    AutoRoute(page: MainRoute.page, guards: [DuplicateGuard()]),
    AutoRoute(page: NoticeRoute.page, guards: [DuplicateGuard()])
  ];
}

final appRouter = AppRouter();