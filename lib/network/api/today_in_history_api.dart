import 'package:dio/dio.dart';
import 'package:project_th/model/birth_item.dart';
import 'package:project_th/model/death_item.dart';
import 'package:project_th/model/event_item.dart';

class TodayInHistoryApi {
  static const String BASE_URL = "https://byabbe.se/on-this-day";
  static final Dio _dio = Dio();

  static Future<EventItem> getEvents([Map<String, dynamic>? param]) async {
    var month = (param?['month'] as int).toString();
    var day = (param?['day'] as int).toString();
    final response = await _dio.get(BASE_URL + '/$month/$day/events.json');

    if (response.statusCode == 200) {
      return EventItem.fromJson(response.data);
    } else {
      throw Exception();
    }
  }

  static Future<BirthItem> getBirths([Map<String, dynamic>? param]) async {
    var month = (param?['month'] as int).toString();
    var day = (param?['day'] as int).toString();
    final response = await _dio.get(BASE_URL + '/$month/$day/births.json');

    if (response.statusCode == 200) {
      return BirthItem.fromJson(response.data);
    } else {
      throw Exception();
    }
  }

  static Future<DeathItem> getDeaths([Map<String, dynamic>? param]) async {
    var month = (param?['month'] as int).toString();
    var day = (param?['day'] as int).toString();
    final response = await _dio.get(BASE_URL + '/$month/$day/deaths.json');

    if (response.statusCode == 200) {
      return DeathItem.fromJson(response.data);
    } else {
      throw Exception();
    }
  }
}
