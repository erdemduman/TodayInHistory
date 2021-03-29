import 'package:project_th/constants/routes.dart';
import 'package:project_th/logic/bloc/base_bloc.dart';
import 'package:project_th/logic/bloc/main_page_bloc.dart';
import 'package:project_th/logic/use_case/get_birth_use_case.dart';
import 'package:project_th/logic/use_case/get_death_use_case.dart';
import 'package:project_th/logic/use_case/get_event_use_case.dart';
import 'package:project_th/logic/utils/task_flow.dart';
import 'package:project_th/model/birth_item.dart';
import 'package:project_th/model/death_item.dart';
import 'package:project_th/model/event_item.dart';

class SplashPageBloc extends BaseBloc
    implements
        GetEventUseCaseCallback,
        GetBirthUseCaseCallback,
        GetDeathUseCaseCallback {
  final _getEventUseCase = GetEventUseCase();
  final _getBirthUseCase = GetBirthUseCase();
  final _getDeathUseCase = GetDeathUseCase();

  TaskFlow? _taskFlow;
  int? _month;
  int? _day;

  EventItem? _events;
  BirthItem? _births;
  DeathItem? _deaths;

  @override
  void init([BaseBlocParameter? parameter]) {
    _month = DateTime.now().month;
    _day = DateTime.now().day;
    _taskFlow = TaskFlow.create([
      Task(action: getEvent),
      Task(action: getBirth),
      Task(action: getDeath)
    ]);
    _taskFlow?.start(onSuccess: _onSuccess, onFail: _onFail);
  }

  void getEvent() async {
    await _getEventUseCase.executeAsync(
        parameter: GetEventUseCaseParameter()
          ..month = _month
          ..day = _day,
        callback: this);
  }

  @override
  void onGetEventSuccess(EventItem events) {
    _events = events;
    _taskFlow?.next();
  }

  @override
  void onGetEventFail(Exception error) {
    _taskFlow?.fail();
  }

  void getBirth() async {
    await _getBirthUseCase.executeAsync(
        parameter: GetBirthUseCaseParameter()
          ..month = _month
          ..day = _day,
        callback: this);
  }

  @override
  void onGetBirthSuccess(BirthItem births) {
    _births = births;
    _taskFlow?.next();
  }

  @override
  void onGetBirthFail(Exception error) {
    _taskFlow?.fail();
  }

  void getDeath() async {
    await _getDeathUseCase.executeAsync(
        parameter: GetDeathUseCaseParameter()
          ..month = _month
          ..day = _day,
        callback: this);
  }

  @override
  void onGetDeathSuccess(DeathItem deaths) {
    _deaths = deaths;
    _taskFlow?.next();
  }

  @override
  void onGetDeathFail(Exception error) {
    _taskFlow?.fail();
  }

  void _onSuccess() {
    routeService.goToRoute(Routes.main_page,
        arguments: MainPageBlocParameter()
          ..eventItem = _events
          ..birthItem = _births
          ..deathItem = _deaths);
  }

  void _onFail([Object? error]) {}

  @override
  void dispose() {}
}
