part of 'app_router.dart';

class $AppRouter extends RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    }
  };

  @override
  // TODO: implement routes
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, path: '/', initial: true),
    AutoRoute(page: MainRoute.page)
  ];
}

class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children}) : super(SplashRoute.name, initialChildren: children);

  static const String name = "SplashRoute";
  static const PageInfo<void> page = PageInfo<void>(name);
}

class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children}) : super(MainRoute.name, initialChildren: children);

  static const String name = "MainRoute";
  static const PageInfo<void> page = PageInfo<void>(name);
}