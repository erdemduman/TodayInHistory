import 'package:project_th/model/today_in_history.dart';

class BirthItem {
  String? wikipedia;
  String? date;
  List<TodayInHistory>? births;

  BirthItem({this.wikipedia, this.date, this.births});

  BirthItem.fromJson(Map<String, dynamic> json) {
    wikipedia = json['wikipedia'];
    date = json['date'];
    if (json['births'] != null) {
      births = [];
      json['births'].forEach((v) {
        births?.add(new TodayInHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wikipedia'] = this.wikipedia;
    data['date'] = this.date;
    if (this.births != null) {
      data['births'] = this.births?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
