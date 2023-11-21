import 'package:core/core.dart';
import 'package:dashboard/src/data/data_source/history_data_source.dart';
import 'package:dashboard/src/data/mapper/history_mapper.dart';
import 'package:dashboard/src/domain/entity/history_entity.dart';
import 'package:dashboard/src/domain/repository/history_repository.dart';
import 'package:dashboard/src/enums.dart';

import '../model/history_model.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final HistoryDataSource _historyDataSource;

  const HistoryRepositoryImpl(this._historyDataSource);

  @override
  Future<HistoryEntity> getHistoryData(
    HistoryType historyType,
    int month,
    int day,
  ) async {
    try {
      HistoryModel model = await _historyDataSource.getHistoryData(
        historyType,
        month.toString(),
        day.toString(),
      );
      HistoryEntity entity = HistoryMapper.toEntity(model);
      return entity;
    } on ApiException catch (_) {
      rethrow;
    }
  }
}
