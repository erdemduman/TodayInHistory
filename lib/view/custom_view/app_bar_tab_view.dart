import 'package:flutter/material.dart';
import 'package:project_th/logic/bloc/main_page_bloc.dart';
import 'package:project_th/view/bloc_provider.dart';
import 'package:project_th/constants/styles.dart';

class AppBarTabView extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);

  final TabController? controller;

  AppBarTabView({required this.controller});

  @override
  Widget build(BuildContext context) {
    MainPageBloc? bloc = BlocProvider.of<MainPageBloc>(context);
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: StreamBuilder<Color?>(
          stream: bloc?.themeColorStream,
          builder: (context, snapshot) {
            return AppBar(
              backgroundColor: snapshot.data?.withOpacity(0.5),
              elevation: 0,
              bottom: TabBar(
                controller: controller,
                onTap: (value) => bloc?.setTab(value),
                labelColor: snapshot.data,
                unselectedLabelColor: Colors.white70,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    color: Styles.getSelectedBoxColor()),
                tabs: [
                  Tab(
                      child: Align(
                          alignment: Alignment.center, child: Text("Event"))),
                  Tab(
                      child: Align(
                          alignment: Alignment.center, child: Text("Birth"))),
                  Tab(
                      child: Align(
                          alignment: Alignment.center, child: Text("Death"))),
                ],
              ),
            );
          }),
    );
  }
}
