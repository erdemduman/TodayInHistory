import 'package:core/core.dart';
import 'package:dashboard/dashboard.dart';
import 'package:dashboard/src/presentation/custom_view/timeline_card.dart';
import 'package:dashboard/src/presentation/custom_view/timeline_shimmer_card.dart';
import 'package:dashboard/src/presentation/screens/timeline_screen/bloc/timeline_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'bloc/timeline_state.dart';

class TimelineScreen extends StatefulWidget {
  final BlocNoParameter parameter;

  const TimelineScreen({super.key, required this.parameter});

  @override
  State<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      bloc: Injector.resolve<TimelineBloc>(),
      parameter: widget.parameter,
      child: const TimelineScreenBody(),
    );
  }
}

class TimelineScreenBody extends StatefulWidget {
  const TimelineScreenBody({super.key});

  @override
  State<TimelineScreenBody> createState() => _TimelineScreenBodyState();
}

class _TimelineScreenBodyState extends State<TimelineScreenBody> {
  TimelineBloc? _bloc;
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _bloc = BaseScreen.of<TimelineBloc>(context);
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TimelineBloc, TimelineState>(
      listenWhen: (previous, current) => false,
      listener: ((context, state) {}),
      buildWhen: (previous, current) =>
          previous.selectedTab != current.selectedTab ||
          previous.status != current.status ||
          previous.items != current.items ||
          previous.hideBottomNavigationView != current.hideBottomNavigationView,
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: _getBackgroundColor(selectedTab: state.selectedTab),
        ),
        backgroundColor: _getBackgroundColor(
          selectedTab: state.selectedTab,
          isBody: true,
        ),
        body: Shimmer(
          linearGradient: Styles.shimmerGradient,
          child: Builder(builder: (context) {
            var itemCount = state.status == TimelineStatus.loading
                ? 50
                : state.items[state.selectedTab].body.length;
            return Stack(
              children: [
                ListView.builder(
                  controller: _scrollController,
                  physics: state.status == TimelineStatus.loading
                      ? const NeverScrollableScrollPhysics()
                      : null,
                  itemCount: itemCount,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) => state.status !=
                          TimelineStatus.loading
                      ? TimelineCard(
                          index: index,
                          listSize: itemCount,
                          year: state.items[state.selectedTab].body[index].year,
                          description: state
                              .items[state.selectedTab].body[index].description,
                        )
                      : ShimmerLoading(
                          isLoading: true,
                          child: TimelineShimmerCard(
                            index: index,
                            listSize: itemCount,
                          ),
                        )),
                ),
                AnimatedSize(
                  curve: Curves.easeInQuad,
                  duration: const Duration(milliseconds: 600),
                  child: Visibility(
                    visible: !state.hideBottomNavigationView,
                    child: BottomNavigationView(
                      backgroundColor:
                          _getBackgroundColor(selectedTab: state.selectedTab),
                      onItemSelected: (index) {
                        _bloc?.add(OnTapBottomBarEvent(index: index));
                      },
                      selectedIndex: state.selectedTab,
                      items: [
                        BottomNavigationViewItem(
                          icon: Icons.event_note_rounded,
                          label: context.strId.events,
                        ),
                        BottomNavigationViewItem(
                          icon: Icons.child_care_rounded,
                          label: context.strId.births,
                        ),
                        BottomNavigationViewItem(
                          icon: Icons.airline_seat_flat_rounded,
                          label: context.strId.deaths,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Color _getBackgroundColor({required int selectedTab, bool isBody = false}) {
    switch (selectedTab) {
      case 0:
        return const Color.fromARGB(255, 13, 71, 161)
            .withOpacity(isBody ? 0.1 : 0.5);
      case 1:
        return const Color.fromARGB(255, 25, 88, 29)
            .withOpacity(isBody ? 0.1 : 0.5);
      case 2:
        return const Color.fromARGB(255, 183, 28, 28)
            .withOpacity(isBody ? 0.1 : 0.5);
      default:
        return const Color.fromARGB(255, 183, 28, 28)
            .withOpacity(isBody ? 0.1 : 0.5);
    }
  }

  void _scrollListener() {
    if (_scrollController?.position.userScrollDirection ==
        ScrollDirection.reverse) {
      _bloc?.add(const OnScrollEvent(scrollForward: false));
    } else if (_scrollController?.position.userScrollDirection ==
        ScrollDirection.forward) {
      _bloc?.add(const OnScrollEvent(scrollForward: true));
    }
  }
}
