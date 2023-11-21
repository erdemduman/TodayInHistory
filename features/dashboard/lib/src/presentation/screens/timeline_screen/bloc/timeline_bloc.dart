import 'package:core/core.dart';
import 'package:dashboard/src/domain/entity/history_entity.dart';
import 'package:dashboard/src/domain/use_case/get_history_use_case.dart';
import 'package:dashboard/src/enums.dart';

import 'timeline_event.dart';
import 'timeline_state.dart';

class TimelineBloc extends BaseBloc<TimelineEvent, TimelineState> {
  final GetHistoryUseCase _getHistoryUseCase;
  final Logger _logger;

  TimelineBloc(this._getHistoryUseCase, this._logger)
      : super(TimelineState.create()) {
    on<InitTimelineBlocEvent>(_initTimelineBloc);
    on<OnTapBottomBarEvent>(_onTapBottomBar);
    on<OnScrollEvent>(_onScroll);
  }

  @override
  void init({required BlocParameter parameter}) {
    _logger.d("Init");
    add(InitTimelineBlocEvent());
  }

  @override
  void dispose() {
    _logger.d("Dispose");
  }

  Future _initTimelineBloc(
      InitTimelineBlocEvent event, Emitter<TimelineState> emit) async {
    final List<HistoryEntity> responses = await Future.wait([
      _buildHistoryCall(HistoryType.events),
      _buildHistoryCall(HistoryType.births),
      _buildHistoryCall(HistoryType.deaths),
    ]);
    emit(
      state.copyWith(
        items: List.from(responses),
        status: TimelineStatus.loaded,
        hideBottomNavigationView: false,
      ),
    );
  }

  void _onTapBottomBar(
          OnTapBottomBarEvent event, Emitter<TimelineState> emit) =>
      emit(state.copyWith(selectedTab: event.index));

  Future<HistoryEntity> _buildHistoryCall(HistoryType historyType) =>
      _getHistoryUseCase(
        parameter: GetHistoryUseCaseParameter(
          historyType: historyType,
          month: DateTime.now().month,
          day: DateTime.now().day,
        ),
      );

  void _onScroll(OnScrollEvent event, Emitter<TimelineState> emit) =>
      emit(state.copyWith(hideBottomNavigationView: !event.scrollForward));
}
