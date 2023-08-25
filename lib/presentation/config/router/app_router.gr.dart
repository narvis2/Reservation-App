// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    ReservationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReservationScreen(),
      );
    },
    NoticeDetailRoute.name: (routeData) {
      final args = routeData.argsAs<NoticeDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NoticeDetailScreen(notice: args.notice),
      );
    },
    NoticeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NoticeScreen(),
      );
    },
    ReservationCheckTabDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ReservationCheckTabDetailsRouteArgs>(
          orElse: () => const ReservationCheckTabDetailsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ReservationCheckTabDetailsScreen(
          key: args.key,
          id: args.id,
          certificationNumber: args.certificationNumber,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
  };
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReservationScreen]
class ReservationRoute extends PageRouteInfo<void> {
  const ReservationRoute({List<PageRouteInfo>? children})
      : super(
          ReservationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReservationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NoticeDetailScreen]
class NoticeDetailRoute extends PageRouteInfo<NoticeDetailRouteArgs> {
  NoticeDetailRoute({
    required NoticeModel notice,
    List<PageRouteInfo>? children,
  }) : super(
          NoticeDetailRoute.name,
          args: NoticeDetailRouteArgs(notice: notice),
          initialChildren: children,
        );

  static const String name = 'NoticeDetailRoute';

  static const PageInfo<NoticeDetailRouteArgs> page =
      PageInfo<NoticeDetailRouteArgs>(name);
}

class NoticeDetailRouteArgs {
  const NoticeDetailRouteArgs({required this.notice});

  final NoticeModel notice;

  @override
  String toString() {
    return 'NoticeDetailRouteArgs{notice: $notice}';
  }
}

/// generated route for
/// [NoticeScreen]
class NoticeRoute extends PageRouteInfo<void> {
  const NoticeRoute({List<PageRouteInfo>? children})
      : super(
          NoticeRoute.name,
          initialChildren: children,
        );

  static const String name = 'NoticeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReservationCheckTabDetailsScreen]
class ReservationCheckTabDetailsRoute
    extends PageRouteInfo<ReservationCheckTabDetailsRouteArgs> {
  ReservationCheckTabDetailsRoute({
    Key? key,
    int? id,
    String? certificationNumber,
    List<PageRouteInfo>? children,
  }) : super(
          ReservationCheckTabDetailsRoute.name,
          args: ReservationCheckTabDetailsRouteArgs(
            key: key,
            id: id,
            certificationNumber: certificationNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'ReservationCheckTabDetailsRoute';

  static const PageInfo<ReservationCheckTabDetailsRouteArgs> page =
      PageInfo<ReservationCheckTabDetailsRouteArgs>(name);
}

class ReservationCheckTabDetailsRouteArgs {
  const ReservationCheckTabDetailsRouteArgs({
    this.key,
    this.id,
    this.certificationNumber,
  });

  final Key? key;

  final int? id;

  final String? certificationNumber;

  @override
  String toString() {
    return 'ReservationCheckTabDetailsRouteArgs{key: $key, id: $id, certificationNumber: $certificationNumber}';
  }
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
