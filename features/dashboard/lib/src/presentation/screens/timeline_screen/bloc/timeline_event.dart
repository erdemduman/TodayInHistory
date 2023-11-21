import 'package:core/core.dart';

abstract class TimelineEvent extends BaseEvent {
  const TimelineEvent();
}

class InitTimelineBlocEvent extends TimelineEvent {
  @override
  List<Object?> get props => [];
}

class OnTapBottomBarEvent extends TimelineEvent {
  final int index;

  const OnTapBottomBarEvent({required this.index});

  @override
  List<Object?> get props => [index];
}

class OnScrollEvent extends TimelineEvent {
  final bool scrollForward;

  const OnScrollEvent({required this.scrollForward});

  @override
  List<Object?> get props => [scrollForward];
}
