import 'package:flutter/material.dart';
import 'package:project_th/logic/bloc/splash_page_bloc.dart';
import 'package:project_th/view/bloc_provider.dart';
import 'package:project_th/view/custom_view/loading_view.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashPageBloc>(
        bloc: SplashPageBloc(), child: SplashPageBody());
  }
}

class SplashPageBody extends StatefulWidget {
  @override
  _SplashPageBodyState createState() => _SplashPageBodyState();
}

class _SplashPageBodyState extends State<SplashPageBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoadingView(loadingText: "Fetching Data..."));
  }
}
