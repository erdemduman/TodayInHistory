import 'package:core/core.dart';
import 'package:dashboard/dashboard.dart';

class InitDependencyInjection {
  static void init(BuildConfig config) {
    //Other
    Injector.registerSingleton((c) => Logger());
    Injector.registerSingleton<BuildConfig>((c) => config);
    Injector.registerSingleton<Dio>((c) => Dio());

    // Data Source
    Injector.registerSingleton<HistoryDataSource>(
      (c) => HistoryDataSourceImpl(c<Dio>()),
    );
    Injector.registerSingleton<LocalDataSource>(
      (c) => LocalDataSourceImpl(c<Logger>()),
    );

    // Repository
    Injector.registerSingleton<HistoryRepository>(
      (c) => HistoryRepositoryImpl(
        c<HistoryDataSource>(),
      ),
    );

    // UseCase
    Injector.registerSingleton(
      (c) => GetHistoryUseCase(c<HistoryRepository>()),
    );

    // Bloc
    Injector.registerFactory(
      (c) => TimelineBloc(
        c<GetHistoryUseCase>(),
        c<Logger>(),
      ),
    );
    Injector.registerFactory((c) => ThemeBloc(c<Logger>()));
    Injector.registerFactory((c) => LanguageBloc(c<Logger>()));
  }
}
