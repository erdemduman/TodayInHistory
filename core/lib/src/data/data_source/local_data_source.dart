import 'package:core/src/exception/local_exception.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

abstract class LocalDataSource {
  Future<void> saveData(String boxName, String key, String data);

  Future<String> getData(String boxName, String key);
}

class LocalDataSourceImpl implements LocalDataSource {
  final Logger _logger;

  const LocalDataSourceImpl(this._logger);

  @override
  Future<void> saveData(String boxName, String key, String data) async {
    try {
      Box box = await Hive.openBox(boxName);
      await box.put(key, data);
      _logger.d("Key: $key, Data: $data");
      await box.close();
    } catch (_) {
      throw const LocalException();
    }
  }

  @override
  Future<String> getData(String boxName, String key) async {
    try {
      Box box = await Hive.openBox(boxName);
      var data = await box.get(boxName, defaultValue: "") as String;
      _logger.d("Data: $data");
      await box.close();
      return data;
    } catch (_) {
      throw const LocalException();
    }
  }
}
