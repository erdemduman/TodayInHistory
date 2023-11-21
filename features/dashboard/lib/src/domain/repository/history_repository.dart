import 'package:dashboard/src/domain/entity/history_entity.dart';
import 'package:dashboard/src/enums.dart';

abstract class HistoryRepository {
  Future<HistoryEntity> getHistoryData(
    HistoryType historyType,
    int month,
    int day,
  );
}
