import 'package:flutter/material.dart';
import 'package:project_th/logic/bloc/main_page_bloc.dart';
import 'package:project_th/view/bloc_provider.dart';
import 'package:project_th/view/custom_view/app_bar_tab_view.dart';
import 'package:project_th/view/custom_view/tab_bar_body_view.dart';

class MainPage extends StatefulWidget {
  final MainPageBlocParameter? parameters;

  MainPage({this.parameters});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainPageBloc>(
      bloc: MainPageBloc(),
      child: MainPageBody(),
      parameter: widget.parameters,
    );
  }
}

class MainPageBody extends StatefulWidget {
  @override
  _MainPageBodyState createState() => _MainPageBodyState();
}

class _MainPageBodyState extends State<MainPageBody>
    with TickerProviderStateMixin {
  MainPageBloc? _bloc;
  TabController? _controller;

  @override
  void initState() {
    _bloc = BlocProvider.of<MainPageBloc>(context);
    _controller = TabController(length: 3, vsync: this);
    _controller?.addListener(() {
      _bloc?.setTab(_controller?.index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBarTabView(controller: _controller),
          body: TabBarBodyView(controller: _controller),
        ));
  }
}
