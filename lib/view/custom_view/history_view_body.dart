import 'package:flutter/material.dart';
import 'package:project_th/logic/bloc/main_page_bloc.dart';
import 'package:project_th/model/birth_item.dart';
import 'package:project_th/model/death_item.dart';
import 'package:project_th/model/event_item.dart';
import 'package:project_th/view/bloc_provider.dart';
import 'package:project_th/view/custom_view/card/history_card.dart';

class HistoryViewBody extends StatelessWidget {
  final HistoryState historyState;

  HistoryViewBody({required this.historyState});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: _HistoryStreamBuilder(historyState: historyState));
  }
}

class _HistoryStreamBuilder extends StatelessWidget {
  final HistoryState historyState;

  _HistoryStreamBuilder({required this.historyState});

  @override
  Widget build(BuildContext context) {
    MainPageBloc? bloc = BlocProvider.of<MainPageBloc>(context);
    return _getStreamBuilder(bloc);
  }

  StreamBuilder _getStreamBuilder(MainPageBloc? bloc) {
    if (historyState == HistoryState.EVENT) {
      return StreamBuilder<EventItem?>(
        stream: bloc?.getEventStream,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data?.events?.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return HistoryCard(
                  isIndexEven: index % 2 == 0,
                  year: snapshot.data?.events?[index].year ?? "Year",
                  text: snapshot.data?.events?[index].description ??
                      "No data fetched");
            },
          );
        },
      );
    } else if (historyState == HistoryState.BIRTH) {
      return StreamBuilder<BirthItem?>(
        stream: bloc?.getBirthStream,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data?.births?.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return HistoryCard(
                  isIndexEven: index % 2 == 0,
                  year: snapshot.data?.births?[index].year ?? "Year",
                  text: snapshot.data?.births?[index].description ??
                      "No data fetched");
            },
          );
        },
      );
    } else {
      return StreamBuilder<DeathItem?>(
        stream: bloc?.getDeathStream,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data?.deaths?.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return HistoryCard(
                  isIndexEven: index % 2 == 0,
                  year: snapshot.data?.deaths?[index].year ?? "Year",
                  text: snapshot.data?.deaths?[index].description ??
                      "No data fetched");
            },
          );
        },
      );
    }
  }
}

enum HistoryState { EVENT, BIRTH, DEATH }
