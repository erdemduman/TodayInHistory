class Wikipedia {
  String? title;
  String? wikipedia;

  Wikipedia({this.title, this.wikipedia});

  Wikipedia.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    wikipedia = json['wikipedia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['wikipedia'] = this.wikipedia;
    return data;
  }
}
