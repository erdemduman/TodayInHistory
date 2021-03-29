import 'package:flutter/material.dart';
import 'package:project_th/route/locator.dart';
import 'package:project_th/route/route_service.dart';

abstract class BaseBloc {
  @protected
  final RouteService routeService = locator<RouteService>();

  void init([BaseBlocParameter? parameter]);

  void dispose();
}

abstract class BaseBlocParameter {}
