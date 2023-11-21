import 'package:core/core.dart';

import '../app_executer.dart';

/// Add the desired config inside the map.
class PreProdBuild implements BuildConfig {
  @override
  final Map<String, String> config = {
    AppConstants.baseUrl: 'https://byabbe.se/on-this-day',
    AppConstants.versionName: 'preprod',
  };
}

void main() => AppExecuter(buildConfig: PreProdBuild()).execute();
