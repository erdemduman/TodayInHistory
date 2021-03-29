import 'package:project_th/model/wikipedia.dart';

class TodayInHistory {
  String? year;
  String? description;
  List<Wikipedia>? wikipedia;

  TodayInHistory({this.year, this.description, this.wikipedia});

  TodayInHistory.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    description = json['description'];
    if (json['wikipedia'] != null) {
      wikipedia = [];
      json['wikipedia'].forEach((v) {
        wikipedia?.add(new Wikipedia.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['description'] = this.description;
    if (this.wikipedia != null) {
      data['wikipedia'] = this.wikipedia?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
