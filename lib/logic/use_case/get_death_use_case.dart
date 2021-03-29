import 'package:project_th/model/death_item.dart';
import 'package:project_th/network/api/today_in_history_api.dart';

import 'base_use_case.dart';

class GetDeathUseCase extends BaseUseCase {
  GetDeathUseCaseParameter? _parameter;
  GetDeathUseCaseCallback? _callback;

  @override
  Future executeAsync(
      {BaseUseCaseParameter? parameter, BaseUseCaseCallback? callback}) async {
    _parameter = parameter as GetDeathUseCaseParameter;
    _callback = callback as GetDeathUseCaseCallback;

    apiExecuter.execute<DeathItem>(
      action: TodayInHistoryApi.getDeaths,
      param: {'month': _parameter?.month, 'day': _parameter?.day},
      onSuccess: (result) {
        _callback?.onGetDeathSuccess(result);
      },
      onFail: (error) {
        _callback?.onGetDeathFail(error);
      },
    );
  }
}

class GetDeathUseCaseParameter extends BaseUseCaseParameter {
  int? month;
  int? day;
}

class GetDeathUseCaseCallback extends BaseUseCaseCallback {
  void onGetDeathSuccess(DeathItem deaths) {}
  void onGetDeathFail(Exception error) {}
}
