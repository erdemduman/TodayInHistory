import 'package:project_th/logic/use_case/base_use_case.dart';
import 'package:project_th/model/event_item.dart';
import 'package:project_th/network/api/today_in_history_api.dart';

class GetEventUseCase extends BaseUseCase {
  GetEventUseCaseParameter? _parameter;
  GetEventUseCaseCallback? _callback;

  @override
  Future executeAsync(
      {BaseUseCaseParameter? parameter, BaseUseCaseCallback? callback}) async {
    _parameter = parameter as GetEventUseCaseParameter;
    _callback = callback as GetEventUseCaseCallback;

    apiExecuter.execute<EventItem>(
      action: TodayInHistoryApi.getEvents,
      param: {'month': _parameter?.month, 'day': _parameter?.day},
      onSuccess: (result) {
        _callback?.onGetEventSuccess(result);
      },
      onFail: (error) {
        _callback?.onGetEventFail(error);
      },
    );
  }
}

class GetEventUseCaseParameter extends BaseUseCaseParameter {
  int? month;
  int? day;
}

class GetEventUseCaseCallback extends BaseUseCaseCallback {
  void onGetEventSuccess(EventItem events) {}
  void onGetEventFail(Exception error) {}
}
