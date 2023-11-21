import 'package:core/core.dart';
import 'package:dashboard/src/domain/entity/history_entity.dart';

class TimelineState extends BaseState {
  final int selectedTab;
  final bool hideBottomNavigationView;
  final List<HistoryEntity> items;
  final TimelineStatus status;

  const TimelineState._({
    required this.selectedTab,
    required this.hideBottomNavigationView,
    required this.items,
    required this.status,
  });

  TimelineState copyWith({
    int? selectedTab,
    bool? hideBottomNavigationView,
    List<HistoryEntity>? items,
    TimelineStatus? status,
  }) {
    return TimelineState._(
      selectedTab: selectedTab ?? this.selectedTab,
      hideBottomNavigationView:
          hideBottomNavigationView ?? this.hideBottomNavigationView,
      items: items ?? this.items,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        selectedTab,
        hideBottomNavigationView,
        items,
        status,
      ];

  factory TimelineState.create() => const TimelineState._(
        selectedTab: 0,
        hideBottomNavigationView: true,
        items: [],
        status: TimelineStatus.loading,
      );
}

enum TimelineStatus { loading, loaded }
