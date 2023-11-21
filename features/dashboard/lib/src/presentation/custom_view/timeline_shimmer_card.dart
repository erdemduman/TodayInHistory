import 'package:flutter/material.dart';
import 'package:core/core.dart';

class TimelineShimmerCard extends StatelessWidget {
  final int index;
  final int listSize;

  const TimelineShimmerCard({
    super.key,
    required this.index,
    required this.listSize,
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
            color: Colors.black.withOpacity(0.65),
            thickness: 4,
          ),
          indicatorStyle: IndicatorStyle(
            width: 15,
            color: Colors.black.withOpacity(0.65),
            drawGap: true,
          ),
        ),
        TimelineDivider(
          begin: 0.18,
          end: 0.82,
          thickness: 4,
          color: Colors.black.withOpacity(0.65),
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
            child: Center(child: _buildContainer(startChild)),
          ),
          Expanded(
            flex: !startChild && _isIndexEven ? 9 : 0,
            child: const SizedBox(),
          )
        ],
      );

  bool get _isIndexEven => index % 2 == 0;

  Widget _buildContainer(bool startChild) {
    if ((startChild && _isIndexEven) || (!startChild && !_isIndexEven)) {
      return Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          height: 30,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          height: 30,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );
    }
  }
}
