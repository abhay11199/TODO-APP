class TodoDataModel {
  int? id = 0;
  String title = '';
  String description = '';
  int time = 0;
  String? status = '';

  TodoDataModel(
      {this.id,
      required this.title,
      required this.description,
      required this.time,
      this.status});

  TodoDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    time = json['time'];
    status = json['status'];
  }

  Map<String, dynamic> tojson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['time'] = time;
    data['status'] = status;

    return data;
  }
}
