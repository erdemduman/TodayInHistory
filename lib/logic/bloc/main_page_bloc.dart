import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_th/logic/bloc/base_bloc.dart';
import 'package:project_th/logic/use_case/get_birth_use_case.dart';
import 'package:project_th/logic/use_case/get_death_use_case.dart';
import 'package:project_th/logic/use_case/get_event_use_case.dart';
import 'package:project_th/logic/utils/task_flow.dart';
import 'package:project_th/model/birth_item.dart';
import 'package:project_th/model/death_item.dart';
import 'package:project_th/model/event_item.dart';
import 'package:rxdart/subjects.dart';

class MainPageBloc extends BaseBloc
    implements
        GetEventUseCaseCallback,
        GetBirthUseCaseCallback,
        GetDeathUseCaseCallback {
  final _getEventUseCase = GetEventUseCase();
  final _getBirthUseCase = GetBirthUseCase();
  final _getDeathUseCase = GetDeathUseCase();

  final _getEventController = BehaviorSubject<EventItem?>();
  final _getBirthController = BehaviorSubject<BirthItem?>();
  final _getDeathController = BehaviorSubject<DeathItem?>();
  final _themeColorController = BehaviorSubject<Color?>();
  final _calendarController = BehaviorSubject<Calendar?>();

  TaskFlow? _taskFlow;
  EventItem? _events;
  BirthItem? _births;
  DeathItem? _deaths;
  Calendar? _calendar;
  MainPageBlocParameter? _parameter;

  Stream<EventItem?> get getEventStream => _getEventController.stream;
  Stream<BirthItem?> get getBirthStream => _getBirthController.stream;
  Stream<DeathItem?> get getDeathStream => _getDeathController.stream;
  Stream<Color?> get themeColorStream => _themeColorController.stream;
  Stream<Calendar?> get calendarStream => _calendarController.stream;

  @override
  void init([BaseBlocParameter? parameter]) {
    setTab(0);
    _calendar = Calendar()
      ..month = DateTime.now().month
      ..day = DateTime.now().day;
    _parameter = parameter as MainPageBlocParameter?;
    _events = _parameter?.eventItem;
    _births = _parameter?.birthItem;
    _deaths = _parameter?.deathItem;

    if (_events != null && _births != null && _deaths != null) {
      _sinkHistory();
      _calendarController.sink.add(_calendar);
    } else
      setDate(_calendar!);
  }

  void setTab(int? tabNumber) {
    if (tabNumber == 0)
      _themeColorController.sink.add(Colors.purple[900]);
    else if (tabNumber == 1)
      _themeColorController.sink.add(Colors.green[900]);
    else if (tabNumber == 2) _themeColorController.sink.add(Colors.red[900]);
  }

  void setDate(Calendar calendar) {
    _calendar?.month = calendar.month;
    _calendar?.day = calendar.day;
    _calendarController.sink.add(_calendar);
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
          ..month = _calendar?.month
          ..day = _calendar?.day,
        callback: this);
  }

  @override
  void onGetEventSuccess(EventItem events) {
    _events = events;
    _taskFlow?.next();
  }

  @override
  void onGetEventFail(Exception error) {}

  void getBirth() async {
    await _getBirthUseCase.executeAsync(
        parameter: GetBirthUseCaseParameter()
          ..month = _calendar?.month
          ..day = _calendar?.day,
        callback: this);
  }

  @override
  void onGetBirthSuccess(BirthItem births) {
    _births = births;
    _taskFlow?.next();
  }

  @override
  void onGetBirthFail(Exception error) {}

  void getDeath() async {
    await _getDeathUseCase.executeAsync(
        parameter: GetDeathUseCaseParameter()
          ..month = _calendar?.month
          ..day = _calendar?.day,
        callback: this);
  }

  @override
  void onGetDeathSuccess(DeathItem deaths) {
    _deaths = deaths;
    _taskFlow?.next();
  }

  @override
  void onGetDeathFail(Exception error) {}

  void _onSuccess() {
    _sinkHistory();
  }

  void _onFail([Object? error]) {}

  void _sinkHistory() {
    _getEventController.sink.add(_events);
    _getBirthController.sink.add(_births);
    _getDeathController.sink.add(_deaths);
  }

  @override
  void dispose() {
    _getEventController.close();
    _getBirthController.close();
    _getDeathController.close();
    _themeColorController.close();
    _calendarController.close();
  }
}

class MainPageBlocParameter extends BaseBlocParameter {
  EventItem? eventItem;
  BirthItem? birthItem;
  DeathItem? deathItem;
}

class Calendar {
  int? month;
  int? day;
}
