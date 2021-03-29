import 'package:flutter/material.dart';
import 'package:project_th/route/locator.dart';
import 'package:project_th/route/route_service.dart';
import 'package:project_th/route/router.dart';

import 'constants/routes.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Today in History",
      onGenerateRoute: generateRoute,
      initialRoute: Routes.splash_page,
      navigatorKey: locator<RouteService>().routerKey,
      theme: ThemeData.from(colorScheme: ColorScheme.dark()),
    );
  }
}
