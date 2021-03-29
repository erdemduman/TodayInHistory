import 'package:get_it/get_it.dart';
import 'package:project_th/network/api_executer.dart';
import 'package:project_th/route/route_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => RouteService());
  locator.registerLazySingleton(() => ApiExecuter());
}
