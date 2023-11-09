import 'package:core/core.dart';
import 'package:dashboard/dashboard.dart';

class InitDependencyInjection {
  static void init(BuildConfig config) {
    //Other
    Injector.registerSingleton((c) => Logger());
    Injector.registerSingleton<BuildConfig>((c) => config);

    // Data Source

    // Repository

    // UseCase

    // Bloc
    Injector.registerFactory((c) => MainBloc(c<Logger>()));
    Injector.registerFactory((c) => ThemeBloc(c<Logger>()));
    Injector.registerFactory((c) => LanguageBloc(c<Logger>()));
  }
}
