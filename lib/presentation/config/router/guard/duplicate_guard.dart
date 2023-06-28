
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';

class DuplicateGuard extends AutoRouteGuard {
  DuplicateGuard();

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (resolver.route.name == router.current.name) {
      debugPrint('🌹 DuplicateGuard: ${resolver.route.name} 중복된 화면입니다.');
      resolver.next(false);
    } else {
      resolver.next(true);
    }
  }
}