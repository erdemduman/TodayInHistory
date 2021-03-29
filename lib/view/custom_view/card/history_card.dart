import 'package:flutter/material.dart';
import 'package:project_th/constants/styles.dart';
import 'package:timeline_tile/timeline_tile.dart';

class HistoryCard extends StatelessWidget {
  final bool isIndexEven;
  final String year;
  final String text;

  HistoryCard(
      {required this.isIndexEven, required this.year, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _getTimelineTile(),
        TimelineDivider(
          begin: 0.18,
          end: 0.82,
          thickness: 4,
          color: Styles.getSelectedBoxColor(),
        ),
      ],
    );
  }

  TimelineTile _getTimelineTile() {
    if (isIndexEven) {
      return TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0.18,
        isFirst: false,
        startChild: Container(child: Center(child: Text(year))),
        endChild: Row(
          children: [
            Expanded(
              flex: 8,
              child: Container(
                margin: EdgeInsets.only(bottom: 20, top: 20, left: 10),
                child: Center(child: Text(text, textAlign: TextAlign.center)),
              ),
            ),
            Expanded(flex: 3, child: Container()),
          ],
        ),
        indicatorStyle: IndicatorStyle(
            width: 15, color: Styles.getSelectedBoxColor(), drawGap: true),
        beforeLineStyle: LineStyle(
          color: Styles.getSelectedBoxColor(),
          thickness: 4,
        ),
      );
    } else {
      return TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0.82,
        isFirst: false,
        startChild: Row(
          children: [
            Expanded(flex: 3, child: Container()),
            Expanded(
              flex: 8,
              child: Container(
                margin: EdgeInsets.only(bottom: 20, top: 20, right: 10),
                child: Center(child: Text(text, textAlign: TextAlign.center)),
              ),
            ),
          ],
        ),
        endChild: Container(child: Center(child: Text(year))),
        indicatorStyle: IndicatorStyle(
            width: 15, color: Styles.getSelectedBoxColor(), drawGap: true),
        beforeLineStyle: LineStyle(
          color: Styles.getSelectedBoxColor(),
          thickness: 4,
        ),
      );
    }
  }
}
