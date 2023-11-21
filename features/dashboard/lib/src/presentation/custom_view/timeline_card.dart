import 'package:flutter/material.dart';
import 'package:core/core.dart';

class TimelineCard extends StatelessWidget {
  final int index;
  final int listSize;
  final String year;
  final String description;

  const TimelineCard({
    super.key,
    required this.index,
    required this.listSize,
    required this.year,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: _isIndexEven ? 0.18 : 0.82,
          isFirst: index == 0,
          isLast: index == listSize - 1,
          startChild: _childBuilder(true),
          endChild: _childBuilder(false),
          beforeLineStyle: LineStyle(
            color: Colors.white.withOpacity(0.65),
            thickness: 4,
          ),
          indicatorStyle: IndicatorStyle(
            width: 15,
            color: Colors.white.withOpacity(0.65),
            drawGap: true,
          ),
        ),
        Visibility(
          visible: index != listSize - 1,
          child: TimelineDivider(
            begin: 0.18,
            end: 0.82,
            thickness: 4,
            color: Colors.white.withOpacity(0.65),
          ),
        ),
      ],
    );
  }

  Widget _childBuilder(bool startChild) => Row(
        children: [
          Expanded(
            flex: startChild && !_isIndexEven ? 9 : 0,
            child: const SizedBox(),
          ),
          Expanded(
            flex: 32,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  (startChild && _isIndexEven) || (!startChild && !_isIndexEven)
                      ? year
                      : description,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            flex: !startChild && _isIndexEven ? 9 : 0,
            child: const SizedBox(),
          )
        ],
      );

  bool get _isIndexEven => index % 2 == 0;
}
