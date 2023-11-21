import 'package:core/core.dart';
import 'package:dashboard/src/data/model/history_model.dart';

import '../../enums.dart';

abstract class HistoryDataSource {
  Future<HistoryModel> getHistoryData(
    HistoryType historyType,
    String month,
    String day,
  );
}

class HistoryDataSourceImpl implements HistoryDataSource {
  final Dio _dio;

  const HistoryDataSourceImpl(this._dio);

  @override
  Future<HistoryModel> getHistoryData(
    HistoryType historyType,
    String month,
    String day,
  ) async {
    String baseUrl =
        Injector.resolve<BuildConfig>().config[AppConstants.baseUrl] ?? "";
    String historyTypeString = historyType == HistoryType.events
        ? "events"
        : historyType == HistoryType.births
            ? "births"
            : "deaths";
    var response =
        await _dio.get("$baseUrl/$month/$day/$historyTypeString.json");
    if (response.statusCode == 200) {
      return HistoryModel.fromJson(response.data, type: historyTypeString);
    } else {
      throw ApiException();
    }
  }
}
