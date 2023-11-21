import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SharedBlocProvider(
      child: MaterialApp(
        title: 'Today in History',
        initialRoute: Routes.timeline,
        onGenerateRoute: AppRouter.generateRoute,
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en')],
      ),
    );
  }
}
