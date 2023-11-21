import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../di/di_init.dart';
import 'my_app.dart';

class AppExecuter {
  final BuildConfig buildConfig;

  const AppExecuter({required this.buildConfig});

  void execute() async {
    WidgetsFlutterBinding.ensureInitialized();

    InitDependencyInjection.init(buildConfig);

    await Hive.initFlutter();

    runApp(const MyApp());
  }
}
