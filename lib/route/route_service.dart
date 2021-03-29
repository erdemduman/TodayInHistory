import 'package:flutter/widgets.dart';

class RouteService {
  final GlobalKey<NavigatorState> routerKey = GlobalKey<NavigatorState>();

  RouteService();

  Future<dynamic>? goToRoute(String route, {Object? arguments = null}) {
    return routerKey.currentState?.pushNamed(route, arguments: arguments);
  }

  void goBack() {
    routerKey.currentState?.pop();
  }
}
