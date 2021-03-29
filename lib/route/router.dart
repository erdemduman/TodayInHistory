import 'package:flutter/material.dart';
import 'package:project_th/constants/routes.dart';
import 'package:project_th/logic/bloc/main_page_bloc.dart';
import 'package:project_th/view/page/main_page.dart';
import 'package:project_th/view/page/splash_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  final args = settings.arguments;

  switch (settings.name) {
    case Routes.splash_page:
      return MaterialPageRoute(builder: (context) => SplashPage());
    case Routes.main_page:
      return MaterialPageRoute(
        builder: (context) =>
            MainPage(parameters: args as MainPageBlocParameter?),
      );
    default:
      return MaterialPageRoute(builder: (context) {
        return Container(
          child: Center(
            child: Text("There is no such route :("),
          ),
        );
      });
  }
}
