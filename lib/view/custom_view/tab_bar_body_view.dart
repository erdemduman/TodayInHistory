import 'package:flutter/material.dart';
import 'package:project_th/constants/const_fields.dart';
import 'package:project_th/logic/bloc/main_page_bloc.dart';
import 'package:project_th/view/bloc_provider.dart';
import 'package:project_th/view/custom_view/edit_date_dialog.dart';
import 'package:project_th/view/custom_view/history_view.dart';
import 'package:project_th/view/custom_view/history_view_body.dart';

class TabBarBodyView extends StatelessWidget {
  final TabController? controller;

  TabBarBodyView({required this.controller});

  @override
  Widget build(BuildContext context) {
    MainPageBloc? bloc = BlocProvider.of<MainPageBloc>(context);
    return Container(
      child: Stack(
        children: [
          TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: controller,
            children: [
              HistoryView(historyState: HistoryState.EVENT),
              HistoryView(historyState: HistoryState.BIRTH),
              HistoryView(historyState: HistoryState.DEATH),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              child: Container(
                height: 70,
                width: 70,
                margin: EdgeInsets.only(bottom: 30, right: 30),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Colors.black26),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: StreamBuilder<Calendar?>(
                  stream: bloc?.calendarStream,
                  builder: (context, snapshot) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          snapshot.data?.day?.toString() ?? "1",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                            ConstFields.intToMonth[snapshot.data?.month] ??
                                "Jan",
                            style: TextStyle(color: Colors.black))
                      ],
                    );
                  },
                ),
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) => EditDateDialog(bloc: bloc));
              },
            ),
          ),
        ],
      ),
    );
  }
}
