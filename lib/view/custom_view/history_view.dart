import 'package:flutter/material.dart';
import 'package:project_th/logic/bloc/main_page_bloc.dart';
import 'package:project_th/view/bloc_provider.dart';

import 'history_view_body.dart';

class HistoryView extends StatelessWidget {
  final HistoryState historyState;

  HistoryView({required this.historyState});

  @override
  Widget build(BuildContext context) {
    MainPageBloc? bloc = BlocProvider.of<MainPageBloc>(context);
    return Container(
      child: Stack(
        children: [
          StreamBuilder<Color?>(
              stream: bloc?.themeColorStream,
              builder: (context, snapshot) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: snapshot.data?.withOpacity(0.25),
                  ),
                  child: HistoryViewBody(historyState: historyState),
                );
              })
        ],
      ),
    );
  }
}
