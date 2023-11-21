class HistoryModel {
  String? wikipedia;
  String? date;
  List<HistoryModelBody>? body;

  HistoryModel({this.wikipedia, this.date, this.body});

  HistoryModel.fromJson(Map<String, dynamic> json, {required String type}) {
    wikipedia = json['wikipedia'];
    date = json['date'];
    if (json[type] != null) {
      body = <HistoryModelBody>[];
      json[type].forEach((v) {
        body?.add(HistoryModelBody.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson({required String type}) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['wikipedia'] = wikipedia;
    data['date'] = date;
    if (body != null) {
      data[type] = body?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HistoryModelBody {
  String? year;
  String? description;
  List<HistoryModelWikipedia>? wikipedia;

  HistoryModelBody({this.year, this.description, this.wikipedia});

  HistoryModelBody.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    description = json['description'];
    if (json['wikipedia'] != null) {
      wikipedia = <HistoryModelWikipedia>[];
      json['wikipedia'].forEach((v) {
        wikipedia?.add(HistoryModelWikipedia.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['year'] = year;
    data['description'] = description;
    if (wikipedia != null) {
      data['wikipedia'] = wikipedia?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HistoryModelWikipedia {
  String? title;
  String? url;

  HistoryModelWikipedia({this.title, this.url});

  HistoryModelWikipedia.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['wikipedia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['wikipedia'] = url;
    return data;
  }
}
