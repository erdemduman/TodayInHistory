import 'package:project_th/model/birth_item.dart';
import 'package:project_th/network/api/today_in_history_api.dart';

import 'base_use_case.dart';

class GetBirthUseCase extends BaseUseCase {
  GetBirthUseCaseParameter? _parameter;
  GetBirthUseCaseCallback? _callback;

  @override
  Future executeAsync(
      {BaseUseCaseParameter? parameter, BaseUseCaseCallback? callback}) async {
    _parameter = parameter as GetBirthUseCaseParameter;
    _callback = callback as GetBirthUseCaseCallback;

    apiExecuter.execute<BirthItem>(
      action: TodayInHistoryApi.getBirths,
      param: {'month': _parameter?.month, 'day': _parameter?.day},
      onSuccess: (result) {
        _callback?.onGetBirthSuccess(result);
      },
      onFail: (error) {
        _callback?.onGetBirthFail(error);
      },
    );
  }
}

class GetBirthUseCaseParameter extends BaseUseCaseParameter {
  int? month;
  int? day;
}

class GetBirthUseCaseCallback extends BaseUseCaseCallback {
  void onGetBirthSuccess(BirthItem births) {}
  void onGetBirthFail(Exception error) {}
}
