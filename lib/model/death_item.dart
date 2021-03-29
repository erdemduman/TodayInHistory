import 'package:project_th/model/today_in_history.dart';

class DeathItem {
  String? wikipedia;
  String? date;
  List<TodayInHistory>? deaths;

  DeathItem({this.wikipedia, this.date, this.deaths});

  DeathItem.fromJson(Map<String, dynamic> json) {
    wikipedia = json['wikipedia'];
    date = json['date'];
    if (json['deaths'] != null) {
      deaths = [];
      json['deaths'].forEach((v) {
        deaths?.add(new TodayInHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wikipedia'] = this.wikipedia;
    data['date'] = this.date;
    if (this.deaths != null) {
      data['deaths'] = this.deaths?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
