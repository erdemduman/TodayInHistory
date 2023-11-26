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
  late ScrollController _scrollController;

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
      builder: (context, state) => SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: HistoryAppBar(
            day: state.day,
            month: context.strId.months(state.monthKey),
            backgroundColor: Styles.themeColor(
              selectedTab: state.selectedTab,
              componentType: ComponentType.bar,
            ),
            buttonColor: Styles.themeColor(
              selectedTab: state.selectedTab,
              componentType: ComponentType.button,
            ),
            height: !state.hideBottomNavigationView ? Styles.appBarHeight : 0,
            onTap: () {},
          ),
          backgroundColor: Styles.themeColor(
            selectedTab: state.selectedTab,
            componentType: ComponentType.background,
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
                    itemBuilder: ((context, index) =>
                        state.status != TimelineStatus.loading
                            ? TimelineCard(
                                index: index,
                                listSize: itemCount,
                                year: state
                                    .items[state.selectedTab].body[index].year,
                                description: state.items[state.selectedTab]
                                    .body[index].description,
                              )
                            : ShimmerLoading(
                                isLoading: true,
                                child: TimelineShimmerCard(
                                  index: index,
                                  listSize: itemCount,
                                ),
                              )),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: BottomNavigationView(
                      height: !state.hideBottomNavigationView
                          ? Styles.bottomNavigationViewHeight
                          : 0,
                      width: Styles.bottomNavigationViewWidth,
                      backgroundColor: Styles.themeColor(
                        selectedTab: state.selectedTab,
                        componentType: ComponentType.bar,
                      ),
                      onItemSelected: (index) {
                        _bloc?.add(OnTapBottomBarEvent(index: index));
                        _scrollController.animateTo(
                          0,
                          duration: Styles.animationDuration,
                          curve: Curves.linearToEaseOut,
                        );
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
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  void _scrollListener() {
    final isScrollingReverse = _scrollController.position.userScrollDirection ==
        ScrollDirection.reverse;
    final isScrollingForward = _scrollController.position.userScrollDirection ==
        ScrollDirection.forward;

    if (isScrollingReverse) {
      _bloc?.add(const OnScrollEvent(scrollForward: false));
    } else if (isScrollingForward) {
      _bloc?.add(const OnScrollEvent(scrollForward: true));
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
