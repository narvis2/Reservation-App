import 'package:auto_route/auto_route.dart';
import 'package:reservation_app/presentation/views/main/main_screen.dart';
import 'package:reservation_app/presentation/views/splash/splash_screen.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends $AppRouter {
  // @override
  // RouteType get defaultRouteType => const RouteType.material();
}

final appRouter = AppRouter();