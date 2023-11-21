import 'package:core/core.dart';
import 'package:dashboard/dashboard.dart';
import 'package:dashboard/src/domain/entity/history_entity.dart';

class GetHistoryUseCase implements UseCase<Future<HistoryEntity>> {
  final HistoryRepository _repository;

  const GetHistoryUseCase(this._repository);

  @override
  Future<HistoryEntity> call({required UseCaseParameter parameter}) async {
    GetHistoryUseCaseParameter param = parameter as GetHistoryUseCaseParameter;
    try {
      HistoryEntity entity = await _repository.getHistoryData(
          param.historyType, param.month, param.day);
      return entity;
    } on ApiException catch (_) {
      rethrow;
    }
  }
}

class GetHistoryUseCaseParameter extends UseCaseParameter {
  final HistoryType historyType;
  final int month;
  final int day;

  const GetHistoryUseCaseParameter({
    required this.historyType,
    required this.month,
    required this.day,
  });
}
