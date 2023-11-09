import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SharedBlocProvider(
      child: const MaterialApp(
        title: 'Today in History',
        initialRoute: Routes.main,
        onGenerateRoute: AppRouter.generateRoute,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [Locale('en')],
      ),
    );
  }
}
