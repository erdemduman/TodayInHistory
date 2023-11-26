import 'package:core/core.dart';
import 'package:dashboard/src/domain/entity/history_entity.dart';

class TimelineState extends BaseState {
  final int selectedTab;
  final String day;
  final String monthKey;
  final bool hideBottomNavigationView;
  final List<HistoryEntity> items;
  final TimelineStatus status;

  const TimelineState._({
    required this.selectedTab,
    required this.day,
    required this.monthKey,
    required this.hideBottomNavigationView,
    required this.items,
    required this.status,
  });

  TimelineState copyWith({
    int? selectedTab,
    String? day,
    String? monthKey,
    bool? hideBottomNavigationView,
    List<HistoryEntity>? items,
    TimelineStatus? status,
  }) {
    return TimelineState._(
      selectedTab: selectedTab ?? this.selectedTab,
      day: day ?? this.day,
      monthKey: monthKey ?? this.monthKey,
      hideBottomNavigationView:
          hideBottomNavigationView ?? this.hideBottomNavigationView,
      items: items ?? this.items,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        selectedTab,
        day,
        monthKey,
        hideBottomNavigationView,
        items,
        status,
      ];

  factory TimelineState.create() => TimelineState._(
        selectedTab: 0,
        day: DateTime.now().day.toString(),
        monthKey: DateTime.now().month.toMonthKey(),
        hideBottomNavigationView: true,
        items: const [],
        status: TimelineStatus.loading,
      );
}

enum TimelineStatus { loading, loaded }
