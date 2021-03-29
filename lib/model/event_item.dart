import 'package:project_th/model/today_in_history.dart';

class EventItem {
  String? wikipedia;
  String? date;
  List<TodayInHistory>? events;

  EventItem({this.wikipedia, this.date, this.events});

  EventItem.fromJson(Map<String, dynamic> json) {
    wikipedia = json['wikipedia'];
    date = json['date'];
    if (json['events'] != null) {
      events = [];
      json['events'].forEach((v) {
        events?.add(TodayInHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wikipedia'] = this.wikipedia;
    data['date'] = this.date;
    if (this.events != null) {
      data['events'] = this.events?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
