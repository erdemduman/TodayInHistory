import 'package:core/core.dart';

import '../app_executer.dart';

/// Add the desired config inside the map.
class ProdBuild implements BuildConfig {
  @override
  final Map<String, String> config = {
    AppConstants.baseUrl: 'https://byabbe.se/on-this-day',
    AppConstants.versionName: 'prod',
  };
}

void main() => AppExecuter(buildConfig: ProdBuild()).execute();
