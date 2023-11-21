import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screens/timeline_screen/timeline_screen.dart';

class DashboardRouter with RouteMixin implements Routable {
  @override
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.timeline:
        return getScreen(
          const TimelineScreen(parameter: BlocNoParameter()),
          settings,
        );
      default:
        return getScreen(
          const Center(
            child: Text("There is no such route :("),
          ),
          settings,
        );
    }
  }
}
